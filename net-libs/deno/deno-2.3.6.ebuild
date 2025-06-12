# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/d2d8d3775fe0fbb34de08421f612ded43dea4473 -> deno-2.3.6-d2d8d37.tar.gz
https://direct.funtoo.org/81/7f/4a/817f4a4a32a966f1cebb2c157ce53a7c29185ec4362826265f5b87f5eec2290bcdaf1ff46d707220075dc86294d5fb84212f5b94b612229110798643598be43d -> deno-2.3.6-funtoo-crates-bundle-0c6954ef70855d4449b30fc13d7c1395ff7bfc02a05b9db859079ddfc951c776716240cdc0dc35ea80088ed18f0ed80c9975dc100279474aaa61fad1413cef08.tar.gz"

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