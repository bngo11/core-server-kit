# Distributed under the terms of the GNU General Public License v2

EAPI=7

PHP_EXT_NAME="pam"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
PHP_EXT_ECONF_ARGS=( --with-pam=/usr )
DOCS=( README )

USE_PHP="php7-4 php8-0 php8-1 php8-2"

inherit php-ext-pecl-r3 pam

KEYWORDS="*"

SRC_URI="https://github.com/amishmm/php-pam/tarball/b667226570f439c5b1362a54d1e5606aff617e44 -> php-pam-3.0.1-b667226.tar.gz"

DESCRIPTION="This extension provides PAM (Pluggable Authentication Modules) integration"
LICENSE="PHP-3.01"
SLOT="0"
IUSE=""

DEPEND="sys-libs/pam"
RDEPEND="${DEPEND}"

post_src_unpack() {
    if [ ! -d "${S}" ] ; then
        mv ${WORKDIR}/amishmm-* ${S} || die
    fi
}

src_prepare() {
	#Fix DOS line endings
	sed -i 's/\r$//' -- pam.c || die
	php-ext-source-r3_src_prepare
}

src_install() {
	pamd_mimic_system php auth account password
	php-ext-pecl-r3_src_install
}