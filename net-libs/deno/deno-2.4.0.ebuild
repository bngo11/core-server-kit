# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/45dfae18eec45c91146231aa05f4b249378691b5 -> deno-2.4.0-45dfae1.tar.gz
https://direct.funtoo.org/8d/97/59/8d97596c71533b16c409a30804450fe16fde1382e60fcf4be1e80b8de3a1e1387e80d925476bc799945d2adb95bf25d40b64870b0569c4a51d28e7e584953168 -> deno-2.4.0-funtoo-crates-bundle-fa30abacb24b68663c7d193bfac4a670b48d19bb169f35db70ff3c4b294014c49ed20747e97da9280358252ada8700f107726f427503062b24c73c711e23b0ad.tar.gz"

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