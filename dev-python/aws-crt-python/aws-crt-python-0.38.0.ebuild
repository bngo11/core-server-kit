# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="https://github.com/awslabs/aws-crt-python"
SRC_URI="
	https://github.com/awslabs/aws-crt-python/tarball/a964bef3b361abf14eea49028e54ccbb2d60a7e5 -> aws-crt-python-0.38.0-a964bef.tar.gz
	https://github.com/awslabs/aws-c-auth/tarball/3d29adcecf5c032131acee9f4125a636d2aaea6a -> aws-c-auth-1.0.2-3d29adc.tar.gz
	https://github.com/awslabs/aws-c-cal/tarball/2441187f3bdbe0f0fe7fa5dd1736be98227ad556 -> aws-c-cal-1.0.0-2441187.tar.gz
	https://github.com/awslabs/aws-c-common/tarball/45e9307382f196175f0dbb832a178570924bda96 -> aws-c-common-1.0.5-45e9307.tar.gz
	https://github.com/awslabs/aws-c-compression/tarball/891312c058e69a4d55f569f79dde1ee221982532 -> aws-c-compression-1.0.0-891312c.tar.gz
	https://github.com/awslabs/aws-c-event-stream/tarball/d32600bfecc6616cab0c478f96ea5a779f03e05e -> aws-c-event-stream-1.0.0-d32600b.tar.gz
	https://github.com/awslabs/aws-c-http/tarball/d19eabf4c5dc78ee1e07033a5015e9d50d04ec31 -> aws-c-http-1.1.1-d19eabf.tar.gz
	https://github.com/awslabs/aws-c-io/tarball/cbc36857376bffb8f4654e6c4e443b6939e1629c -> aws-c-io-1.1.1-cbc3685.tar.gz
	https://github.com/awslabs/aws-c-mqtt/tarball/96af751fa58d4d6704881463a4d6895b107268ed -> aws-c-mqtt-1.1.2-96af751.tar.gz
	https://github.com/awslabs/aws-c-s3/tarball/1e5889547f1bdfd1d950829971503091e2dc91fd -> aws-c-s3-1.5.1-1e58895.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/tarball/66a79c011dbe057fcc6e9620f93a52c2c29843e8 -> aws-c-sdkutils-1.0.1-66a79c0.tar.gz
	https://github.com/awslabs/aws-checksums/tarball/12cd22e81543b8547132762023076ab6afa25559 -> aws-checksums-1.0.1-12cd22e.tar.gz
	https://github.com/awslabs/aws-lc/tarball/cd481c207e38f06aeb5766f4a1cdfce10a4c0af8 -> aws-lc-5.12.0-cd481c2.tar.gz
	https://github.com/aws/s2n-tls/tarball/e7ce83a27fa9525515a621754a7183a51c80246b -> s2n-tls-1.7.13-e7ce83a.tar.gz
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