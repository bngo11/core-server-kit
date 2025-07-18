# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/622c3513936c1614ee316516a31343729c3c4367 -> deno-2.4.2-622c351.tar.gz
https://direct.funtoo.org/de/7f/e6/de7fe6b7aab333da59790b16ad8fbd59b799f36911cb1ef2297a864ec779ab2e641d736ab145bb53da3c57c828899d334ae77bf72e343c7ab0b5e31406433b0c -> deno-2.4.2-funtoo-crates-bundle-ec21699d761fc37ebc731cabcdb08af17e9a41740a1ef8ef627ae97596ed0a98f6db806452db3fd2ae213b09ceb8b74e43b52a5734b4f812362ec06ae1ea50d7.tar.gz"

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