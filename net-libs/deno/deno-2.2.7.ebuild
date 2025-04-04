# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/e7dab411533fd7240fd794398ba9d9590e28f69d -> deno-2.2.7-e7dab41.tar.gz
https://direct.funtoo.org/57/33/98/573398225dc4d6f52e0791aa103f9f80bb896214868e6552d58328ccc51b6ff8e6eae3b0e53cb98e48c881152fc8d0465d511df06da700e50031e95f3992b686 -> deno-2.2.7-funtoo-crates-bundle-2526605765230d16d7905c48b9e039520ce1650ac6e2e11298a04a729c0a9d5366b0806145326638f4fd3aaabcbf196af617d53d3ff6e6af7d0ba7785d2ebdd0.tar.gz"

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