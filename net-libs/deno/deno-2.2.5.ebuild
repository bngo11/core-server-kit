# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/6e08a9d2291cf45ae4031e163b8c1a03a0e85983 -> deno-2.2.5-6e08a9d.tar.gz
https://direct.funtoo.org/05/52/31/05523179d7071a94389c948ccf85f4a2f10154ec86213822eac8d5de76fe0d3573b1d0fae8b03bfcd7c8c4332c13e11e078fbcb03a5fe8bcb5a9975030d53186 -> deno-2.2.5-funtoo-crates-bundle-dc1bedf392f557a29d31bf5a3844802db9dd356c10857e4e2410a7aa81d03c99e8b54fde57fa0afab83de5ee65bcdb2558f34113bb6955314c17307602e54679.tar.gz"

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