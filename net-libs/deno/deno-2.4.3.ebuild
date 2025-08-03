# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/5612d2edc7262d7bfb3bcfb0f18649b01ec94b53 -> deno-2.4.3-5612d2e.tar.gz
https://direct.funtoo.org/ec/9f/45/ec9f456f45ceb7bc9d8cb2c8f93b75368733e11ae2038f7e2b48fd1e139a9d48940a59e3c8de49e940698bdb0f8118ebf1e753b685bbef0ea3e4db28df4e0910 -> deno-2.4.3-funtoo-crates-bundle-43c3aa5a1d703b61bf9efcefc29cbc414624797fe43ce63a7d35a2e359ea02c07202fd27ee1b735bc772c62ab3564575530767492e9a1e1991592044e2c033b1.tar.gz"

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