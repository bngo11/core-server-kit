# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/3e2030bc01776ce6b4ca355b1e78c4cb98c82dca -> deno-2.8.1-3e2030b.tar.gz
https://direct.funtoo.org/a6/87/1d/a6871de07d6efc454cc0a275c0787353c41326f80dd25429f2717be0660b249afdd0a118342c9f1d05ea001d8deb2caf51888f2121ae2e44ad1e19143aa1edd3 -> deno-2.8.1-funtoo-crates-bundle-b55e7b5a2f6b7c8f0c5bf27de166cba18aa32c7a43ea4f9dba1d1803ad6ea07aea8921b8a92e72a6344a6700c0d97d2c6fd6505bafbd175a5ac697325e22db3f.tar.gz"

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