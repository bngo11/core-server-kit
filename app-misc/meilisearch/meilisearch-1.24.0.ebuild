# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo user

DESCRIPTION="A lightning-fast search engine that fits effortlessly into your apps, websites, and workflow"
HOMEPAGE="https://www.meilisearch.com/"
SRC_URI="
	https://github.com/meilisearch/meilisearch/tarball/6df196034e2f100e51143f759937531b3061116f -> meilisearch-1.24.0-6df1960.tar.gz
	https://direct.funtoo.org/e1/76/75/e176752c283b7eac806f7098332d8700a3231e49cb8df12e1e30e2b217754fab779be265af0e11936ebbab34821a2ec15c8020e0ff45e193835fb8620a1b7f47 -> meilisearch-1.24.0-funtoo-crates-bundle-36c98524e9aebc9e37a2c8ff0f01ac48ed6378c6bc40e30d9f424155d5e16eb9e5c56ba18dc9f5479c60c394e995999f9a31b576aaaee078eb201ff8d763330d.tar.gz
	https://dotsrc.dl.osdn.net/osdn/unidic/58338/unidic-mecab-2.1.2_src.zip -> unidic-mecab-2.1.2_src.zip
	mini-dashboard? ( https://github.com/meilisearch/mini-dashboard/releases/download/v0.2.22/build.zip -> meilisearch-mini-dashboard-b70b2036b5f167da9ea0b637da8b320c7ea88254.zip )
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

S="${WORKDIR}/meilisearch-meilisearch-6df1960"

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
		sed -i "s|https://github.com/meilisearch/mini-dashboard/releases/download/v0.2.22/build.zip|${DISTDIR}/meilisearch-mini-dashboard-b70b2036b5f167da9ea0b637da8b320c7ea88254.zip|g" "${S}"/meilisearch/Cargo.toml

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
	export VERGEN_GIT_SHA="6df196034e2f100e51143f759937531b3061116f"
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