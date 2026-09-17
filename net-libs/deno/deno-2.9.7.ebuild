# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern runtime for JavaScript and TypeScript."
HOMEPAGE="https://github.com/denoland/deno"
SRC_URI="https://github.com/denoland/deno/tarball/0c071246a412575e07423263404a5d13e7ed6aa2 -> deno-2.9.7-0c07124.tar.gz
https://direct.funtoo.org/4c/c3/8b/4cc38b3a5a50b161bc8bdea0950fca9a5471948a18e3e55a8a4bd17145242ccd2bbdd30e5cf5717557d29b91ec3339a6efa92a2fdbc34112698e861951bdf500 -> deno-2.9.7-funtoo-crates-bundle-850c8dfc158edfc1ae57439a107fd41d8f9bc827fdd176ce777a023f3da8563a9263c12ad6b0cabf03b8469b36517a6a5a0e811aaf6b93e2699c2c464589aba8.tar.gz"

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