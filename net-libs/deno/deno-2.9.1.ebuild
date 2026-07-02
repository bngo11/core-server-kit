# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/7afe265234add47e7602f2e91c318f3eff245aa8 -> deno-2.9.1-7afe265.tar.gz
https://direct.funtoo.org/9a/11/0f/9a110f0602b385699fd16b97357a983479b85145d72436bb0c208320fb266ed3271ddf9e7dbacccba6bc9ab6b0943dfa8bdf1bb56ac445316d16685a05640023 -> deno-2.9.1-funtoo-crates-bundle-46de3facd3a9cbc547aff7c0684a4c09242b16fb97fc6a38f3e40f5e469cec0243f391bf71f7a292f0f0226b2d4549e660ce2f16bcbe3ce054131ee9830f945c.tar.gz"

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