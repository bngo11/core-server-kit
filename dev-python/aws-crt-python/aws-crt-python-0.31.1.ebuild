# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="https://github.com/awslabs/aws-crt-python"
SRC_URI="
	https://github.com/awslabs/aws-crt-python/tarball/decec943cefb62f5bc2bb36fb931c60539d13d38 -> aws-crt-python-0.31.1-decec94.tar.gz
	https://github.com/awslabs/aws-c-auth/tarball/a4409b95dad40a45b81e5fc9ff96f41386845e4f -> aws-c-auth-0.9.5-a4409b9.tar.gz
	https://github.com/awslabs/aws-c-cal/tarball/1cb9412158890201a6ffceed779f90fe1f48180c -> aws-c-cal-0.9.13-1cb9412.tar.gz
	https://github.com/awslabs/aws-c-common/tarball/95515a8b1ff40d5bb14f965ca4cbbe99ad1843df -> aws-c-common-0.12.6-95515a8.tar.gz
	https://github.com/awslabs/aws-c-compression/tarball/d8264e64f698341eb03039b96b4f44702a9b3f83 -> aws-c-compression-0.3.2-d8264e6.tar.gz
	https://github.com/awslabs/aws-c-event-stream/tarball/f43a3d24a7c1f8b50f709ccb4fdf4c7fd2827fff -> aws-c-event-stream-0.5.9-f43a3d2.tar.gz
	https://github.com/awslabs/aws-c-http/tarball/a9745ea9998f679cd7456e7d23cc8820e38c97d4 -> aws-c-http-0.10.10-a9745ea.tar.gz
	https://github.com/awslabs/aws-c-io/tarball/bfb0819d3906502483611ce832a5ec6b897c8421 -> aws-c-io-0.26.1-bfb0819.tar.gz
	https://github.com/awslabs/aws-c-mqtt/tarball/1d512d92709f60b74e2cafa018e69a2e647f28e9 -> aws-c-mqtt-0.13.3-1d512d9.tar.gz
	https://github.com/awslabs/aws-c-s3/tarball/e9d1bde139f88b08aaa3bf0507f443f31ccede93 -> aws-c-s3-0.11.5-e9d1bde.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/tarball/f678bda9e21f7217e4bbf35e0d1ea59540687933 -> aws-c-sdkutils-0.2.4-f678bda.tar.gz
	https://github.com/awslabs/aws-checksums/tarball/270b15acc1b2125340ec1c6dda6cc3c28ef0fa44 -> aws-checksums-0.2.8-270b15a.tar.gz
	https://github.com/awslabs/aws-lc/tarball/bee13c3051b4cdc568d4c358660aeeb734157804 -> aws-lc-1.67.0-bee13c3.tar.gz
	https://github.com/aws/s2n-tls/tarball/f5e5e83031be60691f22442373fb8371274fcd56 -> s2n-tls-1.7.0-f5e5e83.tar.gz
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