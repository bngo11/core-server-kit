# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v37.0.0/wasmtime-v37.0.0-src.tar.gz -> wasmtime-v37.0.0-src.tar.gz
https://direct.funtoo.org/e2/16/29/e21629f9d6fec3a454befbafd12cad6d2a7982cf4b5e2180281a3cd53595f0847462f78df9e1f1c3f6bd45f0bfa88b7605af826951e28b1135293db67f246439 -> wasmtime-37.0.0-funtoo-crates-bundle-0ae30cc6e5c5396cfa9442342a57a2880b22b46fc285380ae5c44cdb3759312208b4a190e24b752e06c8478a526835427bc3f0b3a926283cfe0dd952eea89468.tar.gz"

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