# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/d155af667f0e57277dc992d1b9609d5e6712908d -> deno-2.6.7-d155af6.tar.gz
https://direct.funtoo.org/c2/72/99/c27299e04e7b8e0fbf3dfc079c633c7417d7cbb61f417930e53648917b4f7e9f269c224e7215b8e045e054ba0ec1824a13bb52b95839f9ab4e975e8ea300441b -> deno-2.6.7-funtoo-crates-bundle-c80bae94f30665013cfa2add43071d7dda660f002c06de5c2e58e7cc7840d8a712e5b7470c73d4bb23f31971b7a5553a88baeaca50f48283c622b87567aecb1e.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

BDEPEND="
	sys-devel/llvm:*
	sys-devel/clang:*
	sys-devel/lld:*
	dev-util/gn
	virtual/rust
"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/denoland-deno-* ${S} || die
}

src_compile() {
	# Don't try to fetch prebuilt V8, build it instead
	export V8_FROM_SOURCE=1

	# Resolves to /usr/lib64/llvm/<version>
	export CLANG_BASE_PATH="$(readlink -f -- "$(dirname -- $(clang --print-prog-name=clang))/..")"

	cargo_src_compile
}

src_install() {
	# Install the binary directly, cargo install doesn't work on workspaces
	dobin target/release/deno

	dodoc -r docs
}