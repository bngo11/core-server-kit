# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/8f59d18202e94e5c54ad7e5a79ec1383159e4a20 -> deno-2.0.6-8f59d18.tar.gz
https://direct.funtoo.org/0b/cd/1b/0bcd1bf52d6db6aef280c2379f1c385117d6a1ceabc2cfd87c0d52aef1b34d0a6754c85cbc7f57e49fa3fe22076764c21bad5a7c3188793c67a10a281f5a1115 -> deno-2.0.6-funtoo-crates-bundle-a64d8d118da473bd51152454ea39f6150aaea7c59f33c9b4e132fb6c8eca0a985966158e0c26b8850d0817fc0757c0ccab8ce3d8a4e81eb2036133847039b3bc.tar.gz"

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