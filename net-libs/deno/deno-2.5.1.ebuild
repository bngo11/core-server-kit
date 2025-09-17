# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/4c1cdfc9a4f3c8919d25d1b2fe01981025babec5 -> deno-2.5.1-4c1cdfc.tar.gz
https://direct.funtoo.org/a0/32/3f/a0323fcf34e263269c4d7bc82e973db6037c8eb1a7761d67347cbc36afc78050b46ddeeca89fe988615b76663023b14c8d6205f6bd7d7e97aa0318308ac3d5ab -> deno-2.5.1-funtoo-crates-bundle-ef6c9f0518c807aca72650152f9f084ff097eb96b499e6c405ff9e019666e95e6d2e0620b8575b2dbaff5901c63822ef225e03814a12cf5c47585c6112ad4075.tar.gz"

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