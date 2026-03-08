# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/8274bf758236405d50046dbe31beba96b6d3d2f6 -> deno-2.7.4-8274bf7.tar.gz
https://direct.funtoo.org/ad/a0/d0/ada0d09a64f9704da96d13c220797c9b880ecaa0a46957fe892b6b96986b81ccf7aec1196580313e355f9882aef58d3d9ecf979881d6c990e4823584f993ca03 -> deno-2.7.4-funtoo-crates-bundle-aa721cd4188033c111df25134e9a93e271d32e4a4654526b56074a9e100f897cd447be229ab2926bc87618c3ad02909e831f8fa69aed38ca81c9adde7e891698.tar.gz"

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