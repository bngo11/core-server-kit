# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/32b9cc91d8c343bdec2ddcf3cedb27b5efc2f5e4 -> deno-2.2.8-32b9cc9.tar.gz
https://direct.funtoo.org/f8/70/10/f87010d9e2d20f2905038b6932dc0ee5f4b2e516ee6549a8efc8976d489a6f39849780344e3440e040aeee1a9c47aec6033ca4c61d1caa5981d8632e93ed5171 -> deno-2.2.8-funtoo-crates-bundle-315afcf6c9287d18882e91fc6f684f420857d8483412bbb7381c006facf22d569ee9c0a0ea8209ee8868b239d613d395ab1cdd02b3717fd5394d44091f8719ff.tar.gz"

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