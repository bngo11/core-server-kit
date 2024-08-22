# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/de11ff8c556c6922f832f639f54e5f7a6a3096b9 -> deno-1.46.1-de11ff8.tar.gz
https://direct.funtoo.org/b7/96/e5/b796e594018d578f74dd244b45dd1c182a825e35fe1c7897d7fb315071c910144d67e2d8ef07350a0fabdde76dc3f53206c54d69b4f28b9b5949f1216e7be2fc -> deno-1.46.1-funtoo-crates-bundle-ab5b9672c19ff90c34fd74bd67f3a9bacfa69101525adaca199d10f6bb4e8c09f53c352a1ffb22d5657701a0e06df2ca5264d6281075a1ea5edd3936fc548735.tar.gz"

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