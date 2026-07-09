# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/356c132ed60e679b34535a287a493193aa8bb6a4 -> deno-2.9.2-356c132.tar.gz
https://direct.funtoo.org/f4/f1/f0/f4f1f0feb45d86c78d05cbe9cd1568889a6f6ad35d2975490820e0dcd8f698e8d3a92f18740598041a8960754e7bb8aa29ea6dea8b093a1fa688e7f35d75493c -> deno-2.9.2-funtoo-crates-bundle-052adda81fb1b1a8d4e045c63b0eaebd23292183ba38b13e57e736a110c2aa2e8b1f849a535592e8190b39a894a3b26a216e28ad077badc14ae42ef8a7490f16.tar.gz"

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