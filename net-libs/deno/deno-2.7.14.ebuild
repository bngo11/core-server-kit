# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/2d674b25625bcc367853d00fe86f6e84390f88cb -> deno-2.7.14-2d674b2.tar.gz
https://direct.funtoo.org/e0/41/52/e041524fa74fb7c09fe36569d0d3161231425acc2d0e07fe94dd28983da35cd98a02f63b9a231f5d80edbdb996c7ac1f68403f84ba88298eaca7e3a401ebf038 -> deno-2.7.14-funtoo-crates-bundle-5794a8118c5784dd36240eb432a18d8b53591007e88998279f6721c5af25ef71272f1e8d8767ce28462f55622f733b3b8ed4aa94ec87b90f4e83b8bdd2b22332.tar.gz"

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