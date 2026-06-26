# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/94d375ddd02b7b9eb464781e4bd9e68bf262aacc -> deno-2.9.0-94d375d.tar.gz
https://direct.funtoo.org/b6/09/bb/b609bbcd5af9a3d20fba7a2039f391a0f8b0d14b39841de61218d9ffad83586986915cb49c32dc0fc2db3e418c7cdd1607e01fd5c9ba61934deed1fc411f6fec -> deno-2.9.0-funtoo-crates-bundle-eac80cf70b46362b0cc69ce88b28420b0bb7c8a38eea11e2fb9a8246ddf754c98669aa2d3703a68df346d8ffc0c2372731d66f140987f4973752ded6a000438d.tar.gz"

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