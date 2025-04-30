# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/8773b5f5b074e1e374a403d05943b6a7bbbdebad -> deno-2.3.1-8773b5f.tar.gz
https://direct.funtoo.org/60/a4/d6/60a4d65e1e5584a46a28235cb93186191470d6ded8c82cf89607d7ee7ab6a00af2428473cb7f8bd75e4154775a3448ee7815969e585d0964b857c37f91413620 -> deno-2.3.1-funtoo-crates-bundle-8cc0ba2239f56dc33b030c204ccb451dd42d4dc0bdf223e053f15a49632b43940987e03087084d679d069941d0e1d6456b278e861a42fc583bf165ad804c346d.tar.gz"

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