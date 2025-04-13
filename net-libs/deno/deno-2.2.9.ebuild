# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/25defa74d539d1d6fd27ddabd5260705677c43e8 -> deno-2.2.9-25defa7.tar.gz
https://direct.funtoo.org/63/56/da/6356da1486a043f3d639420183e683188a90ca6e741a3b72a2b0d6dddc05810f9ec93d5d926f1371bfbe42e8458089020f0022acd274aee9a6d77e338f80019e -> deno-2.2.9-funtoo-crates-bundle-fa12c78208d1d8b476c3f9b751ce8b883bcc79007058912f62c9793be7d73040db9146b5fc1420e9826dfc241aafd32d2551eb65500bd5fc66afe3727893d4c3.tar.gz"

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