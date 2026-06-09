# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/085be0b5ff8ca3ccfe58318afe0939c4d4af9743 -> deno-2.8.2-085be0b.tar.gz
https://direct.funtoo.org/59/27/69/5927697d47755c7d27361a53c3ddd18671e454d5d48347ff30bccdcebd085e6ddcc8ee482798c2ea55158aabf9ebbe7eccd601765449145a27ac96b0ddd11265 -> deno-2.8.2-funtoo-crates-bundle-bdbe188c2b4bb8bf9969ae2e68cfffec0b8fbbcfc063bf6c96b36de481fedf8e719f51cc0348e5ae62ba10fd66a62ccafa404bd6f663ab73b45a785a0e9ff8de.tar.gz"

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