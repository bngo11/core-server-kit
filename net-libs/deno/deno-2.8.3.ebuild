# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/ba699088698c7b4a2fbea33acc4dcd6571789452 -> deno-2.8.3-ba69908.tar.gz
https://direct.funtoo.org/c2/8f/88/c28f88a4d76a568ed5d7c67c0444ef98d0f014ac9eb8e998c95027db4e1f421a1e50040d44f06246d148cc31e14f87ca30ba801d7f5fcb7d98f0c49bc0d8f939 -> deno-2.8.3-funtoo-crates-bundle-ead64d3026a279417e7d73cd745541a6bf7e751ea1d5645e467f11758adaf5324230559301091538dd37ad53f6e355846029e77bff7d12697cfd41e8f9ea0b0b.tar.gz"

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