# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/6fbce91e40cc07fc6da74068e5cc56fdd40f7b4c -> deno-2.5.4-6fbce91.tar.gz
https://direct.funtoo.org/1c/ee/9d/1cee9d0532b79f4404dc78de7221044165e6f876f52c7ee0ac27ab5fa5a913b4a32849d691ab124622b5d9e919586c58c8d498c3ffd66e4154d40d918e948667 -> deno-2.5.4-funtoo-crates-bundle-3247ae89d2241a4ee3929e1a25ed7881b871ad348d3196af41e75566235ec7ed9abec7862b57415939fae97362eb3b22be656dc82d1f68b067b7d1d88f565499.tar.gz"

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