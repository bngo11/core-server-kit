# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v45.0.1/wasmtime-v45.0.1-src.tar.gz -> wasmtime-v45.0.1-src.tar.gz
https://direct.funtoo.org/4d/a7/bf/4da7bf471011a8345564372c26810a0e1d23e86fc9f5570d508fd078234eec3c9316e6670ecae891ed45599979d7dd42cc4253c8727486ba3c963203b44faeb9 -> wasmtime-45.0.1-funtoo-crates-bundle-8ccd980d0b9758cda5872dafcb5820d46896effd00aff6c47076fa232325fdf2d88c869468d02f84c721e159778737c478a5433c95f9c78e07d87294919632d1.tar.gz"

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