# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )

SRC_URI="https://files.pythonhosted.org/packages/cc/d4/4f5a66d67e3341a153ebb2820c74634af04fe494615f864c13a7dc65c70c/certbot_dns_gehirn-5.5.0.tar.gz -> certbot_dns_gehirn-5.5.0.tar.gz"
KEYWORDS="*"

inherit distutils-r1

DESCRIPTION="Gehirn Infrastructure Service DNS Authenticator plugin for Certbot"
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
	>=dev-python/dns-lexicon-2.1.22[${PYTHON_USEDEP}]"
DEPEND="${CDEPEND}"