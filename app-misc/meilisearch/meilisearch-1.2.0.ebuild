# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo user

DESCRIPTION="A lightning-fast search engine that fits effortlessly into your apps, websites, and workflow"
HOMEPAGE="https://www.meilisearch.com/"
SRC_URI="https://github.com/meilisearch/meilisearch/tarball/d963b5f85ae9aea42615924de4e41e96a1e5358e -> meilisearch-1.2.0-d963b5f.tar.gz
https://direct.funtoo.org/46/46/01/46460130c0ad4d77fb39b4df5277c17495e7419f71275d46609ca03ca92bee11e6f96a320c614e4d2f87300e0e29518d6a72714a238e72a4b2e920d51783a3f1 -> meilisearch-1.2.0-funtoo-crates-bundle-f3a0c69e410b1d02ed30144270edf38ce13361aad79514b9b569420f5d77f19693e3704e35d4104e09c930867f301002466b7970e6c8e86bec98f173de87f467.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/rust
"

S="${WORKDIR}/meilisearch-meilisearch-d963b5f"

MEILI_DATA_DIR="/var/lib/${PN}"

CARGO_FEATURES=(
	--no-default-features
	--features="analytics meilisearch-types/all-tokenizations"
)

pkg_setup() {
	enewgroup "${PN}"
	enewuser "${PN}" -1 -1 "${MEILI_DATA_DIR}" "${PN}"
}

src_compile() {
	export VERGEN_GIT_SHA="d963b5f85ae9aea42615924de4e41e96a1e5358e"
	export VERGEN_GIT_SEMVER_LIGHTWEIGHT="${PV}"

	cargo build --release -p meilisearch \
		"${CARGO_FEATURES[@]}" || die "compile failed"
}

src_install() {
	cargo_src_install --path meilisearch --frozen "${CARGO_FEATURES[@]}"

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