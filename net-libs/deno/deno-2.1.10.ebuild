# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/073e0879791486f70c7ac99d2d100c3fca6ac461 -> deno-2.1.10-073e087.tar.gz
https://direct.funtoo.org/a9/df/d8/a9dfd88222640a8cc09a3015136154e744172ecf7107e8225edf2ae8ab0ead74a6b5888751da90fda653bba5937095f04cf73e60301bcd8bc067d855688ebbd9 -> deno-2.1.10-funtoo-crates-bundle-3580ce52e3605f6d7192f170dc874b1bf8b0f4592b7a6d1058b0f62e12a77676f3ada4b1f5fb0663852449f89d2cbc7d70aee3a11be8f377f7ee5dc671604cd1.tar.gz"

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