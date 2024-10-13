# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/a62c7e036ab6851c0293f407ead635a7331445b7 -> deno-2.0.0-a62c7e0.tar.gz
https://direct.funtoo.org/ff/89/53/ff8953ae8d76b04a2956781c3a891b230d08be8c10d6d5fdf660ff433e183d0475a77af3b487b3f7ac26d60905edfb28f68644335d226a204aa176aa27993564 -> deno-2.0.0-funtoo-crates-bundle-977610e25099f27b74161f3b0be73093fb7b005efe0c4286bb7cbd1cf0032bbcd46893516d73e48d5e2e6319ef28f5f342457b6aab5fd74856b87ad602c3970c.tar.gz"

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