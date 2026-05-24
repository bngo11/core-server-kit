# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/fbb5be31ac23ef40f51025d6aeaaa91d9f082e4a -> deno-2.8.0-fbb5be3.tar.gz
https://direct.funtoo.org/5e/29/53/5e2953e210e1d34e47fa32248f33521b5889757b05c013a98c8b063729c7ff3035b9a7e89f03d05387ce94143423effec24bf97bf352df34fff4b97c6800e41c -> deno-2.8.0-funtoo-crates-bundle-56f7f0c79e7a27d7b7e08ab9f8322462d726ed9db9a51695157a8e55960fadc73cc2deecd7c2e4efcf6726259c44b7aaecdc6f16900f81eaf0541ec9bab6e83e.tar.gz"

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