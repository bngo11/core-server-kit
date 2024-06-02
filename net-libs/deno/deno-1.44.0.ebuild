# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/f3ffffc682604349b96dbe4ad33daa5dd1a09f63 -> deno-1.44.0-f3ffffc.tar.gz
https://direct.funtoo.org/36/c2/16/36c216b1e00271ad1b2713538109c3c861b48ac04bd1284bad1496a22a65dc53233069fd099c2abfb769b7e0deafbe10c335fec9ccf4a32ad951d64f321305ab -> deno-1.44.0-funtoo-crates-bundle-b713e36adf271ef459692afb694fe63550df7c554b4255339778c8b1b522335683afaa0f72cacb8e5489c733931b22ae6a6449556f48f69c321e6e50a1e5a954.tar.gz"

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