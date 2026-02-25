# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/1df618d969894353731981a17784816167ad82fb -> deno-2.7.1-1df618d.tar.gz
https://direct.funtoo.org/02/8b/cd/028bcd82a66c90073706cd7490618deced4cdc484ac648c93b7706daa1cc3abde757b9727a38fb1fb953a26c6043dd5a9bc4aa2c8d80c3d447fd516a78621330 -> deno-2.7.1-funtoo-crates-bundle-ecaac98fb2bdb5c4ca157cc5fcc4f808bddeae440290fc7ba692b0430903e01e769704538567056fc78addfe57e64812c2174f90514ea52076d0fa29b08bd236.tar.gz"

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