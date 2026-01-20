# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v41.0.0/wasmtime-v41.0.0-src.tar.gz -> wasmtime-v41.0.0-src.tar.gz
https://direct.funtoo.org/4d/87/c3/4d87c3c0587b2f6449eee2a54ba99345455b0568f8d42465f1972823dfdc80d60aa5b74a3f00f7e2ff141e80789940b3996e2237a47a606c8fe4b9be58fce4e4 -> wasmtime-41.0.0-funtoo-crates-bundle-c4715d507142468ef0ddef843e561fc94f6421d38488f3acdfb51d8944e5ca64a8823ad4912c4bae9de7c06921b2a68d5b15a2062a388d9b2eda20951633ba63.tar.gz"

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