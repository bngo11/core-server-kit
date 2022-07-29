# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )

inherit flag-o-matic python-single-r1 systemd toolchain-funcs

MY_P="unit-${PV}"
DESCRIPTION="Dynamic web and application server"
HOMEPAGE="https://unit.nginx.org"
SRC_URI="https://github.com/nginx/unit/tarball/3d1fa29f1d03e392df534b6589d3e1d2ed883671 -> unit-1.27.0-3d1fa29.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
MY_USE="perl python ruby"
MY_USE_PHP="php7-4 php8-0 php8-1"
IUSE="${MY_USE} ${MY_USE_PHP} ssl"
REQUIRED_USE="|| ( ${IUSE} )
	python? ( ${PYTHON_REQUIRED_USE} )"

DEPEND="perl? ( dev-lang/perl:= )
	php8-1? ( dev-lang/php:8.1[embed] )
	php8-0? ( dev-lang/php:8.0[embed] )
    php7-4? ( dev-lang/php:7.4[embed] )
	python? ( ${PYTHON_DEPS} )
	ruby? (
		dev-lang/ruby:=
		dev-ruby/rubygems:=
	)
	ssl? ( dev-libs/openssl:0= )
	virtual/libcrypt:0="
RDEPEND="${DEPEND}"


post_src_unpack() {
        if [ ! -d "${S}" ]; then
                mv nginx-unit* "${S}" || die
        fi
}

pkg_setup() {
        use python && python-single-r1_pkg_setup
}

src_configure() {
        ./configure \
                --control=unix:/run/${PN}.sock \
                --ld-opt="${LDFLAGS}" \
                --log=/var/log/${PN} \
                --modules=$(get_libdir)/${PN} \
                --pid=/run/${PN}.pid \
                --prefix=/usr \
                --state=/var/lib/${PN} || die "Core configuration failed"
        for flag in ${MY_USE} ; do
                if use ${flag} ; then
                        ./configure ${flag} || die "Module configuration failed: ${flag}"
                fi
        done
        for flag in ${MY_USE_PHP} ; do
                if use ${flag} ; then
                        local php_slot="/usr/$(get_libdir)/${flag/-/.}"
                        ./configure php \
                                --module=${flag} \
                                --config=${php_slot}/bin/php-config \
                                --lib-path=${php_slot}/$(get_libdir) || die "Module configuration failed: ${flag}"
                fi
        done
}

src_install() {
        default
        diropts -m 0770
        keepdir /var/lib/${PN}
        newinitd "${FILESDIR}/${PN}.initd" ${PN}
}