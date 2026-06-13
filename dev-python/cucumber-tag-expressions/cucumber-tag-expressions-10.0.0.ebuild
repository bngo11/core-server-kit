# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Provides a tag-expression parser and evaluation logic for cucumber/behave"
HOMEPAGE="None https://pypi.org/project/cucumber-tag-expressions/"
SRC_URI="https://files.pythonhosted.org/packages/cd/8d/e2b978e7d42842ba974df1ae5613f451904765f155a019570744668963d3/cucumber_tag_expressions-10.0.0.tar.gz -> cucumber_tag_expressions-10.0.0.tar.gz"

DEPEND=""
IUSE=""
SLOT="0"
LICENSE=""
KEYWORDS="*"
S="${WORKDIR}/cucumber_tag_expressions-10.0.0"