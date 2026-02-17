# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/8871ade7aa09eb907a04ee61a427f5ba14c54014 -> deno-2.6.10-8871ade.tar.gz
https://direct.funtoo.org/b1/b1/69/b1b169db47a761699abdefa2df0398079ca645dd30930b949653935617088df994523482c1f31bddd270896c998fa0d62adc9c00fd2dc09a246349e1ffd48fdc -> deno-2.6.10-funtoo-crates-bundle-31dac692cc506fd4952e804a1de0f5ded5e294b0f65071eb090e9124e3deb607de9544afa03e4c9be84b96a53f01005e7ea63ff552ff1eea4a548615e81025ce.tar.gz"

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