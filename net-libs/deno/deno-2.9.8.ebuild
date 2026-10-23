# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/fe7ed012d92c642fd8e5607ac5a45d517538b5c5 -> deno-2.9.8-fe7ed01.tar.gz
https://direct.funtoo.org/7f/44/12/7f44120a6f424c74fa5248d31dc7cf3a6716873b0965408e5663d1bc065dcdffe1414e8b761bff1541fed0c2a55898700d37f0b13aa8cd7867192c1f2c538ebf -> deno-2.9.8-funtoo-crates-bundle-89ff857d2d39f3f7d1cf3b8073bdc9609613b155a9cbe337ba10458758bb7ceafbd839c9841ccfb3360ea967e5544f167eef43f12a4a08c27c5dc92dc8dd265e.tar.gz"

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