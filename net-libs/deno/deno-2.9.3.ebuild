# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/f39575ecd50602a5b42b1ba8e93849460de9fcf4 -> deno-2.9.3-f39575e.tar.gz
https://direct.funtoo.org/c5/49/ab/c549abc17a6edc53f31841b1db8eebe2ae626a2cfc98d00b7e4fb06f1444e7f70ae0a9e08bb2e84b723be9f3db9153b095f06d89f1e56e0d74903b35a7662dcb -> deno-2.9.3-funtoo-crates-bundle-70217b567dae2fcd016d8d43ae6b3591111c0fc76c1b7982c3a4401f9e6c6b491a18807245757270abc78b1d8844bbfbb9d8273e4e39c8b894cbd7b1b0f998bd.tar.gz"

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