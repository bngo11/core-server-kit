# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Provides a tag-expression parser and evaluation logic for cucumber/behave"
HOMEPAGE="None https://pypi.org/project/cucumber-tag-expressions/"
SRC_URI="https://files.pythonhosted.org/packages/b1/e0/de0b292a533846def28a4373a00c883ffa5ed986ca79f0284bd69a6297b8/cucumber_tag_expressions-9.1.0.tar.gz -> cucumber_tag_expressions-9.1.0.tar.gz"

DEPEND=""
IUSE=""
SLOT="0"
LICENSE=""
KEYWORDS="*"
S="${WORKDIR}/cucumber_tag_expressions-9.1.0"