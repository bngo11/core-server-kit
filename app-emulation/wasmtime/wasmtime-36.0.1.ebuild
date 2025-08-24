# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v36.0.1/wasmtime-v36.0.1-src.tar.gz -> wasmtime-v36.0.1-src.tar.gz
https://direct.funtoo.org/aa/6d/6d/aa6d6d5a68540a7774cedd6db1df2a70d94a2d39960a23cbdeb29dab93031fe44de118765387646f98bdce73674ec2e3332bae47e18248e46d7347866d9983c1 -> wasmtime-36.0.1-funtoo-crates-bundle-4f87fee97513a61cb68260248fcf368c36cb298cf98ad12cad60b76086ce428da7f07ec0eb316b9e7d73b25ec4d13f683b8915993a1b9f639759e00c45be0f9c.tar.gz"

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