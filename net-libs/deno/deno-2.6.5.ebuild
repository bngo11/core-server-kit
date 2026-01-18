# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/c356d9a621fccad5047497238039cde10613b278 -> deno-2.6.5-c356d9a.tar.gz
https://direct.funtoo.org/57/4d/5c/574d5cf4b1f2ebdb66899732c951b322f64aa9b2ee65a36febdf5bb809e907aa03a3595a690263c37ffdb701ab2c0a0b73ddce8cd8bbf11c4533e7fee03be5e0 -> deno-2.6.5-funtoo-crates-bundle-fbc2380edd553d223a5fdeba4c3ead194fd17f257b0b5c90332a390f85a351cb9237e4d3a094496db7518b3fab15bca84c0bcaa397f2842b18da8170feff4240.tar.gz"

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