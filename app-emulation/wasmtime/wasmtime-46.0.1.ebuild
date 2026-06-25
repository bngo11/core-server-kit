# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v46.0.1/wasmtime-v46.0.1-src.tar.gz -> wasmtime-v46.0.1-src.tar.gz
https://direct.funtoo.org/c4/bf/a8/c4bfa8ee9b3d5bf95b8871434cdfe26d48a47180392d833491869fa03be5e952a23b44a3f03f9aa419c9dda99151eea76e7047ea014b708c83523ed102cc5f5f -> wasmtime-46.0.1-funtoo-crates-bundle-6b85689c5d0bd288f6c4d3a3c9f393febee83f40dbf5b3b45993fbc3f942ee9143565b714de1fa6e7e4b4e0fbe025cea234d7bc1693c7290f6bc2030e61aea70.tar.gz"

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