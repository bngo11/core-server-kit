# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/997bd47fc27ad920f3388c94a95829ff45394c84 -> deno-2.0.3-997bd47.tar.gz
https://direct.funtoo.org/e4/81/f3/e481f3c711bb0d0225ad8b36b940d62054755256cacaa5aba44a9f3f6153210d2bd772572ccd2c4c9d2d5a6ecab9241f6846b119fb5ae1af89215ccf03b3aa5d -> deno-2.0.3-funtoo-crates-bundle-baca7a0b2c8ddc21f20f4a04c986322fd7af0044938a4f848c58a70db76e839bd879bcf2346735e20aef33ce65446c625f68e169049390e6b5d258d0402f17c9.tar.gz"

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