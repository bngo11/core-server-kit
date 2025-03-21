# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v31.0.0/wasmtime-v31.0.0-src.tar.gz -> wasmtime-v31.0.0-src.tar.gz
https://direct.funtoo.org/19/69/d1/1969d1c5936367a8a5b4e31a351f291d34305f68cc72a363d86d81cfe574d5e739ed48372d2a29653e61ef8321af918c6e18ce0b89921afe72e181fe9a044a11 -> wasmtime-31.0.0-funtoo-crates-bundle-0e41b0129fca2aa4b1a2ea31d77bbb1a81b17667ec58b7a00e775b41f4b03632f88bb51ec968d253e0fdea2744ea85240fb275581e1a36c8c67d257ddc04d040.tar.gz"

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