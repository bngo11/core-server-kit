# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd tmpfiles autotools

DESCRIPTION="Rotates, compresses, and mails system logs"
HOMEPAGE="https://github.com/logrotate/logrotate"
SRC_URI="https://api.github.com/repos/logrotate/logrotate/tarball/3.21.0 -> logrotate-3.21.0.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="acl +cron selinux systemd"

DEPEND=">=dev-libs/popt-1.5
	selinux? ( sys-libs/libselinux )
	acl? ( virtual/acl )"
RDEPEND="${DEPEND}
	selinux? ( sec-policy/selinux-logrotate )
	cron? ( virtual/cron )"

STATEFILE="${EPREFIX}/var/lib/misc/logrotate.status"
OLDSTATEFILE="${EPREFIX}/var/lib/logrotate.status"

PATCHES=(
	"${FILESDIR}/${PN}-3.15.0-ignore-hidden.patch"
)

move_old_state_file() {
	elog "logrotate state file is now located at ${STATEFILE}"
	elog "See bug #357275"
	if [[ -e "${OLDSTATEFILE}" ]] ; then
		elog "Moving your current state file to new location: ${STATEFILE}"
		mv -n "${OLDSTATEFILE}" "${STATEFILE}" || die
	fi
}

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv logrotate-logrotate* "${S}" || die
	fi
}

src_prepare() {
	default

	sed -i -e 's#/usr/sbin/logrotate#/usr/bin/logrotate#' examples/logrotate.{cron,service} || die
	eautoreconf
}

src_configure() {
	econf \
		$(use_with acl) \
		$(use_with selinux) \
		--with-state-file-path="${STATEFILE}"
}

src_test() {
	emake test
}

src_install() {
	dobin logrotate
	doman logrotate.8
	dodoc ChangeLog.md

	insinto /etc
	doins "${FILESDIR}"/logrotate.conf

	if use cron; then
		exeinto /etc/cron.daily
		newexe "${S}"/examples/logrotate.cron "${PN}"
	fi

	use systemd && systemd_dounit examples/logrotate.{service,timer}
	newtmpfiles "${FILESDIR}"/${PN}.tmpfiles ${PN}.conf

	keepdir /etc/logrotate.d
}

pkg_postinst() {
	elog
	elog "The ${PN} binary is now installed under /usr/bin. Please"
	elog "update your links"
	elog

	move_old_state_file

	tmpfiles_process ${PN}.conf

	if [[ -z ${REPLACING_VERSIONS} ]] ; then
		elog "If you wish to have logrotate e-mail you updates, please"
		elog "emerge virtual/mailx and configure logrotate in"
		elog "/etc/logrotate.conf appropriately"
		elog
		elog "Additionally, /etc/logrotate.conf may need to be modified"
		elog "for your particular needs. See man logrotate for details."
	fi
}