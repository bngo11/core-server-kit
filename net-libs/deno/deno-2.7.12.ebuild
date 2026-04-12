# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/825d2647dd0728723623623b6c7b00da7ddad10d -> deno-2.7.12-825d264.tar.gz
https://direct.funtoo.org/ac/04/a3/ac04a3a83c4e8264bc3be46a6b9f112ea69876208e01d292fbbdb809f9a46ea4b493fbb883a85accef30e71421f19ded89c570609de16d7150f1dc93e17a81ad -> deno-2.7.12-funtoo-crates-bundle-59c5b889e5fa73d113f7ebedc0f669327b3f43c913b90b7cc8bbcea28543e5ce3ff19e71ce83ae2ea5a12d9bad653babaed9b982654d43062556c9ec3f313ba5.tar.gz"

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