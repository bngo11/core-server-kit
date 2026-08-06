# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/17fadf33a8df3af9488b9f42efd1f2290d6dc7a3 -> deno-2.9.5-17fadf3.tar.gz
https://direct.funtoo.org/ea/d9/d1/ead9d127a45f2ddd657d483a4c46a9d61260419757d6b038bd065f2f8c8365ddd3a541ee1fa518f965f261ff77b3d21bd7f90369cd45b7d79a63ba57b5b7de8b -> deno-2.9.5-funtoo-crates-bundle-05a7289f553cb0adfd8cce3ea845a5439e0c6abb29e55f7035eba7b5241068736ce242ebae94f04544a6a0f7cc0a31793f889585bc24c425bb79d7767dcdf657.tar.gz"

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