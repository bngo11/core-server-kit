# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="https://github.com/awslabs/aws-crt-python"
SRC_URI="
	https://github.com/awslabs/aws-crt-python/tarball/a964bef3b361abf14eea49028e54ccbb2d60a7e5 -> aws-crt-python-0.38.0-a964bef.tar.gz
	https://github.com/awslabs/aws-c-auth/tarball/05810b36e4731ec52432f050ed20851ba59f3df5 -> aws-c-auth-1.0.1-05810b3.tar.gz
	https://github.com/awslabs/aws-c-cal/tarball/2441187f3bdbe0f0fe7fa5dd1736be98227ad556 -> aws-c-cal-1.0.0-2441187.tar.gz
	https://github.com/awslabs/aws-c-common/tarball/2a29f7ea85397ff15e41ae086fb3662484fd305d -> aws-c-common-1.0.3-2a29f7e.tar.gz
	https://github.com/awslabs/aws-c-compression/tarball/891312c058e69a4d55f569f79dde1ee221982532 -> aws-c-compression-1.0.0-891312c.tar.gz
	https://github.com/awslabs/aws-c-event-stream/tarball/d32600bfecc6616cab0c478f96ea5a779f03e05e -> aws-c-event-stream-1.0.0-d32600b.tar.gz
	https://github.com/awslabs/aws-c-http/tarball/d19eabf4c5dc78ee1e07033a5015e9d50d04ec31 -> aws-c-http-1.1.1-d19eabf.tar.gz
	https://github.com/awslabs/aws-c-io/tarball/1831a1943e4c4a034d42f954e8f154cf6b9b492f -> aws-c-io-1.1.0-1831a19.tar.gz
	https://github.com/awslabs/aws-c-mqtt/tarball/96af751fa58d4d6704881463a4d6895b107268ed -> aws-c-mqtt-1.1.2-96af751.tar.gz
	https://github.com/awslabs/aws-c-s3/tarball/eeb85f3e4ed89497a93952964bd8228d1f435e6e -> aws-c-s3-1.3.1-eeb85f3.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/tarball/de0fbe807a409158c3fa285bafb88120c8989609 -> aws-c-sdkutils-1.0.0-de0fbe8.tar.gz
	https://github.com/awslabs/aws-checksums/tarball/12cd22e81543b8547132762023076ab6afa25559 -> aws-checksums-1.0.1-12cd22e.tar.gz
	https://github.com/awslabs/aws-lc/tarball/fa9bc8d6f7cfb2cf849b247fb06bbbfc41ecc9d6 -> aws-lc-5.11.0-fa9bc8d.tar.gz
	https://github.com/aws/s2n-tls/tarball/b170000016fb44fa4dfdd86ed0b75bd28241e707 -> s2n-tls-1.7.11-b170000.tar.gz
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