# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )

SRC_URI="https://files.pythonhosted.org/packages/8c/dc/2e5333a81ce2655e8596fbe43f1b2b9afe02acdc054add0981394cb8e281/certbot-dns-sakuracloud-2.7.2.tar.gz -> certbot-dns-sakuracloud-2.7.2.tar.gz"
KEYWORDS="*"

inherit distutils-r1

DESCRIPTION="Sakura Cloud DNS Authenticator plugin for Certbot"
HOMEPAGE="https://github.com/certbot/certbot https://letsencrypt.org/"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

CDEPEND=">=dev-python/setuptools-1.0[${PYTHON_USEDEP}]"
RDEPEND="${CDEPEND}
	>=app-crypt/certbot-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/acme-0.31.0[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	>=dev-python/dns-lexicon-2.1.23[${PYTHON_USEDEP}]"
DEPEND="${CDEPEND}"