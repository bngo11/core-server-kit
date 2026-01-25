# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/b9b87a6bfb61a5d8855ee1578620ac3a9393b6bb -> deno-2.6.6-b9b87a6.tar.gz
https://direct.funtoo.org/85/50/0b/85500b493455f5a5c70bae2bb85220e3cda378c165272c36a8825c2a0c6241c14a0fdf4bcc0c800b20f398c97e84a68087418230ffadff7ba36fd2d9a637d2b8 -> deno-2.6.6-funtoo-crates-bundle-533e059c87db36ca4018df316385a0d926428272d4c36c90d726d9fadd32562f1fa4c55d36aaad95a0985eae1794cea7eeb51fb6c033a883a10786807a613f9b.tar.gz"

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