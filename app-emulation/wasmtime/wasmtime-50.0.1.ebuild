# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v50.0.1/wasmtime-v50.0.1-src.tar.gz -> wasmtime-v50.0.1-src.tar.gz
https://direct.funtoo.org/0b/8d/d8/0b8dd8f70699b30ac06e28cf36cef13857feecab645314e5bf8eb690ec2664e269fb2ff8945f6bfb9518525821ce8df961404a14f20875510be54c715fca8752 -> wasmtime-50.0.1-funtoo-crates-bundle-ecd4611ff0fa36e47e31e9fa60f705db215f7e728241205ae6cb195db9207f46baf63cf3655b226366814c635360f3cc63c7186538b07fd4810dfd706eb70dba.tar.gz"

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