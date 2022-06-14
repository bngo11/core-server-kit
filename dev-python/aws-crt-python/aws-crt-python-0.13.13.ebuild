# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="https://github.com/awslabs/aws-crt-python"
SRC_URI="
	https://github.com/awslabs/aws-crt-python/tarball/e07efb497ea76df105aba0b2ef2d02b6adf51ef5 -> aws-crt-python-0.13.13-e07efb4.tar.gz
	https://github.com/awslabs/aws-c-auth/tarball/5755fc110b6d7e3ac4225fd50415b518e061dd8c -> aws-c-auth-0.6.13-5755fc1.tar.gz
	https://github.com/awslabs/aws-c-cal/tarball/7eb1d7360ea205ff275d2acc6cce2682063b643f -> aws-c-cal-0.5.17-7eb1d73.tar.gz
	https://github.com/awslabs/aws-c-common/tarball/ab0a44ad9bf2c83f9ff9037a0e7235eb97e1c856 -> aws-c-common-0.7.4-ab0a44a.tar.gz
	https://github.com/awslabs/aws-c-compression/tarball/5fab8bc5ab5321d86f6d153b06062419080820ec -> aws-c-compression-0.2.14-5fab8bc.tar.gz
	https://github.com/awslabs/aws-c-event-stream/tarball/956f3442f6b9132f68b21d0604316fd11b698c7a -> aws-c-event-stream-0.2.11-956f344.tar.gz
	https://github.com/awslabs/aws-c-http/tarball/aadc57a3829cb057acdd6d57ed0991ff61a71192 -> aws-c-http-0.6.17-aadc57a.tar.gz
	https://github.com/awslabs/aws-c-io/tarball/8b93aaed5e2ae26f459380bbdbc90ee1e578f8d3 -> aws-c-io-0.11.2-8b93aae.tar.gz
	https://github.com/awslabs/aws-c-mqtt/tarball/6168e32bf9f745dec40df633b78baa03420b7f83 -> aws-c-mqtt-0.7.10-6168e32.tar.gz
	https://github.com/awslabs/aws-c-s3/tarball/a884b3ced7c82773a6526fdeb0952d9a1432b734 -> aws-c-s3-0.1.41-a884b3c.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/tarball/e3c23f4aca31d9e66df25827645f72cbcbfb657a -> aws-c-sdkutils-0.1.2-e3c23f4.tar.gz
	https://github.com/awslabs/aws-checksums/tarball/41df3031b92120b6d8127b7b7122391d5ac6f33f -> aws-checksums-0.1.12-41df303.tar.gz
	https://github.com/awslabs/aws-lc/tarball/e7413d237bb60bf639e78aa43ff3c1b1783f0712 -> aws-lc-1.1.0-e7413d2.tar.gz
	https://github.com/aws/s2n-tls/tarball/71b27e9fae142841c3140bfcb44ad20924504ba3 -> s2n-tls-1.3.15-71b27e9.tar.gz
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