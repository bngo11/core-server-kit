# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A fast and secure runtime for WebAssembly"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v22.0.0/wasmtime-v22.0.0-src.tar.gz -> wasmtime-v22.0.0-src.tar.gz
https://direct.funtoo.org/8f/85/c6/8f85c6aac11261c604955a6be70625964c3a78ae26620df8e6aff45faeca4fbbb8bcc61f671eb5aa342dd96588a2c3b09bb62a4059bd592fe37b156990b83a70 -> wasmtime-22.0.0-funtoo-crates-bundle-05f861ee0076449abd7b4f2ba5c8239d0b117daf4403cf2bfbde44edd62171852f5f859ca6e8a9dce20532768487b0232017afa60f9e08e16bf8d4b2f6240807.tar.gz"

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