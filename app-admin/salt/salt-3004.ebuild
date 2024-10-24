# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )
DISTUTILS_USE_SETUPTOOLS=bdepend
inherit distutils-r1

DESCRIPTION="Salt is a remote execution and configuration manager"
HOMEPAGE="https://www.saltstack.com/resources/community/
	https://github.com/saltstack"

SRC_URI="https://files.pythonhosted.org/packages/0f/35/e4e1f092eb1a22e807f9bcc5712701bf4d55f9ab41eb2cca55680817ef05/salt-3004.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="cheetah cherrypy ldap libcloud libvirt genshi gnupg keyring mako
	mongodb neutron	nova openssl portage profile redis selinux test raet
	+zeromq vim-syntax"
KEYWORDS="*"

RDEPEND="
	sys-apps/pciutils
	>=dev-python/distro-1.5[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/libnacl[${PYTHON_USEDEP}]
	dev-python/msgpack[${PYTHON_USEDEP}]
	|| (
		dev-python/m2crypto[${PYTHON_USEDEP}]
		dev-python/pycryptodome[${PYTHON_USEDEP}]
	)
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/markupsafe[${PYTHON_USEDEP}]
	>=dev-python/requests-1.0.0[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	libcloud? ( >=dev-python/libcloud-0.14.0[${PYTHON_USEDEP}] )
	mako? ( dev-python/mako[${PYTHON_USEDEP}] )
	ldap? ( dev-python/python-ldap[${PYTHON_USEDEP}] )
	libvirt? (
		$(python_gen_cond_dep 'dev-python/libvirt-python[${PYTHON_USEDEP}]' python3_7)
	)
	openssl? (
		dev-libs/openssl:0=[-bindist]
		dev-python/pyopenssl[${PYTHON_USEDEP}]
	)
	raet? (
		>=dev-python/libnacl-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/ioflo-1.1.7[${PYTHON_USEDEP}]
		>=dev-python/raet-0.6.0[${PYTHON_USEDEP}]
	)
	cherrypy? ( >=dev-python/cherrypy-3.2.2[${PYTHON_USEDEP}] )
	cheetah? ( dev-python/cheetah3[${PYTHON_USEDEP}] )
	mongodb? ( dev-python/pymongo[${PYTHON_USEDEP}] )
	portage? ( sys-apps/portage[${PYTHON_USEDEP}] )
	keyring? ( dev-python/keyring[${PYTHON_USEDEP}] )
	redis? ( dev-python/redis-py[${PYTHON_USEDEP}] )
	selinux? ( sec-policy/selinux-salt )
	nova? (
		$(python_gen_cond_dep '>=dev-python/python-novaclient-2.17.0[${PYTHON_USEDEP}]' python3_7)
	)
	neutron? (
		$(python_gen_cond_dep '>=dev-python/python-neutronclient-2.3.6[${PYTHON_USEDEP}]' python3_7)
	)
	gnupg? ( dev-python/python-gnupg[${PYTHON_USEDEP}] )
	profile? ( dev-python/yappi[${PYTHON_USEDEP}] )
	vim-syntax? ( app-vim/salt-vim )
	zeromq? ( >=dev-python/pyzmq-2.2.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		${RDEPEND}
		>=dev-python/boto-2.32.1[${PYTHON_USEDEP}]
		>=dev-python/jsonschema-3.0[${PYTHON_USEDEP}]
		>=dev-python/libcloud-0.14.0[${PYTHON_USEDEP}]
		>=dev-python/mock-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/moto-0.3.6[${PYTHON_USEDEP}]
		dev-python/pip[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-helpers-namespace[${PYTHON_USEDEP}]
		dev-python/pytest-helpers-namespace[${PYTHON_USEDEP}]
		>=dev-python/pytest-salt-2018.12.8[${PYTHON_USEDEP}]
		dev-python/pytest-tempdir[${PYTHON_USEDEP}]
		>=dev-python/SaltTesting-2016.5.11[${PYTHON_USEDEP}]
		dev-python/virtualenv[${PYTHON_USEDEP}]
		!x86? ( >=dev-python/boto3-1.2.1[${PYTHON_USEDEP}] )
	)"

DOCS=( README.rst AUTHORS )

REQUIRED_USE="|| ( raet zeromq )
	test? ( cheetah genshi )"
RESTRICT="!test? ( test ) x86? ( test )"

python_prepare() {
	# remove tests with external dependencies that may not be available
	rm tests/unit/{test_zypp_plugins.py,utils/test_extend.py} || die
	rm tests/unit/modules/test_{file,boto_{vpc,secgroup,elb}}.py || die
	rm tests/unit/states/test_boto_vpc.py || die

	# tests that require network access
	rm tests/unit/{states,modules}/test_zcbuildout.py || die

	# make sure pkg_resources doesn't bomb because pycrypto isn't installed
	find . -name '*.txt' -print0 | xargs -0 sed -e '/pycrypto>/ d' -i || die

	einfo "Fixing collections.abc warnings for ${EPYTHON}"
	local abc
	abc="$("${EPYTHON}" -c 'import collections.abc; print("|".join((c for c in dir(collections.abc) if not c.startswith("_"))))')" || die
	find -name '*.py' -type f -print0 | xargs -0 sed -r -e "s:collections\\.(${abc}):collections.abc.\\1:g" -i || die

	# allow the use of the renamed msgpack
	sed -i '/^msgpack/d' requirements/base.txt || die
}

python_install_all() {
	local svc
	USE_SETUPTOOLS=1 distutils-r1_python_install_all

	for svc in minion master syndic api; do
		newinitd "${FILESDIR}"/${svc}-initd-4 salt-${svc}
		newconfd "${FILESDIR}"/${svc}-confd-1 salt-${svc}
	done

	# See FL-6970: remove invalid dependency on pycrypto:
	for x in $D/usr/lib/python*/site-packages/salt-${PV}-py*.egg-info/requires.txt; do
		einfo 'Removing pycrypto from requires.txt'
		sed -i -e '/^pycrypto/d' $x || die "sed fail"
	done


	insinto /etc/${PN}
	doins -r conf/*
}

python_test() {
	local tempdir
	# testsuite likes lots of files
	ulimit -n 3072 || die

	# ${T} is too long a path for the tests to work
	tempdir="$(mktemp -du --tmpdir=/tmp salt-XXX)"
	mkdir "${T}/$(basename "${tempdir}")"

	(
		cleanup() { rm -f "${tempdir}" || die; }

		trap cleanup EXIT

		addwrite "${tempdir}"
		ln -s "$(realpath --relative-to=/tmp "${T}/$(basename "${tempdir}")")" "${tempdir}" || die

		USE_SETUPTOOLS=1 SHELL="/bin/bash" \
			TMPDIR="${tempdir}" \
			${EPYTHON} tests/runtests.py \
			--unit-tests --no-report --verbose \
			|| die "testing failed with ${EPYTHON}"
	)
}