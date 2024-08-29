# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
PYTHON_REQ_USE="threads(+)"
DISTUTILS_USE_PEP517=setuptools

inherit waf-utils python-single-r1

DESCRIPTION="Samba talloc library"
HOMEPAGE="https://talloc.samba.org/"
SRC_URI="https://www.samba.org/ftp/talloc/talloc-2.4.2.tar.gz -> talloc-2.4.2.tar.gz"

LICENSE="GPL-3 LGPL-3+ LGPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="compat +python"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT="test"

RDEPEND="!elibc_FreeBSD? (
			!elibc_SunOS? (
				!elibc_Darwin? (
					dev-libs/libbsd
				)
			)
		)
	python? ( ${PYTHON_DEPS} )
	!!<sys-libs/talloc-2.0.5"
DEPEND="${RDEPEND}
	sys-devel/gettext
	dev-libs/libxslt
	${PYTHON_DEPS}"

WAF_BINARY="${S}/buildtools/bin/waf"

pkg_setup() {
	# try to turn off distcc and ccache for people that have a problem with it
	export DISTCC_DISABLE=1
	export CCACHE_DISABLE=1

	python-single-r1_pkg_setup
}

src_configure() {
	export PYTHONHASHSEED=1
	local extra_opts=(
		$(usex compat --enable-talloc-compat1 '')
		$(usex python '' --disable-python)
		$([[ ${CHOST} == *-solaris* ]] && echo '--disable-symbol-versions')
	)
	waf-utils_src_configure "${extra_opts[@]}"
}

src_compile() {
	waf-utils_src_compile
}

src_install() {
	waf-utils_src_install

	# waf is stupid, and no, we can't fix the build-system, since it's provided
	# as a brilliant binary blob thats decompressed on the fly
	if [[ ${CHOST} == *-darwin* ]] ; then
		install_name_tool \
			-id "${EPREFIX}"/usr/$(get_libdir)/libtalloc.2.dylib \
			"${ED}"/usr/$(get_libdir)/libtalloc.2.0.5.dylib || die
		if use python ; then
			install_name_tool \
				-id "${EPREFIX}"/usr/$(get_libdir)/libpytalloc-util.2.dylib \
				"${ED}"/usr/$(get_libdir)/libpytalloc-util.2.0.5.dylib || die
			install_name_tool \
				-change "${S}/bin/default/libtalloc.dylib" \
					"${EPREFIX}"/usr/$(get_libdir)/libtalloc.2.dylib \
				"${ED}"/usr/$(get_libdir)/libpytalloc-util.2.0.5.dylib || die
			install_name_tool \
				-change "${S}/bin/default/libtalloc.dylib" \
					"${EPREFIX}"/usr/$(get_libdir)/libtalloc.2.dylib \
				"${D}"$(python_get_sitedir)/talloc.bundle || die
		fi
	fi
}