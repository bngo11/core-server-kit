# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="https://github.com/awslabs/aws-crt-python"
SRC_URI="
	https://github.com/awslabs/aws-crt-python/tarball/9726f434f5933092a512f51be3d253ec127eec3d -> aws-crt-python-0.38.1-9726f43.tar.gz
	https://github.com/awslabs/aws-c-auth/tarball/7d87eede281b4d096c6ad98d5bbdd92a8f5e9ac5 -> aws-c-auth-1.0.4-7d87eed.tar.gz
	https://github.com/awslabs/aws-c-cal/tarball/2441187f3bdbe0f0fe7fa5dd1736be98227ad556 -> aws-c-cal-1.0.0-2441187.tar.gz
	https://github.com/awslabs/aws-c-common/tarball/45e9307382f196175f0dbb832a178570924bda96 -> aws-c-common-1.0.5-45e9307.tar.gz
	https://github.com/awslabs/aws-c-compression/tarball/891312c058e69a4d55f569f79dde1ee221982532 -> aws-c-compression-1.0.0-891312c.tar.gz
	https://github.com/awslabs/aws-c-event-stream/tarball/d32600bfecc6616cab0c478f96ea5a779f03e05e -> aws-c-event-stream-1.0.0-d32600b.tar.gz
	https://github.com/awslabs/aws-c-http/tarball/bf9994952db54440754f1eff9b5d41582e71ee52 -> aws-c-http-1.2.0-bf99949.tar.gz
	https://github.com/awslabs/aws-c-io/tarball/eac372568ea06c999cb26c4db996633c84b4e86d -> aws-c-io-1.1.2-eac3725.tar.gz
	https://github.com/awslabs/aws-c-mqtt/tarball/96af751fa58d4d6704881463a4d6895b107268ed -> aws-c-mqtt-1.1.2-96af751.tar.gz
	https://github.com/awslabs/aws-c-s3/tarball/bc923d67e7aa85fa715c46bd95c0c5711148873c -> aws-c-s3-1.5.2-bc923d6.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/tarball/66a79c011dbe057fcc6e9620f93a52c2c29843e8 -> aws-c-sdkutils-1.0.1-66a79c0.tar.gz
	https://github.com/awslabs/aws-checksums/tarball/12cd22e81543b8547132762023076ab6afa25559 -> aws-checksums-1.0.1-12cd22e.tar.gz
	https://github.com/awslabs/aws-lc/tarball/7821a7544c6dce1bb5fc927aa273d4ee7a536988 -> aws-lc-5.14.0-7821a75.tar.gz
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