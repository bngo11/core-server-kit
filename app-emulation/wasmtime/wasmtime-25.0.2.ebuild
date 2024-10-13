# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A fast and secure runtime for WebAssembly"
HOMEPAGE="https://github.com/bytecodealliance/wasmtime https://docs.wasmtime.dev"
SRC_URI="https://github.com/bytecodealliance/wasmtime/releases/download/v25.0.2/wasmtime-v25.0.2-src.tar.gz -> wasmtime-v25.0.2-src.tar.gz
https://direct.funtoo.org/36/3a/65/363a65c0909c50b3e1894fa0a6941025351bf5c23092b0d5ddab44ae0922a27c699d260d8723415af8a3f4c6898be063d19ff373f065585615655e8cf3145faf -> wasmtime-25.0.2-funtoo-crates-bundle-eed1ba41907e09ebf84c56d34e282b45d32a1f20af045f9573df9c05198a34e4f83b356bbf56e462130336a6c58078d03ea6081b21d5b703da83b711702cc72d.tar.gz"

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