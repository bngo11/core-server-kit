# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/0238181e8a95be0885da93bbc99997988d07bff0 -> deno-2.7.5-0238181.tar.gz
https://direct.funtoo.org/ef/c4/a6/efc4a6f8f6b264dd206b16610a4ed54dcce8fa6fb227600aec10383ebe194d89aaa93e49d8eba6046be0c14a448416d27f56982a6aca722edcbab452120cdf33 -> deno-2.7.5-funtoo-crates-bundle-03256acc2e3c473aa5a59b4caf8fe74640e04bbf2bf1edf87716399fe74febb63653a086a617317ba7c9d50b650e69c8e44da08882f54b2cdc53e281ec52da0f.tar.gz"

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