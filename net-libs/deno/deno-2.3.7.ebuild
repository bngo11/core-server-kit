# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/0d76cd50af2b21e0ac772bb5219199e32a8f312d -> deno-2.3.7-0d76cd5.tar.gz
https://direct.funtoo.org/4f/de/38/4fde38b3df2513e646adf42e37011931df08feff00a27a867aec2006e174586ef933bb2b997395f09cbe028f99daa049fbcfa39831e1b1019592034087dcf8c1 -> deno-2.3.7-funtoo-crates-bundle-796b6823c41de32961e8cc4bcc1e01cb0722a959444ab47c5f63bc8a7a6388115fafbcafd3761bc4eecf6154025134d91e61988b8c1d98eb966208cf46086a41.tar.gz"

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