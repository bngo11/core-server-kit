# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v40.0.1/wasmtime-v40.0.1-src.tar.gz -> wasmtime-v40.0.1-src.tar.gz
https://direct.funtoo.org/06/dd/fa/06ddfa8053c965ba98d95c4191aa79d80e33523aa2741f128b1a245281c3374b326168a1dced0e442d5bdd5a1cb12678f1ccbf17e1c3d962c78cd6d72ed69380 -> wasmtime-40.0.1-funtoo-crates-bundle-11fc4a757827c2f5c2d85a4661e518a1b0c368efaadbb2495ab61a38fc046939f2e1777cc7392a7fea9ad504891b0d16fba51d2402d41cb8232780e0e611746b.tar.gz"

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