# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v45.0.2/wasmtime-v45.0.2-src.tar.gz -> wasmtime-v45.0.2-src.tar.gz
https://direct.funtoo.org/f6/71/97/f671972dd2d38ebabb2f10baf19946c11faf3b8e842e34ae95e71e38e831c937726e46025a628f851e420c3b95913908101e1662119e5633a812ad06a96cc940 -> wasmtime-45.0.2-funtoo-crates-bundle-8ccd980d0b9758cda5872dafcb5820d46896effd00aff6c47076fa232325fdf2d88c869468d02f84c721e159778737c478a5433c95f9c78e07d87294919632d1.tar.gz"

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