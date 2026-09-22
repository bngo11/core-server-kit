# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="The AWS SDK for Python (Boto3)"
HOMEPAGE="https://github.com/boto/boto3 https://pypi.org/project/boto3/"
SRC_URI="https://files.pythonhosted.org/packages/99/10/5e0c4c1a87443680194db582888e8e5e0a80e3e1ed224ca8111becf9e5ed/boto3-1.43.99.tar.gz -> boto3-1.43.99.tar.gz"

DEPEND=""
RDEPEND="
	dev-python/botocore[${PYTHON_USEDEP}]
	dev-python/jmespath[${PYTHON_USEDEP}]
	dev-python/s3transfer[${PYTHON_USEDEP}]"
IUSE=""
SLOT="0"
LICENSE="Apache-2.0"
KEYWORDS="*"
S="${WORKDIR}/boto3-1.43.99"