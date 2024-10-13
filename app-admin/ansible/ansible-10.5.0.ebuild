# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3+ )
DISTUTILS_USE_PEP517="setuptools"
inherit distutils-r1

DESCRIPTION="Radically simple IT automation"
HOMEPAGE="https://ansible.com/ https://pypi.org/project/ansible/"
SRC_URI="https://files.pythonhosted.org/packages/d7/23/ae30b280ebad1f19fa012c0410aaf7d50cd741a5786bd60a2ecba42d2cd4/ansible-10.5.0.tar.gz -> ansible-10.5.0.tar.gz"

DEPEND=""
RDEPEND="
	net-misc/sshpass
	virtual/ssh
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/httplib2[${PYTHON_USEDEP}]
	dev-python/importlib_resources[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/netaddr[${PYTHON_USEDEP}]
	dev-python/paramiko[${PYTHON_USEDEP}]
	dev-python/pexpect[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/packaging"
IUSE=""
SLOT="0"
LICENSE="GPL-3+"
KEYWORDS="*"
S="${WORKDIR}/ansible-10.5.0"