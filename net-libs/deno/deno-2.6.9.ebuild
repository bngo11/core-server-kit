# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/7a9888857e01c02417fd38144d4bf0ace73eb6ab -> deno-2.6.9-7a98888.tar.gz
https://direct.funtoo.org/a7/c0/dc/a7c0dc2831a86020c6c1e0f9ae8cd513fa9eedee03338f78c54a94198b5a2a821901aacddac2398ae5779d589d67f7560b25f7115a70d43bd426a223913f77aa -> deno-2.6.9-funtoo-crates-bundle-6011d5afcab09b515df5a41a2800aae20c31b1bbb8ab87e0ebbfde8946909b6e391a5ff1b9c97433fc07a0e176c495b7583f20348913b1a262aa353a5b281add.tar.gz"

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