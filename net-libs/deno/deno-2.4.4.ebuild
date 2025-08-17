# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/5129d036ebd51b229adb7579e2c805859e3f95c0 -> deno-2.4.4-5129d03.tar.gz
https://direct.funtoo.org/e8/13/63/e8136332eefb95e1015ac3b986c88edf739e1717b6ea27ddfc9e9d4be00f0fe115d0f8501b117800312e1c86467d754f47bad979528ef743d574c6196d83842a -> deno-2.4.4-funtoo-crates-bundle-ff340cbf4e7527fab5bf10cdaa1f9ee2f6b2f36c7bf72805eccbcadcdc52787206ffaf0883db74d720d3503998fed175977b3249d1458bef295e450d9827c70c.tar.gz"

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