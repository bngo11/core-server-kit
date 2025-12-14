# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/d5b1548eba893d4cc26305f33739a6ca2e6e8c11 -> deno-2.6.0-d5b1548.tar.gz
https://direct.funtoo.org/14/c2/39/14c239fa37d7513783f96eb56629694086610121226eeafd701d8c3a3d53e6e21d1797008d615d769b391f3b484e2af79e53cdb042b76189ec8fe8f361d8159b -> deno-2.6.0-funtoo-crates-bundle-f67393c0ea2b89775c56594f64c74045e24ce7075bcd94a0b01dd6faa7efc4de27701dd221b7be2a3e1aba7e5717e2126ed5455ae9edb765dd7b07fa172f9142.tar.gz"

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