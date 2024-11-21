# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/3da4eca7c1ed97906654671669e0bb3b095bc637 -> deno-2.1.0-3da4eca.tar.gz
https://direct.funtoo.org/5a/c7/be/5ac7befc38d07dadc156f5303d1a62de3a5cc2bf46a23aeb73114842486e05e124f084f6843680836c05f12d24bcb7e18ba43368a8b5810be028f54421c36190 -> deno-2.1.0-funtoo-crates-bundle-d45789f363419908ed3a44171eb23c6530993fabebf9fe6af85ddf488571e962ed85d049faea70bafa3191bb57848a4ac4b99173aeebd97ef9c4f443a36e187d.tar.gz"

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