# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/892e7c20ac6e7bc0601f4c23e64f43187c1b8479 -> deno-1.44.4-892e7c2.tar.gz
https://direct.funtoo.org/75/db/95/75db9594fd6b77950095fce925526818c3689aeceb6d3b1e553e45414cca9a5dc29bd62bc30e2f7a0b10a1521fe3cb958ed2edd398fa9986e322caecad3e3414 -> deno-1.44.4-funtoo-crates-bundle-783469b0caf4d7c7ae5e690157ad80d65fc603d1889de302c5e01db0854529c3e7c3ca9a92fe1d20ccc1d7af467562581589742dabe32de3e8f664bceff90952.tar.gz"

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