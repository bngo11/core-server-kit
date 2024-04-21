# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/7cb23c5e3ee0b6c416f4c0e34c7c63fdf5024138 -> deno-1.42.4-7cb23c5.tar.gz
https://direct.funtoo.org/70/2a/8b/702a8b9ac6cfd495ed9b4d287e7cebea6fbd775da15135fcce90d3ebccaafeb46a57db2afa3cc47056872257eecc34bdf7e501a3cde9a48b6b5ed51133f0e0e6 -> deno-1.42.4-funtoo-crates-bundle-a26151ca2e4e22af06f2848944b9797b9a2bd74c9afd8d77bc83501b33a3073e70f6e303af48a916052e478377fbf8f8fb6901e1eba58b38fbea5c90907cb84e.tar.gz"

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