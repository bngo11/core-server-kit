# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v48.0.2/wasmtime-v48.0.2-src.tar.gz -> wasmtime-v48.0.2-src.tar.gz
https://direct.funtoo.org/6f/72/0f/6f720f5171d3858a2390d0e62ff32bafb13e4e557b106bafe31be4ec66b0b6161feef4ed7221e97fff28800498244fd71198aee8cf18e4b61eacd4ad2dcb4cb4 -> wasmtime-48.0.2-funtoo-crates-bundle-d1e51d7def2b120c22b505907a1f94a330ad0e41cca21d84577f4d65f91cead77394c85f0ac720be9737b82cbc53e49f5e73b5245046c022bd03dec5862a33a5.tar.gz"

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