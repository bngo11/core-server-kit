# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/04c0a4cbf7c00811d3ace3184c1cb8597a0e88f1 -> deno-1.42.2-04c0a4c.tar.gz
https://direct.funtoo.org/f1/8b/94/f18b94394fcee61e20bcc9592c2754fbf1c2f6c5c95936b9cdfe244f330a81451c157e980d6adc1e9f02ed8e4ef9a68fe23c5dec5886808bf963abf0f8e7c673 -> deno-1.42.2-funtoo-crates-bundle-d8d2cbc61908a17c4985530f587bc494fdf433784876ad393301e560299a85066fac8aa6766c484df9cdc4315733ddb883be70060253789e9751255111da7b28.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

BDEPEND="
	sys-devel/llvm:*
	sys-devel/clang:*
	sys-devel/lld:*
	dev-util/gn
	virtual/rust
"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/denoland-deno-* ${S} || die
}

src_compile() {
	# Don't try to fetch prebuilt V8, build it instead
	export V8_FROM_SOURCE=1

	# Resolves to /usr/lib64/llvm/<version>
	export CLANG_BASE_PATH="$(readlink -f -- "$(dirname -- $(clang --print-prog-name=clang))/..")"

	cargo_src_compile
}

src_install() {
	# Install the binary directly, cargo install doesn't work on workspaces
	dobin target/release/deno

	dodoc -r docs
}