# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v38.0.1/wasmtime-v38.0.1-src.tar.gz -> wasmtime-v38.0.1-src.tar.gz
https://direct.funtoo.org/a3/a5/21/a3a5217d89a53bb2f961d7e03833c9957928528eeeda3d7ee6963389a157541baba53891f611fb52a6769a2f3900989199123ef463cc9e20a03724efd9587f27 -> wasmtime-38.0.1-funtoo-crates-bundle-a778c0476ebe6ba469ab887332039b32c4f8dffd3af7bec9f7ddafafda80d527cb55ae87b3842948a50e1c1c82d06b4f2002294dbe3bca07ae19ce8b474974a3.tar.gz"

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