# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/395878c5fb72d87a44f7c88ce9f391acc31feab3 -> deno-2.3.3-395878c.tar.gz
https://direct.funtoo.org/fd/69/ff/fd69ff761a1670b71ecc7a796de8a1ae46d452e3fe93963d4bdc5b07785498f13f35c3e74a22ffeca58185a00f73761bc607f52afab4f07ad3b6024007cd1b7c -> deno-2.3.3-funtoo-crates-bundle-a042f296d2c684eb04abf123b63d799589dd972630c0b379a156a3204986153f252c45f0e70e6c6eb8ad69c8036560b9c200080b02c2c9dfe2013fc7cb6656a7.tar.gz"

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