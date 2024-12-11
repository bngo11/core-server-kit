# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/b32ed7516cfdaaff76203ca530796d6a1235568d -> deno-2.1.4-b32ed75.tar.gz
https://direct.funtoo.org/98/86/4a/98864ac6bfbe89c85f55d867aa6da884549b9b90bd30229f8b0d0a8f0730a6e3d7dd1cd0dd17c36554aaffa0d6401f71c181f9660fa65d293ac52e41ba9f6fa0 -> deno-2.1.4-funtoo-crates-bundle-28298c27a315794e549d6588ef76d384e80247971c1b086c1d00216386fd92d06c1203c8c1633ae90d3198f0df73e67eeb79dbcfb0314e096015da539ebc9a31.tar.gz"

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