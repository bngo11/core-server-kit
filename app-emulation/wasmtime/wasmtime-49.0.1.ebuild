# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v49.0.1/wasmtime-v49.0.1-src.tar.gz -> wasmtime-v49.0.1-src.tar.gz
https://direct.funtoo.org/87/ab/be/87abbe7f2ea5b3ae2163da2ef6d26c03651d79cd0678ffd30edad6379d8c8820cafb98002b259217da8c89a12ad1dec9caebbcefa982a7c15e68f73cf7a91851 -> wasmtime-49.0.1-funtoo-crates-bundle-2c033f8f70f85ba109cfb3f68db94e9b97b42994eb581f670fb83550ac4d35dd79885f96374566b1b2bcb1b9d0b5669ec508b7982f031127ec854c2403089b81.tar.gz"

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