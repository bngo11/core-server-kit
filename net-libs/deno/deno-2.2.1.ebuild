# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/6057bc30da1df2b247f584b5280e1f10c02eec75 -> deno-2.2.1-6057bc3.tar.gz
https://direct.funtoo.org/70/93/3f/70933f994f9107b8389bf9586b49beed950a7c66be71e01428a105be2668d523b4fc57f3334fc7e27abca28c44bddcbcf3b180d2cbab2b43fa0c60220d9798d3 -> deno-2.2.1-funtoo-crates-bundle-720afb614757b5ab43d50a42a8f7c6718045ed21f1bfe975b22862056b9c45e4bd6898ddc71dec865f00884fb410f8832ca57842a0a83d11c0c3a12e6690c6e3.tar.gz"

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