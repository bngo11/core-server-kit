# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v39.0.1/wasmtime-v39.0.1-src.tar.gz -> wasmtime-v39.0.1-src.tar.gz
https://direct.funtoo.org/d0/a8/cf/d0a8cfb155f90dbc9ebf780e71a53e18c12c74f82839739baf6fd2856a8b518b3cef5bd19c6e17dab3f2bc5e5d6f2c53ad3f8a4a89fe9d180a727fae41bbfe8b -> wasmtime-39.0.1-funtoo-crates-bundle-6d8b4bc27299879866967d269d7f79d48422ec35f91e9e8865eb249a3ad519caf79b4ce5fe7449e76d024e6fe2bd010b95f4385e4786311130361a467c8884dc.tar.gz"

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