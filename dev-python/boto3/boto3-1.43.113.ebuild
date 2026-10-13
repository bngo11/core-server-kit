# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="The AWS SDK for Python (Boto3)"
HOMEPAGE="https://github.com/boto/boto3 https://pypi.org/project/boto3/"
SRC_URI="https://files.pythonhosted.org/packages/d4/d5/3d303c78f5677520f9d3eacaca3d7f9a3dd3388f0ac2b9d357d0e2c0807c/boto3-1.43.113.tar.gz -> boto3-1.43.113.tar.gz"

DEPEND=""
RDEPEND="
	dev-python/botocore[${PYTHON_USEDEP}]
	dev-python/jmespath[${PYTHON_USEDEP}]
	dev-python/s3transfer[${PYTHON_USEDEP}]"
IUSE=""
SLOT="0"
LICENSE="Apache-2.0"
KEYWORDS="*"
S="${WORKDIR}/boto3-1.43.113"