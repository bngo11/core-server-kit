# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/8203278401f4ffcb477a28b3ae9b915d88de7dd7 -> deno-2.2.3-8203278.tar.gz
https://direct.funtoo.org/15/75/10/157510dbb086ae1d28669525ac0797de14f03eb7463ae3886b10d7eef4688928daad364d06fb9d6e57ebdca59cdf1ade72153a13021ba9272f08e087eb2676f8 -> deno-2.2.3-funtoo-crates-bundle-6289a84f97bbb746aa231d14567b1df58856a55637d58594b33c313777b50ed80a18a378a5b39d4d754b89b167b57fee8190065f36b54d35c282db4ee42fd173.tar.gz"

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