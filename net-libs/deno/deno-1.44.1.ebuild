# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/e02a32be2797f7c107d19da8bf2aff5bbcd97bad -> deno-1.44.1-e02a32b.tar.gz
https://direct.funtoo.org/e7/4f/73/e74f73ed3a0c4134699c0d2f0f70d99d51e043e7bb3d3d6753fe7303b289f459f2c600ca4de4db3fdf4a914235af2b36d256980eca584c030c3915dad3b50dfa -> deno-1.44.1-funtoo-crates-bundle-4fa9e0c2fb44566442c5bfeacadbcb8605714a790a57b963ac6d7681e33978670540c9b82022034d6dbd572e2707e8244089e96ed99e014156f9bef2388b0ee4.tar.gz"

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