# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/4794dc147e51c75cfa501d39da72cbd0ecb9b068 -> deno-2.3.5-4794dc1.tar.gz
https://direct.funtoo.org/8b/2c/d9/8b2cd9c38d7f7f64c2a4d116c1aa76e2106edbc796ace4c47644673a7a28c99107b516206b24da906613e1071271b27290af0ec79351e3f03161afbf92d5eb65 -> deno-2.3.5-funtoo-crates-bundle-17eb7721b562101853a5f10e51afd8013b0a23c9dab2398b545cf6d22d0e75f5b3b68ffcfd9220db461076f19135d08a6fb33ceff220fdc957ab69fb1993d5e6.tar.gz"

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