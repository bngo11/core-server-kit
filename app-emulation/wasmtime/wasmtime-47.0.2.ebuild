# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v47.0.2/wasmtime-v47.0.2-src.tar.gz -> wasmtime-v47.0.2-src.tar.gz
https://direct.funtoo.org/4a/42/88/4a4288c9dddb46150e2b4accc7f7696b31c7b94e806562fd074fad6cb6a51aff3a589cd7d1e816251dab04d7576f70074e467cfb4fe147565625892d2964ae0d -> wasmtime-47.0.2-funtoo-crates-bundle-64b14a9c330611ff32eb7a177641a3b4a7e2b4b8e940f386ad1663484ba779e9c0a33bb63e14b2cfc7188f6ce5421c059c4af89e91609d5d16898da6694512c3.tar.gz"

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