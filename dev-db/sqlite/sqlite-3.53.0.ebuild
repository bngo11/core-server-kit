# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit autotools flag-o-matic multilib-minimal toolchain-funcs

# This works, but autogen makes it unnecessary to work out
# MY_PV="$(printf "%u%02u%02u%02u" $(ver_rs 1- " "))"
MY_PV=3530000

S="${WORKDIR}/${PN}-src-${MY_PV}"
DESCRIPTION="SQL database engine"
HOMEPAGE="https://sqlite.org/"

# On version updates, make sure to read the forum (https://sqlite.org/forum/forum)
# for hints regarding test failures, backports, etc.
SRC_URI="https://sqlite.org/2026/sqlite-src-3530000.zip -> sqlite-src-3530000.zip
doc? ( https://sqlite.org/2026/sqlite-doc-3530000.zip -> sqlite-doc-3530000.zip )
"

LICENSE="public-domain"
SLOT="3"
KEYWORDS="*"
IUSE="debug doc icu +readline secure-delete static-libs tcl test tools"
RESTRICT="!test? ( test )"

BDEPEND="app-arch/unzip
	>=dev-lang/tcl-8.6:0"
RDEPEND="sys-libs/zlib:0=[${MULTILIB_USEDEP}]
	icu? ( dev-libs/icu:0=[${MULTILIB_USEDEP}] )
	readline? ( sys-libs/readline:0=[${MULTILIB_USEDEP}] )
	tcl? ( dev-lang/tcl:0=[${MULTILIB_USEDEP}] )
	tools? ( dev-lang/tcl:0= )"
DEPEND="${RDEPEND}
	test? ( >=dev-lang/tcl-8.6:0[${MULTILIB_USEDEP}] )"


src_prepare() {
	eapply_user
	multilib_copy_sources
}

multilib_src_configure() {
	local -x CPPFLAGS="${CPPFLAGS}" CFLAGS="${CFLAGS}"
	econf "--enable-all"
}

multilib_src_compile() {
	emake TCLLIBDIR="${EPREFIX}/usr/$(get_libdir)/${P}"

	if use tools && multilib_is_native_abi; then
		emake changeset dbdump dbhash dbtotxt index_usage rbu scrub showdb showjournal showshm showstat4 showwal sqldiff sqlite3_analyzer sqlite3_checker sqlite3_expert sqltclsh
	fi
}

multilib_src_test() {
	if [[ "${EUID}" -eq 0 ]]; then
		ewarn "Skipping tests due to root permissions"
		return
	fi

	local -x SQLITE_HISTORY="${T}/sqlite_history_${ABI}"

	emake $(use debug && echo fulltest || echo test)
}

multilib_src_install() {
	emake DESTDIR="${D}" HAVE_TCL="$(usex tcl 1 0)" TCLLIBDIR="${EPREFIX}/usr/$(get_libdir)/${P}" install

	if use tools && multilib_is_native_abi; then
		install_tool() {
			if [[ -f ".libs/${1}" ]]; then
				newbin ".libs/${1}" "${2}"
			else
				newbin "${1}" "${2}"
			fi
		}

		install_tool changeset sqlite3-changeset
		install_tool dbdump sqlite3-db-dump
		install_tool dbhash sqlite3-db-hash
		install_tool dbtotxt sqlite3-db-to-txt
		install_tool index_usage sqlite3-index-usage
		install_tool rbu sqlite3-rbu
		install_tool scrub sqlite3-scrub
		install_tool showdb sqlite3-show-db
		install_tool showjournal sqlite3-show-journal
		install_tool showshm sqlite3-show-shm
		install_tool showstat4 sqlite3-show-stat4
		install_tool showwal sqlite3-show-wal
		install_tool sqldiff sqlite3-diff
		install_tool sqlite3_analyzer sqlite3-analyzer
		install_tool sqlite3_checker sqlite3-checker
		install_tool sqlite3_expert sqlite3-expert
		install_tool sqltclsh sqlite3-tclsh

		unset -f install_tool
	fi
}

multilib_src_install_all() {
	find "${ED}" -name "*.la" -delete || die

	doman sqlite3.1

	if use doc; then
		pushd "${WORKDIR}/${PN}-doc-${MY_PV}" > /dev/null || die

		find "(" -name "*.db" -o -name "*.txt" ")" -delete || die
		rm search search.d/admin || die
		rmdir search.d || die
		find -name "*~" -delete || die

		(
			docinto html
			dodoc -r *
		)

		popd > /dev/null || die
	fi
}