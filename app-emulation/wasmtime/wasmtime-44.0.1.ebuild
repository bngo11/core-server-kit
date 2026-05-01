# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v44.0.1/wasmtime-v44.0.1-src.tar.gz -> wasmtime-v44.0.1-src.tar.gz
https://direct.funtoo.org/d6/c0/ec/d6c0ec23117801e5e2458c569daeedac1b3ff19414eeee5a1af8412adad3aa97745fa735ca5187cb7606d8bb0810388174b450f5cb049566adb5229db228da33 -> wasmtime-44.0.1-funtoo-crates-bundle-de09c4b19e0864fd5165d64ce0e38725d04e0b834fe8195b6346722728e86f5f0ee8506ad22a1e5e5ec3e5cf5d01a4d00782da6f7d185930b2d2402d28c16be5.tar.gz"

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