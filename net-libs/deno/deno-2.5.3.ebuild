# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/1c3d04cfaf50a4a0db7a1925c0a73af5ea89bc69 -> deno-2.5.3-1c3d04c.tar.gz
https://direct.funtoo.org/d8/98/20/d89820951fb350769151f18d35fbfe7f9568ad952ac0ee9c5f0aee0d12158efa711b88f9c1a761141cb620f4cb2023eec0e90274bad3c3c1cc83e92c6209ef09 -> deno-2.5.3-funtoo-crates-bundle-970becf0226f4f583c7006839e3346b47650cb5bb2937c655acd2cde8b72ccf03c56dd5a69192c6d56f89bcb7cfd94bd13c52527297b2304193a89dd5e8e6917.tar.gz"

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