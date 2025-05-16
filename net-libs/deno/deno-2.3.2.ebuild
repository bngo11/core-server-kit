# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/7b74f385396bded16f99db64b97aa48e6f603f16 -> deno-2.3.2-7b74f38.tar.gz
https://direct.funtoo.org/d1/3d/15/d13d15f16da4be5b57672f41a48d33bd428794b3c61e8a17d277768343d686a199d1b0f017cba259dadf4e0dcfdf1a290939585a2ec520dcc28e7d15de978d03 -> deno-2.3.2-funtoo-crates-bundle-7334d7403b068acf21f9a0d00449ec06d6dea79701ca3f2b457638f4abd4c02eff0404f826426b2aa7776389c6625108a6489d33730d7aea3633ecc2e7ffbd25.tar.gz"

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