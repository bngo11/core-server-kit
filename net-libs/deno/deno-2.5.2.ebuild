# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/02787156398518fdac51b1f633a8367f92a7d253 -> deno-2.5.2-0278715.tar.gz
https://direct.funtoo.org/60/59/54/605954fe51d265ad054ceeff93aaf20ad15a1ca8bcbc086d67229f79894f7a1a496e89f79bd76fc48d7efb9c94a0d1ed4274bc89674d61e3bb0c1215fb70a60a -> deno-2.5.2-funtoo-crates-bundle-a9cd8ea7d1e18be4192950de3e75369bf4c3f3bd08b34b41177395acd9f757a8e921a9b996d39101b13e4acfc3114bd8e4149cac5aae0c504b7acf84a58e13ea.tar.gz"

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