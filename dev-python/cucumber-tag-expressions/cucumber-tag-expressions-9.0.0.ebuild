# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Provides a tag-expression parser and evaluation logic for cucumber/behave"
HOMEPAGE="None https://pypi.org/project/cucumber-tag-expressions/"
SRC_URI="https://files.pythonhosted.org/packages/37/97/61f67f61041c9356686b1098596f436d900fc6c44e63314252da8a60b394/cucumber_tag_expressions-9.0.0.tar.gz -> cucumber_tag_expressions-9.0.0.tar.gz"

DEPEND=""
IUSE=""
SLOT="0"
LICENSE=""
KEYWORDS="*"
S="${WORKDIR}/cucumber_tag_expressions-9.0.0"