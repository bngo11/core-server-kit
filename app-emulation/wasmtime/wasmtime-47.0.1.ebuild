# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v47.0.1/wasmtime-v47.0.1-src.tar.gz -> wasmtime-v47.0.1-src.tar.gz
https://direct.funtoo.org/7f/f4/c5/7ff4c55150797173a727a7ea8375b3b63b0744b2222389d15462fb816f5337279adea2473df84547196340a316b0441b13a9527460f56a6d03fe56e12962ae20 -> wasmtime-47.0.1-funtoo-crates-bundle-64b14a9c330611ff32eb7a177641a3b4a7e2b4b8e940f386ad1663484ba779e9c0a33bb63e14b2cfc7188f6ce5421c059c4af89e91609d5d16898da6694512c3.tar.gz"

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