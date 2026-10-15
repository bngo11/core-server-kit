# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v49.0.3/wasmtime-v49.0.3-src.tar.gz -> wasmtime-v49.0.3-src.tar.gz
https://direct.funtoo.org/75/cd/72/75cd722a5b5850d398f4ca5cf6de762fa45ba6984eabfdf088bd8240071a6a092981f33939d60f582b163aaf56cb6591bb9a66fcb471b07bdd1ef39efe8c6523 -> wasmtime-49.0.3-funtoo-crates-bundle-a085c92b82447870625105d9fb527e8f94f92238681cde52d3ec1c771bf2a2f9f3bd821c2ba1fea8c032793e7376f1dcadf03fbb1780709239c5a5a34c76cf71.tar.gz"

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