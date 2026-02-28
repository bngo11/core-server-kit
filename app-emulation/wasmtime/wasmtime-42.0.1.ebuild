# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v42.0.1/wasmtime-v42.0.1-src.tar.gz -> wasmtime-v42.0.1-src.tar.gz
https://direct.funtoo.org/e1/73/dd/e173dd6f2a79a69a67b2fd924ca24c12fcdcaee0fceccd61c732fea8d848bce50f0aa23187552f257b5dc20514ee745798b4cbb57c86e0b80f050e4481b07c5f -> wasmtime-42.0.1-funtoo-crates-bundle-d585b609924af951cf1ea0b68ebf37aaf7eea572106c62b259fb880e7c8f9f9ae9b8118b265a0de3197da5d0361ff359c7951c2823f6b062c61a0e7a5c105995.tar.gz"

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