# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A fast and secure runtime for WebAssembly"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v21.0.1/wasmtime-v21.0.1-src.tar.gz -> wasmtime-v21.0.1-src.tar.gz
https://direct.funtoo.org/14/25/bf/1425bf7bb8df2759d73eb38e52c7ec2cbf135dbcfe5a6c6895430b50520637126b57b31ed46ac5b48ff3df1d9ae47ff52bc561da3cbdf62d4a794f591bf3e30e -> wasmtime-21.0.1-funtoo-crates-bundle-03f32906dd45862f6e219e9a25737646fa341e64a5773dc9d20e20c7290305d01494309fa00776d28961a6d579e88f98b75a01beac6af83bb7ae04c5bdf78763.tar.gz"

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