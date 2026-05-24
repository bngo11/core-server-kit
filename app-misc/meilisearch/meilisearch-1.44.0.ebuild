# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo user

DESCRIPTION="A lightning-fast search engine that fits effortlessly into your apps, websites, and workflow"
HOMEPAGE="https://www.meilisearch.com/"
SRC_URI="
	https://github.com/meilisearch/meilisearch/tarball/6294894c488663b76f78464937f258424ac1a83d -> meilisearch-1.44.0-6294894.tar.gz
	https://direct.funtoo.org/ab/89/7a/ab897a0863da9c9e0b57fc56d3d5f1c2b47e0865b20d38d096c1fb2b1c20399a4430b49449894b806d562a62e1086f7d61c04a637fb37fe9d5ccc9a67d51859b -> meilisearch-1.44.0-funtoo-crates-bundle-5a22213497763f891110467140cad3a761489bf586453c4e8842f86cd2cf33ff28cc1b0073c8d779b453b18e23e3bc3a492bd512e2798b930b44105e38ff6f44.tar.gz
	https://mirrors.dotsrc.org/osdn/unidic/58338/unidic-mecab-2.1.2_src.zip -> unidic-mecab-2.1.2_src.zip
	mini-dashboard? ( https://github.com/meilisearch/mini-dashboard/releases/download/v0.4.1/build.zip -> meilisearch-mini-dashboard-c4de9bfd4bd4ddb87a62cbe00a4150bdf0b6f9d1.zip )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="+mini-dashboard"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/rust
"

S="${WORKDIR}/meilisearch-meilisearch-6294894"

MEILI_DATA_DIR="/var/lib/${PN}"

pkg_setup() {
	enewgroup "${PN}"
	enewuser "${PN}" -1 -1 "${MEILI_DATA_DIR}" "${PN}"
}

src_prepare() {
	default

	# Patch lindera-unidic to use the unidic-mecab src downloaded by the ebuild
	local lindera_unidic_build=$(find "${WORKDIR}"/cargo_home/gentoo/lindera-unidic-* -iname build.rs)

	# Replace the input/unpacked folder with our version
	sed -i 's|\(let input_dir =.*\)\("unidic-mecab.*"\)\(.*\)|\1"unidic-mecab-2.1.2_src"\3|' "${lindera_unidic_build}"

	# Replace the path to the source with the one downloaded by the ebuild
	sed -i "s|\(let source_path_for_build =\).*$|\1 Path::new("'"'"${DISTDIR}/unidic-mecab-2.1.2_src.zip"'"'");|" "${lindera_unidic_build}"

	if use mini-dashboard; then
		# Inject path to downloaded mini-dashboard build
		sed -i "s|https://github.com/meilisearch/mini-dashboard/releases/download/v0.4.1/build.zip|${DISTDIR}/meilisearch-mini-dashboard-c4de9bfd4bd4ddb87a62cbe00a4150bdf0b6f9d1.zip|g" "${S}"/meilisearch/Cargo.toml

		# Replace HTTP fetch with direct file read
		sed -i -r 's|(let dashboard_assets_bytes =)(.*)$|\1 std::fs::read(url)?;|' "${S}"/meilisearch/build.rs
	fi
}

src_configure() {
	CARGO_FEATURES=(
		"analytics"
		"meilisearch-types/all-tokenizations"
		"$(usex mini-dashboard mini-dashboard '')"
	)

	default
}

src_compile() {
	export VERGEN_GIT_SHA="6294894c488663b76f78464937f258424ac1a83d"
	export VERGEN_GIT_SEMVER_LIGHTWEIGHT="${PV}"

	cargo build --release -p meilisearch \
		--no-default-features ${CARGO_FEATURES:+--features "${CARGO_FEATURES[*]}"} || die "compile failed"
}

src_install() {
	cargo_src_install --path meilisearch --frozen \
		--no-default-features ${CARGO_FEATURES:+--features "${CARGO_FEATURES[*]}"}

	mkdir -p "${ED}"/"${MEILI_DATA_DIR}"
	pushd "${ED}"/"${MEILI_DATA_DIR}"

	for dir in data dumps snapshots; do
		mkdir "${dir}"

		pushd "${dir}" >/dev/null
		touch .keep
		popd >/dev/null
	done

	fowners -R "${PN}":"${PN}" /var/lib/meilisearch
	fperms -R 750 /var/lib/meilisearch

	insinto /etc
	doins "${FILESDIR}"/"${PN}".toml
	fowners "${PN}":"${PN}" /etc/"${PN}".toml

	newinitd "${FILESDIR}"/"${PN}".initd "${PN}"
}