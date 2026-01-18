# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v40.0.2/wasmtime-v40.0.2-src.tar.gz -> wasmtime-v40.0.2-src.tar.gz
https://direct.funtoo.org/d4/53/f4/d453f4b4bd8f9b57bee7f60dcfdee044c6b94a872ac61de55681ec8bdf7ba657ba452530a7e29b1264013f4bb0b8d806d2bfea12bde18b5c976e11b3552bb42b -> wasmtime-40.0.2-funtoo-crates-bundle-11fc4a757827c2f5c2d85a4661e518a1b0c368efaadbb2495ab61a38fc046939f2e1777cc7392a7fea9ad504891b0d16fba51d2402d41cb8232780e0e611746b.tar.gz"

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