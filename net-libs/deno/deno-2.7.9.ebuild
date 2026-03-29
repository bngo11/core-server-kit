# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/f065b072ab052602746b4be8da37ad90e51aee70 -> deno-2.7.9-f065b07.tar.gz
https://direct.funtoo.org/11/18/30/1118309df5a1f8f2d2f21d7326d88711b1be7a31cda0fe5ce488840d998bb5f4ff8bc329acfcafd4befd1c9ae5213d69804c8ef6ece5103045394a6ed1771b80 -> deno-2.7.9-funtoo-crates-bundle-59127a81a36e318a56809037ed4b0546ba6850fe40cc87accdbc0271adae60129452ee6c4a6e19e57a74e41975913e199cde6be9a5a567f5aeda949182d1a7da.tar.gz"

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