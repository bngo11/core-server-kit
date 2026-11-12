# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )

SRC_URI="https://files.pythonhosted.org/packages/d9/f8/ab4b1dffb6ad7094f77452035e8dc9187969f61076b1c613c70839dd4df1/certbot_dns_dnsmadeeasy-5.10.0.tar.gz -> certbot_dns_dnsmadeeasy-5.10.0.tar.gz"
KEYWORDS="*"

inherit distutils-r1

DESCRIPTION="DNS Made Easy DNS Authenticator plugin for Certbot"
HOMEPAGE="https://github.com/certbot/certbot https://letsencrypt.org/"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

CDEPEND=">=dev-python/setuptools-1.0[${PYTHON_USEDEP}]"
RDEPEND="${CDEPEND}
	>=app-crypt/certbot-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/acme-0.31.0[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}
	>=dev-python/dns-lexicon-2.2.1[${PYTHON_USEDEP}]"
DEPEND="${CDEPEND}"