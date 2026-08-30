# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/e518fbd66dda5debcbdefc0beb0b3756b37b64fa -> deno-2.9.6-e518fbd.tar.gz
https://direct.funtoo.org/e0/03/43/e00343df0d33921b9088a1df169dee4445ea65fc955b0f36546c507a14922031e33555fcdadcd9392e26c1643da918d7a9a8fc3a83ca7433d8725da2ec9bd8de -> deno-2.9.6-funtoo-crates-bundle-cfa692d33eed722430dd82dee0241c177fb5393e22061eaf4356fb6342fd649b0f885f0b99a4f4f7ff9ca232d9a54d11d260d919c42a4e33786c6f442bf18a53.tar.gz"

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