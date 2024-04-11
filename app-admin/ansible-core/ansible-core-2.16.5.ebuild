# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3+ )
DISTUTILS_USE_PEP517="setuptools"
inherit distutils-r1

DESCRIPTION="Model-driven deployment, config management, and command execution framework"
HOMEPAGE="https://ansible.com/"
SRC_URI="https://files.pythonhosted.org/packages/d0/49/ef4490d316d74a4f38dde04d9f29d1a3f7c67ba33f53a96612d8e7e56051/ansible-core-2.16.5.tar.gz -> ansible-core-2.16.5.tar.gz"

DEPEND=""
RDEPEND="
	net-misc/sshpass
	virtual/ssh
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/httplib2[${PYTHON_USEDEP}]
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
LICENSE="GPL-3"
KEYWORDS="*"
S="${WORKDIR}/ansible-core-2.16.5"