# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/8fa9085f90849222bd56facddc16ac288c8ee62e -> deno-2.7.7-8fa9085.tar.gz
https://direct.funtoo.org/57/6d/a2/576da2abd8a79c29715b0cca78380582785f7c1fab09a9011023014c88056a7c7d3c509af337179eba05f3b5378bbfc1610a6bf3a78297384990d8e3807e9441 -> deno-2.7.7-funtoo-crates-bundle-42bd501b3a017fed08e9fba442dae11c306c44321877d0c52180ebc4c45fdfe0788180b74be9c3437f4ab06b79b2656f4d54ecf26adff58116dcee5b797bff42.tar.gz"

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