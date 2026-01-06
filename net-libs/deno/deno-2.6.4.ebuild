# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/658638b3262a90c3e92fe96887fd898b5b1a78d7 -> deno-2.6.4-658638b.tar.gz
https://direct.funtoo.org/30/b2/0c/30b20c7df98b0beafcdf2fd1be01f7bc05dffeed38e5a21aa542313e030bfb047b0f9f9ec8920dbf076c2c9647b9b15d6d5dd272106ce4fd0aaa91de0c2f51ca -> deno-2.6.4-funtoo-crates-bundle-360d7708f02613e6895df544cd85a38df1e0b49bba03aa7689e29af1d94748c48dc914497585a9f6a6e766ce6cf78e26c614eed291ff04eb3f48af39b1621045.tar.gz"

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