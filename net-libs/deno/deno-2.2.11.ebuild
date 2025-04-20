# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/225fbd59bf9a1d50603adb99fe2748edf70b9de2 -> deno-2.2.11-225fbd5.tar.gz
https://direct.funtoo.org/2d/fd/94/2dfd94ae5eaf551c7f89588ae56decb7b65aa95d3a2ecb97b11f53e104dd8d3b557e7d3518fd46791b68f0169c658c7e05388e90087e3baecdc5200d3bcb72cc -> deno-2.2.11-funtoo-crates-bundle-ad94114495eda31c971122ca78d45b46315c648c6a434145bd3ceff43a92642c52bb9d3bd0571fcd84c54323140ee68ab980ce18c4885690382b665022117ff5.tar.gz"

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