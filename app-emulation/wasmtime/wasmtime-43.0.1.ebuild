# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v43.0.1/wasmtime-v43.0.1-src.tar.gz -> wasmtime-v43.0.1-src.tar.gz
https://direct.funtoo.org/3f/ed/3e/3fed3ecc697da434f0635f58636a8970d606d545107354eaa851c3b58e5d1f8d83f986347cfccd86dc9ceaabae86e5d046d3dbc9b5ac2c06a0b92cca8c72c1c2 -> wasmtime-43.0.1-funtoo-crates-bundle-d297feb013e426d4608f5e0f8654bdee1bd42c2179ab8e2f9905240dfd7fc440c164d316bece95bacb2c4cc7f27733641545b08d402ebaf9ecc975757657ecf7.tar.gz"

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