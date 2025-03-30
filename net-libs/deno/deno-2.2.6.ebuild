# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/2037200c4bc903162cd16b71b2564ab5bcd0601e -> deno-2.2.6-2037200.tar.gz
https://direct.funtoo.org/55/27/07/55270738f6e3c54db013209b924f5e4a94907691ea13c62c179e8d13866125fdfb5b36c8ddf13cd6c46f16de8333568191c8882ec7d9070a10fcf35bf2e6ad95 -> deno-2.2.6-funtoo-crates-bundle-a3e67b7cec010d0197485df5a99b2e268abe42a1536978884d0184109efcba56ac881aea314b4aff71b7dc0f344e781405dfbc5265771f27db27d709f340c231.tar.gz"

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