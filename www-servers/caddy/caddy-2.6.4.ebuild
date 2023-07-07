# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit fcaps go-module

EGO_SUM=(
)

go-module_set_globals

SRC_URI="https://github.com/caddyserver/caddy/tarball/0db29e2ce9799f652f3d16fd5aed6e426d23bd0a -> caddy-2.6.4-0db29e2.tar.gz"

DESCRIPTION="Fast, cross-platform HTTP/2 web server with automatic HTTPS"
HOMEPAGE="https://caddyserver.com/ https://github.com/caddyserver/caddy"

LICENSE="Apache-2.0 BSD ECL-2.0 MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""

post_src_unpack() {
	mv ${WORKDIR}/caddyserver-* ${S} || die
}

src_compile() {
	go build -mod=mod ./cmd/caddy || die "compile failed"
}

src_install() {
	dobin ${PN}
	dodoc README.md
}

pkg_postinst() {
	fcaps cap_net_bind_service=eip /usr/bin/caddy
}