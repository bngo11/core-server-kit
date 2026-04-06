# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/6ddbb099662ea78a62af79484ae773cd9058c815 -> deno-2.7.11-6ddbb09.tar.gz
https://direct.funtoo.org/bb/75/30/bb7530d24494605059985128f19572e94d813a603f13c9a01bc164b907b1c650116417a3e62c3806b227f0bd510bb8e61d7ba705ff3c97e2c6e3396d518e2545 -> deno-2.7.11-funtoo-crates-bundle-8ea06fb69eb0fe6c5abc8af4aa45c97100e95c6be84869e6945b4133e241374d9e4f34e02878e0a602ee92570a5480b58f27497869e9db90fbb00d7245d104d8.tar.gz"

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