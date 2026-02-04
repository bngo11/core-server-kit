# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v41.0.2/wasmtime-v41.0.2-src.tar.gz -> wasmtime-v41.0.2-src.tar.gz
https://direct.funtoo.org/31/cb/d3/31cbd344ea1e66588b4a42052778753e268e7f2a6ecc95b60b6cf5b01cd250da4db482d327b869f60729bf178f4f6f34a4639ebe057f72a83d7fe6e5d8d1b662 -> wasmtime-41.0.2-funtoo-crates-bundle-c4715d507142468ef0ddef843e561fc94f6421d38488f3acdfb51d8944e5ca64a8823ad4912c4bae9de7c06921b2a68d5b15a2062a388d9b2eda20951633ba63.tar.gz"

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