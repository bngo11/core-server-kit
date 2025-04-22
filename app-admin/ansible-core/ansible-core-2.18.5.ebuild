# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3+ )
DISTUTILS_USE_PEP517="setuptools"
inherit distutils-r1

DESCRIPTION="Model-driven deployment, config management, and command execution framework"
HOMEPAGE="https://ansible.com/"
SRC_URI="https://files.pythonhosted.org/packages/32/54/0d859184549efa339b2e370930a7741b42030cc357e107863cbadc3e72d8/ansible_core-2.18.5.tar.gz -> ansible_core-2.18.5.tar.gz"

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
S="${WORKDIR}/ansible_core-2.18.5"