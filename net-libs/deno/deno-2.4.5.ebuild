# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/b7061b0f64b3c79b312de5a59122b7184b2fdef2 -> deno-2.4.5-b7061b0.tar.gz
https://direct.funtoo.org/d0/5b/94/d05b94af35168bc07ed1051d17118bc4a384339eef45dec77d413831f06542c39f6ced46b976b6affe85b53a28c23c75d9a59c1850d839735c8905b35b1ed883 -> deno-2.4.5-funtoo-crates-bundle-e306746d3c9223d99740a3b57237a4a298108d186a20a2210a1c63a34c66b332221e592cc2f374e93ebe31b319211aadf76c471cc34cbd8ed034afb3683f4600.tar.gz"

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