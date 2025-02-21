# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v30.0.0/wasmtime-v30.0.0-src.tar.gz -> wasmtime-v30.0.0-src.tar.gz
https://direct.funtoo.org/78/f1/b8/78f1b8ae0b6607340663cb997df0b630939eabc8caa9da961fc5b8ffb51b9514ca8bbfd676f98035f7cdd7b7c9083daf1d265b4384550dec2ae77a1abdd04acc -> wasmtime-30.0.0-funtoo-crates-bundle-a3f22d73dab515dbfdd941bdb7ca1ededc68b57e157118b42b48b564322c902e3728e8a037daa4042ece8a8b0ef140bf8c46739590025b711b0ec8dc88aee1e8.tar.gz"

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