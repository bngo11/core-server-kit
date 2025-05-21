# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v33.0.0/wasmtime-v33.0.0-src.tar.gz -> wasmtime-v33.0.0-src.tar.gz
https://direct.funtoo.org/2a/34/55/2a3455bf60412f357705ddff0f388e0bf35f913221d138b8f3b69cf46dd65de20b8279228de49f161c458fbf78c71f3eed5d8506eb84acac5886795970bd7ed6 -> wasmtime-33.0.0-funtoo-crates-bundle-6531677a59cf22505c4a322df4162908bde7986518181f09e605746dd9111634f3570302bd100470541bfe12d09604c87e7054e8fcad874e22eb81bca821eab8.tar.gz"

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