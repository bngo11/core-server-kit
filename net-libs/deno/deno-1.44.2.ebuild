# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/9ca1320746072001feab9f6a26e9c1518609bd7b -> deno-1.44.2-9ca1320.tar.gz
https://direct.funtoo.org/8f/90/f3/8f90f334d862113ad8aee22aa7cf9ddd711baa9ac7d8e3dc536508566aec2c62197757b842ffbd208f7cd4c8059530df3138c49e7efd6a79c56d229b63b607a6 -> deno-1.44.2-funtoo-crates-bundle-571b0c5a8e901f7408e79a3dc75e7b218fbc8dd3dc0f0154a3acb6949da3c5a9cd759e686ad809b7117ef4a76ea8ea9ca57d5942dc3a5ace687a68d66ff18900.tar.gz"

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