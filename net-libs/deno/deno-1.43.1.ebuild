# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/5ff881a0737eccceed55a0ace3ef3110d5b72b2f -> deno-1.43.1-5ff881a.tar.gz
https://direct.funtoo.org/04/17/f0/0417f07a15399722d0a2007825cd7cf5dc0eaa4b9b7dbd8cba6482ac9d37c49892361721297aa8a6472d5ddadac56bf1ca470645f7cc498eb4570d2c4d29d4e5 -> deno-1.43.1-funtoo-crates-bundle-1b3e2fdf9c8b22d8dd17fdb78482ac75dea2c040ba2f920aba830ec1002532592cf109fbf89d4318b3713a4f1a48fac56235cc849a082ba6386c9e0eb2f3806c.tar.gz"

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