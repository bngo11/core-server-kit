# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/3fbb1daddbc9333cddf0d8c0735811717dd70f7a -> deno-2.6.3-3fbb1da.tar.gz
https://direct.funtoo.org/94/1c/5f/941c5f3149d2dedeb1397f270924a40a58af06644bfa76144f0e729e1da94f87eb498e82ca0c49f860ecf9065c89d200895c490380216c75e823b3e62b04c789 -> deno-2.6.3-funtoo-crates-bundle-911e63e5a8067405c7447b2e6706068c2fa043bb41fae779e05797c5a9cb6b856f2cad657db35bede683b553e44f5c344a1d987796668d8cb84607c9f2cc1780.tar.gz"

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