# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7 )

inherit eutils systemd distutils-r1

DESCRIPTION="Salt is a remote execution and configuration manager"
HOMEPAGE="https://www.saltstack.com/resources/community/
	https://github.com/saltstack"

SRC_URI="https://files.pythonhosted.org/packages/56/16/7e0894484a9c42bd4da9f0507c315c00e4e68735566ff6f8f40b841d4eee/salt-2019.2.5.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="cherrypy ldap libcloud libvirt gnupg keyring mako mongodb mysql neutron nova"
IUSE+=" openssl portage profile redis selinux test timelib raet +zeromq vim-syntax"
KEYWORDS="*"

RDEPEND="sys-apps/pciutils
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/libnacl[${PYTHON_USEDEP}]
	dev-python/msgpack-compat[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/markupsafe[${PYTHON_USEDEP}]
	>=dev-python/requests-1.0.0[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	www-servers/tornado-compat[${PYTHON_USEDEP}]
	virtual/python-futures[${PYTHON_USEDEP}]
	libcloud? ( >=dev-python/libcloud-0.14.0[${PYTHON_USEDEP}] )
	mako? ( dev-python/mako[${PYTHON_USEDEP}] )
	ldap? ( dev-python/python-ldap[${PYTHON_USEDEP}] )
	libvirt? ( dev-python/libvirt-python[${PYTHON_USEDEP}] )
	openssl? (
		dev-libs/openssl:0=[-bindist]
		dev-python/pyopenssl[${PYTHON_USEDEP}]
	)
	raet? (
		>=dev-python/libnacl-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/ioflo-1.1.7[${PYTHON_USEDEP}]
		>=dev-python/raet-0.6.0[${PYTHON_USEDEP}]
	)
	zeromq? (
		>=dev-python/pyzmq-2.2.0[${PYTHON_USEDEP}]
		dev-python/pycryptodome[${PYTHON_USEDEP}]
	)
	cherrypy? ( >=dev-python/cherrypy-3.2.2[${PYTHON_USEDEP}] )
	mongodb? ( dev-python/pymongo[${PYTHON_USEDEP}] )
	portage? ( sys-apps/portage[${PYTHON_USEDEP}] )
	keyring? ( dev-python/keyring[${PYTHON_USEDEP}] )
	mysql? ( dev-python/mysql-python[$(python_gen_usedep 'python2*')] )
	redis? ( dev-python/redis-py[${PYTHON_USEDEP}] )
	selinux? ( sec-policy/selinux-salt )
	timelib? ( dev-python/timelib[$(python_gen_usedep 'python2*')] )
	nova? ( >=dev-python/python-novaclient-2.17.0[${PYTHON_USEDEP}] )
	neutron? ( >=dev-python/python-neutronclient-2.3.6[${PYTHON_USEDEP}] )
	gnupg? ( dev-python/python-gnupg[${PYTHON_USEDEP}] )
	profile? ( dev-python/yappi[${PYTHON_USEDEP}] )
	vim-syntax? ( app-vim/salt-vim )"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pytest-salt-2018.12.8[${PYTHON_USEDEP}]
		>=dev-python/jsonschema-3.0[${PYTHON_USEDEP}]
		dev-python/pytest-helpers-namespace[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-catchlog[${PYTHON_USEDEP}]
		dev-python/pip[${PYTHON_USEDEP}]
		dev-python/virtualenv[${PYTHON_USEDEP}]
		>=dev-python/mock-2.0.0[${PYTHON_USEDEP}]
		dev-python/timelib[$(python_gen_usedep 'python2*')]
		>=dev-python/boto-2.32.1[${PYTHON_USEDEP}]
		!x86? ( >=dev-python/boto3-1.2.1[${PYTHON_USEDEP}] )
		>=dev-python/moto-0.3.6[${PYTHON_USEDEP}]
		>=dev-python/SaltTesting-2016.5.11[${PYTHON_USEDEP}]
		>=dev-python/libcloud-0.14.0[${PYTHON_USEDEP}]
		${RDEPEND}
	)"

DOCS=( README.rst AUTHORS )

REQUIRED_USE="|| ( raet zeromq )"
RESTRICT="x86? ( test )"

PATCHES=(
	"${FILESDIR}/salt-2017.7.0-dont-realpath-tmpdir.patch"
	"${FILESDIR}/salt-2019.2.0-tests.patch"
	"${FILESDIR}/salt-2019.2.0-skip-tests-that-oom-machine.patch"
	"${FILESDIR}/salt-2019.2.2-newer-deps.patch"
	"${FILESDIR}/salt-2019.2.2-workaround-broken-mock-on-py2.patch"
)

python_prepare() {
	# remove tests with external dependencies that may not be available
	rm tests/unit/{test_zypp_plugins.py,utils/test_extend.py} || die
	rm tests/unit/modules/test_{file,boto_{vpc,secgroup,elb}}.py || die
	rm tests/unit/states/test_boto_vpc.py || die

	# allow the use of the renamed msgpack
	sed -i '/^msgpack/d' requirements/base.txt || die
}

python_install_all() {
	local svc
	USE_SETUPTOOLS=1 distutils-r1_python_install_all

	for svc in minion master syndic api; do
		newinitd "${FILESDIR}"/${svc}-initd-4 salt-${svc}
		newconfd "${FILESDIR}"/${svc}-confd-1 salt-${svc}
		systemd_dounit "${FILESDIR}"/salt-${svc}.service
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
	mkdir "${BUILD_DIR}"/../{templates,conf/cloud.{providers,profiles,maps}.d} || die

	(
		cleanup() {
			rm -f "${tempdir}"
			rmdir "${BUILD_DIR}"/../{templates,conf/cloud.{providers,profiles,maps}.d} || die
		}

		trap cleanup EXIT

		addwrite "${tempdir}"
		ln -s "$(realpath --relative-to=/tmp "${T}/$(basename "${tempdir}")")" "${tempdir}"

		USE_SETUPTOOLS=1 SHELL="/bin/bash" \
			TMPDIR="${tempdir}" \
			${EPYTHON} tests/runtests.py \
			--unit-tests --no-report --verbose

	) || die "testing failed"
}