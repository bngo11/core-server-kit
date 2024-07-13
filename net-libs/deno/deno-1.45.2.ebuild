# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/85de4280a1f9fae572a7331db6344cee123ddab7 -> deno-1.45.2-85de428.tar.gz
https://direct.funtoo.org/af/69/e4/af69e4b26353ccc09309505e6435eaf2cfac72358c9ad248bbbf08bd471db6b87839960b3887071594ee3ddf8810ab2f6dfb58955f434326e7051b831ca41f75 -> deno-1.45.2-funtoo-crates-bundle-dd666b0bbf4707cfd46c216691dde84ac9461042368a616d598f96219ab431b1e7c728b41f2ca1ea92c962378aacab538386880a5d4bc8f8a6157e05955d6152.tar.gz"

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