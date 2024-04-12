# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/a64a257024c9933d90494613ac6b302cc69df6fa -> deno-1.42.3-a64a257.tar.gz
https://direct.funtoo.org/8e/b6/4f/8eb64f76551a6daec17a39dd9f748f7b1ee1739cccdb2b9ba897fa81c1f4650d31ce92c71a8d7551ae9a4082aed86ccb44f93ef58b070900db8894e549361222 -> deno-1.42.3-funtoo-crates-bundle-83dd6a763f4aabe53b7e6852491116eae4ab059ea86277d108c09a625f7c52b1ff6c6ea73849855b03f07219934ea2e73ecd2aa0b898039656551faa36343f5b.tar.gz"

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