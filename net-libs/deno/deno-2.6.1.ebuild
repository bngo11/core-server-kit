# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/1ba09320aa4ef7362ec33ec332e6e6d38c75d2b5 -> deno-2.6.1-1ba0932.tar.gz
https://direct.funtoo.org/89/a7/91/89a791614c38f299ef07bbb99a7f28463992840553d8820ef1fccbabdb74f58aaea2ca76f1136e46b825289b86ae7ecebf2f736b10ae702e377e187c7f0071a4 -> deno-2.6.1-funtoo-crates-bundle-99cf4c04e26797094b67e42dcbd1b2f50b3b73e61e4570ffbe08fcf962809e7742bca777070c2a38063cf938666a2a2557636f781fb636e1c165060d880b88f1.tar.gz"

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