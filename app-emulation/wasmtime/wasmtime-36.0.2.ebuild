# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v36.0.2/wasmtime-v36.0.2-src.tar.gz -> wasmtime-v36.0.2-src.tar.gz
https://direct.funtoo.org/3a/33/63/3a3363b13606daf01d0664ae4787cbaca6ad8bf400fc1f422f55194c94335fbc5dcd2e485fb19e816ff83d18be33d179e901e84b1cd1fc7d8b893800e3b74c0e -> wasmtime-36.0.2-funtoo-crates-bundle-4f87fee97513a61cb68260248fcf368c36cb298cf98ad12cad60b76086ce428da7f07ec0eb316b9e7d73b25ec4d13f683b8915993a1b9f639759e00c45be0f9c.tar.gz"

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