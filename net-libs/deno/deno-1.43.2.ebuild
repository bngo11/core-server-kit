# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/acd75bbd75fdf46c213d7b21093e09349318da5d -> deno-1.43.2-acd75bb.tar.gz
https://direct.funtoo.org/79/ed/3e/79ed3e01f23a71c4a9d397ec6aa0e29a6a3e5458a4e2eea5c65aded042a226b0b0f4157dbcae82b95cb70910654711f9721de60711e69681cb6aa1f36f494d7f -> deno-1.43.2-funtoo-crates-bundle-cf62a97c36755307e990b9bbd0bc434e31e2f491d20d6a9de27debd8cb3473c6d5b6a334023b0e7fa1e9b0c856936d1a5563f195ef2323439af71a14537d2e43.tar.gz"

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