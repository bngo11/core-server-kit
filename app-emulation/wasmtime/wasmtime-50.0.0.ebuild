# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v50.0.0/wasmtime-v50.0.0-src.tar.gz -> wasmtime-v50.0.0-src.tar.gz
https://direct.funtoo.org/c5/b4/3a/c5b43acac0cea3394eea5cae5ea218b70517a23502c616bf5ef46ca7eef8aa43d7bdbb78b7bcab7c51fd268d65d8b81b090dbbd7c84afcc886d615a3c6e9c1f9 -> wasmtime-50.0.0-funtoo-crates-bundle-ecd4611ff0fa36e47e31e9fa60f705db215f7e728241205ae6cb195db9207f46baf63cf3655b226366814c635360f3cc63c7186538b07fd4810dfd706eb70dba.tar.gz"

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