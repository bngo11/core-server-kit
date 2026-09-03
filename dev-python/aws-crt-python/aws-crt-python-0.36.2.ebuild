# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="https://github.com/awslabs/aws-crt-python"
SRC_URI="
	https://github.com/awslabs/aws-crt-python/tarball/241be07f82ebd3031a812492443d545676cb2018 -> aws-crt-python-0.36.2-241be07.tar.gz
	https://github.com/awslabs/aws-c-auth/tarball/055e822f021d1cab11d608b94ac34de250986134 -> aws-c-auth-1.0.0-055e822.tar.gz
	https://github.com/awslabs/aws-c-cal/tarball/2441187f3bdbe0f0fe7fa5dd1736be98227ad556 -> aws-c-cal-1.0.0-2441187.tar.gz
	https://github.com/awslabs/aws-c-common/tarball/3d274e1af954592b344a33fdf042af37b936f3d5 -> aws-c-common-1.0.0-3d274e1.tar.gz
	https://github.com/awslabs/aws-c-compression/tarball/891312c058e69a4d55f569f79dde1ee221982532 -> aws-c-compression-1.0.0-891312c.tar.gz
	https://github.com/awslabs/aws-c-event-stream/tarball/d32600bfecc6616cab0c478f96ea5a779f03e05e -> aws-c-event-stream-1.0.0-d32600b.tar.gz
	https://github.com/awslabs/aws-c-http/tarball/2b563f8a7bd67a902a8b558bb44113748045877c -> aws-c-http-1.0.0-2b563f8.tar.gz
	https://github.com/awslabs/aws-c-io/tarball/1685abcd331dcced3da63b8d4cd3ced38a8bb14a -> aws-c-io-1.0.0-1685abc.tar.gz
	https://github.com/awslabs/aws-c-mqtt/tarball/f510465775dcce35be8a5cea1aec26893b8c975a -> aws-c-mqtt-1.0.0-f510465.tar.gz
	https://github.com/awslabs/aws-c-s3/tarball/8d7d4aeab6b9710cda5a6f44904d6ec3faf8861f -> aws-c-s3-1.0.0-8d7d4ae.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/tarball/de0fbe807a409158c3fa285bafb88120c8989609 -> aws-c-sdkutils-1.0.0-de0fbe8.tar.gz
	https://github.com/awslabs/aws-checksums/tarball/ee7c435de1677754c14e488aab699ed603ae552e -> aws-checksums-1.0.0-ee7c435.tar.gz
	https://github.com/awslabs/aws-lc/tarball/a3d1e685552f05a9ad04a2946962c03e97bdecac -> aws-lc-5.8.0-a3d1e68.tar.gz
	https://github.com/aws/s2n-tls/tarball/d25ca63bef1bc12daf2c92ffe2ad86a1689c6997 -> s2n-tls-1.7.9-d25ca63.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="dev-util/cmake"
RDEPEND=""
BDEPEND=""

AWS_C_MODULES=( 
	aws-c-auth
	aws-c-cal
	aws-c-common
	aws-c-compression
	aws-c-event-stream
	aws-c-http
	aws-c-io
	aws-c-mqtt
	aws-c-s3
	aws-c-sdkutils
	aws-checksums
	aws-lc
	s2n
)


post_src_unpack() {
	if [ ! -d "${S}" ] ; then
		mv "${WORKDIR}"/awslabs-aws-crt-python-* "${S}" || die
	fi

	for module in "${AWS_C_MODULES[@]}"; do
		rmdir ${S}/crt/${module} || die
		einfo "Moving ${module} into source tree"
		mv ${WORKDIR}/*${module}* ${S}/crt/${module} || die
	done
}