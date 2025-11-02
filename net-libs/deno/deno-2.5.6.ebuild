# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/1b5f3112af364a3327b26f720746819c4f20f20d -> deno-2.5.6-1b5f311.tar.gz
https://direct.funtoo.org/3c/77/6e/3c776e59996f5df50a2f406bca60b555f02f96dbf5dfbcc7e2370d4e6f45039ceaf42b6fa08f6cf47c4d8c97541040834de51b09cfb1f5e51058b8c8110b5c0f -> deno-2.5.6-funtoo-crates-bundle-a99b19d7bbddb6a77125a2a728ef41a97c9a1eab4a4b488b104c792cf828b89c17a6704b3fce6eabcfb3566f791f72350f69dff10fbd34f7f18a766c0b5544a9.tar.gz"

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