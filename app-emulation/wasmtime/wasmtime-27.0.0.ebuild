# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A fast and secure runtime for WebAssembly"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v27.0.0/wasmtime-v27.0.0-src.tar.gz -> wasmtime-v27.0.0-src.tar.gz
https://direct.funtoo.org/e5/7f/c7/e57fc78cd278b8760ec84846067b7247e0314401065f97b3644b8d868648cf9ea3f58bacdf2b1de47397dab2c8d7e19e0d0f83ef65811ebf9306ea1f6c0afd4a -> wasmtime-27.0.0-funtoo-crates-bundle-aa728a44a3a071809bbc739d46ad0d8dc0c61914424ede8f83635e78ca90ebd3d45afa3c10e3485199461a3eeecc8fdc028cee9f8c6da10999720fdf4652753b.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DOCS=( ADOPTERS.md README.md RELEASES.md )

QA_FLAGS_IGNORED="/usr/bin/wasmtime"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/wasmtime-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}