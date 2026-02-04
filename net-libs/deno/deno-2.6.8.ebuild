# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/7ab62a769be154c0926fe8be640d48674eb79614 -> deno-2.6.8-7ab62a7.tar.gz
https://direct.funtoo.org/99/2f/08/992f08a0e09ea3422ed230e827dcc1ece58ac33dd1705075689190ead86572740fd243519db00352d93c357d235424a3be5c5858a1367333f54cdea3eb1528a8 -> deno-2.6.8-funtoo-crates-bundle-f9141055506878eebc6210fb9a2a94e5fe582678c69f7cc63af7a99bb9c4891ace27207551117150d61e472e36aef32c47f54b5aaceb77f8dcae73a9f1a6df7f.tar.gz"

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