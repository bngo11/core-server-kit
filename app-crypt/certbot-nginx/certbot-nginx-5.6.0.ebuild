# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )

SRC_URI="https://files.pythonhosted.org/packages/74/7b/c099747aceb630816d3af89da314ba07047c9067a2e8fe63f4c4e57e1e5b/certbot_nginx-5.6.0.tar.gz -> certbot_nginx-5.6.0.tar.gz"
KEYWORDS="*"

inherit distutils-r1

DESCRIPTION="Nginx plugin for certbot (Let's Encrypt Client)"
HOMEPAGE="https://github.com/certbot/certbot https://letsencrypt.org/"
S=${WORKDIR}/certbot_nginx-${PV}
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

CDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${CDEPEND}
	>=dev-python/acme-1.0.0[${PYTHON_USEDEP}]
	>=app-crypt/certbot-1.1.0[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/pyopenssl[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-1.5.5[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]"
DEPEND="${CDEPEND}"