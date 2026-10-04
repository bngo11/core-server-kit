# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v49.0.2/wasmtime-v49.0.2-src.tar.gz -> wasmtime-v49.0.2-src.tar.gz
https://direct.funtoo.org/4f/f3/e5/4ff3e586aa084b9b678473895da1f3d304aae47c8f0f4cc29d30e908564ff99990ff97d334257350d185f06629157c73a513a0b47fa181ed183a421dc70f753f -> wasmtime-49.0.2-funtoo-crates-bundle-d1c49df37eb5ae4437d771c71c1585fe847776af667d1bd8f909876b7d89f092010c34636fd3757a264f858a233fa2122439316658b0ebfc6b9cfeab9b1f2082.tar.gz"

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