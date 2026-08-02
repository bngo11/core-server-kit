# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v47.0.3/wasmtime-v47.0.3-src.tar.gz -> wasmtime-v47.0.3-src.tar.gz
https://direct.funtoo.org/05/af/b0/05afb05e3961b15a8493e40b073519dbc4c2b03596dd5a7a76afec3c00e5199ec21896a8ce94e2c1bd4f26b286f607190bfe199843a13db5cbe9fa104419c0b3 -> wasmtime-47.0.3-funtoo-crates-bundle-64b14a9c330611ff32eb7a177641a3b4a7e2b4b8e940f386ad1663484ba779e9c0a33bb63e14b2cfc7188f6ce5421c059c4af89e91609d5d16898da6694512c3.tar.gz"

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