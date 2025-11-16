# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v38.0.4/wasmtime-v38.0.4-src.tar.gz -> wasmtime-v38.0.4-src.tar.gz
https://direct.funtoo.org/b4/23/09/b42309aea29e4fb600cb55b87694e693c03e9232b0d9f905365d0cbab092bc7d075385889825b3fd3009bd5a382451432a7c862ed4e3df745262ba395e93db3b -> wasmtime-38.0.4-funtoo-crates-bundle-a778c0476ebe6ba469ab887332039b32c4f8dffd3af7bec9f7ddafafda80d527cb55ae87b3842948a50e1c1c82d06b4f2002294dbe3bca07ae19ce8b474974a3.tar.gz"

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