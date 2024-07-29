# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/c0b1d19d559bfb1fbb65675b3849a9c0396d131f -> deno-1.45.4-c0b1d19.tar.gz
https://direct.funtoo.org/88/da/5e/88da5ea1d7f844e309b96079d6018c5c4b09417116ff37058fd98bc6ed8191ff9c8323f3575453d0ca1c4cb42263c76ff117bfab455cd4f2bfd4c7a4f47077b3 -> deno-1.45.4-funtoo-crates-bundle-c44f74bf07220035d663fcd3143fb1258a2e93a4aaf891b5783c3e8aece9f6684c4f97e359d96f3edb7903be73cefcdc9617513cd8498a1c91e9212821e39430.tar.gz"

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