# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3+ )
DISTUTILS_USE_PEP517="setuptools"
inherit distutils-r1

DESCRIPTION="Radically simple IT automation"
HOMEPAGE="https://ansible.com/ https://pypi.org/project/ansible/"
SRC_URI="https://files.pythonhosted.org/packages/32/e8/3bbd91286c1b858afafac59a4f582c5f0344efabb4f4e013de9d1d9c21c2/ansible-10.1.0.tar.gz -> ansible-10.1.0.tar.gz"

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
S="${WORKDIR}/ansible-10.1.0"