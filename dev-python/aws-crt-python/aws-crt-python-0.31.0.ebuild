# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="https://github.com/awslabs/aws-crt-python"
SRC_URI="
	https://github.com/awslabs/aws-crt-python/tarball/0bdff88605bc06b4228658044c4693c1bd07428d -> aws-crt-python-0.31.0-0bdff88.tar.gz
	https://github.com/awslabs/aws-c-auth/tarball/a4409b95dad40a45b81e5fc9ff96f41386845e4f -> aws-c-auth-0.9.5-a4409b9.tar.gz
	https://github.com/awslabs/aws-c-cal/tarball/1cb9412158890201a6ffceed779f90fe1f48180c -> aws-c-cal-0.9.13-1cb9412.tar.gz
	https://github.com/awslabs/aws-c-common/tarball/95515a8b1ff40d5bb14f965ca4cbbe99ad1843df -> aws-c-common-0.12.6-95515a8.tar.gz
	https://github.com/awslabs/aws-c-compression/tarball/d8264e64f698341eb03039b96b4f44702a9b3f83 -> aws-c-compression-0.3.2-d8264e6.tar.gz
	https://github.com/awslabs/aws-c-event-stream/tarball/f43a3d24a7c1f8b50f709ccb4fdf4c7fd2827fff -> aws-c-event-stream-0.5.9-f43a3d2.tar.gz
	https://github.com/awslabs/aws-c-http/tarball/acf31399077300c522315612dd2be09cfe48b5b8 -> aws-c-http-0.10.9-acf3139.tar.gz
	https://github.com/awslabs/aws-c-io/tarball/93e934387cb5788acb234478a49d6d9e6c75650d -> aws-c-io-0.25.0-93e9343.tar.gz
	https://github.com/awslabs/aws-c-mqtt/tarball/1d512d92709f60b74e2cafa018e69a2e647f28e9 -> aws-c-mqtt-0.13.3-1d512d9.tar.gz
	https://github.com/awslabs/aws-c-s3/tarball/3a2d31ac5e2d557a1abbb15216efb5462461a82b -> aws-c-s3-0.11.4-3a2d31a.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/tarball/f678bda9e21f7217e4bbf35e0d1ea59540687933 -> aws-c-sdkutils-0.2.4-f678bda.tar.gz
	https://github.com/awslabs/aws-checksums/tarball/270b15acc1b2125340ec1c6dda6cc3c28ef0fa44 -> aws-checksums-0.2.8-270b15a.tar.gz
	https://github.com/awslabs/aws-lc/tarball/728811eecec794802c78105be6dbfe9d79870ac7 -> aws-lc-1.66.2-728811e.tar.gz
	https://github.com/aws/s2n-tls/tarball/3276a0876054e9efbeab4a42f34ef60b0bf58c91 -> s2n-tls-1.6.4-3276a08.tar.gz
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