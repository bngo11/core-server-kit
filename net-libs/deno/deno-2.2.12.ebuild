# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/81da8139af85a0cb7efa9050ae6b5461b3614077 -> deno-2.2.12-81da813.tar.gz
https://direct.funtoo.org/39/29/36/392936b26fbbb4719136349c8d1d06c9070850f7efd4bc9707ad8bfbd9b9e0d9767853d8ad37d7a11acca42f6a9bb587edf9bd12230993a646e9568d07a91aa2 -> deno-2.2.12-funtoo-crates-bundle-241c2f2d9a0f9dff09eb1d572b2414d3f6ee57989917127f3b124ff6a4f90d242ecf5ccd86b030fc0eb029043fad8d540b52ff6454a6ac63c889bb353456cf89.tar.gz"

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