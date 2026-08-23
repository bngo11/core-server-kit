# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A lightweight WebAssembly runtime that is fast, secure, and standards-compliant"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v48.0.0/wasmtime-v48.0.0-src.tar.gz -> wasmtime-v48.0.0-src.tar.gz
https://direct.funtoo.org/38/c4/15/38c4158e776d97dd13c83fbd4a0f055904f3dbc28a11db0ce1446bad2c4318cd612ccb806495efe7440f02c33fab681267a653c5c11521ffdd15a8256a5406c7 -> wasmtime-48.0.0-funtoo-crates-bundle-a438c35c2cfba814ff7aa0b09cff8ddd537c2b21904a6a107ace3b068c91bb5b3da13ff32376273bb10f5e696df4401b4c9f38e53405800b15111913f209c5c3.tar.gz"

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