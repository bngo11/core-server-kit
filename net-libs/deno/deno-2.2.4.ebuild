# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/33132abbd9ee0defa4bf0332c4797ee4341a03fc -> deno-2.2.4-33132ab.tar.gz
https://direct.funtoo.org/0d/17/a5/0d17a5a53cbedc0d3627b31267fb8085a4e02ddbbab31277b64a8eae6d74b9d7327a380e35359ce4f3b23794e1399ebb9301f8ae5d96261f37c895373ebb2848 -> deno-2.2.4-funtoo-crates-bundle-964476094c8b79d1d675553becd7223600eef83e341721e233d14e740a89e4c94a3f10f3c6d7fb1589c607c490596dbb5304b6f1f7701a4556eadccfbc94627c.tar.gz"

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