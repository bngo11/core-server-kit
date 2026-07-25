# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/14eea3160ae5834476aa3b9d317b8d41d991b982 -> deno-2.9.4-14eea31.tar.gz
https://direct.funtoo.org/5b/5d/35/5b5d3564d4bed3db674e40ce73d9e53f7ba5fd54c6d1fa4cedfd031400a3e349b149e47bab36003354265e5ff3ff7c2fdf06233376a2322760d150fd8821131e -> deno-2.9.4-funtoo-crates-bundle-7d1b5995c3f04001b3f997c8fb5b98f4ca976dc0df07e4e5161b165fdfcc1a871913b1faceddf4c488510b5929b2fb9bc83f6e0e3670371f366f01470b6311e6.tar.gz"

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