# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3+ )
DISTUTILS_USE_PEP517="setuptools"
inherit distutils-r1

DESCRIPTION="Model-driven deployment, config management, and command execution framework"
HOMEPAGE="https://ansible.com/"
SRC_URI="https://files.pythonhosted.org/packages/16/f1/1c21d3bff03fe9a5b51515307db7a76ec8b8972c70d5702cc3027c988a99/ansible_core-2.19.2.tar.gz -> ansible_core-2.19.2.tar.gz"

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
S="${WORKDIR}/ansible_core-2.19.2"