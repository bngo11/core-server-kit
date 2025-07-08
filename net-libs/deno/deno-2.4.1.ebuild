# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/c03199ea1e4e22d44aad0deafc634be82e5b841b -> deno-2.4.1-c03199e.tar.gz
https://direct.funtoo.org/f0/e1/20/f0e120f60afdcf946b3d67343eedae1efe64950af08cddf627fc26b4f9775b117ef6545809904e1177ef7188258017b39cde6a88e5d36324c39e32e8db37fee9 -> deno-2.4.1-funtoo-crates-bundle-d1eff59e2318fb3582fc11d23a003b8e61d4d2887f01376194864d3614cb6c8404a26897d0f2c086b753a0e1237cb10b45afdd72f4f8977ea1e06cf02cb81f44.tar.gz"

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