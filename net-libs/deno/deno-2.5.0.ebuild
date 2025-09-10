# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/c6adba122836aeddd92800c45282897e1f508bd3 -> deno-2.5.0-c6adba1.tar.gz
https://direct.funtoo.org/f9/80/6e/f9806e70fbafcb82a8c7088b41a5265a7ca634431e95c86b2bfeeb8d139a1bb63ce66bea066b467e76154d555642bd262974f25d65577d8e7e2f7d2c3c81c9e9 -> deno-2.5.0-funtoo-crates-bundle-b337a6df1f5e4216c55eb97ae95f6f01b66846ecf733f5bc219c75521a071d15a5c8d27f218b8fa0067fa2107d5afd36f7bfa52efb05bd8458fc0fcbab329211.tar.gz"

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