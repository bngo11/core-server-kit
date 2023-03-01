# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="https://github.com/awslabs/aws-crt-python"
SRC_URI="
	https://github.com/awslabs/aws-crt-python/tarball/0d59a202940f4e49a540b4cb7824cd46fa9d115e -> aws-crt-python-0.16.10-0d59a20.tar.gz
	https://github.com/awslabs/aws-c-auth/tarball/dd505b55fd46222834f35c6e54165d8cbebbfaaa -> aws-c-auth-0.6.24-dd505b5.tar.gz
	https://github.com/awslabs/aws-c-cal/tarball/ac4216b78d5323b5b8ce95a3dd4a8fc0f95e2d33 -> aws-c-cal-0.5.20-ac4216b.tar.gz
	https://github.com/awslabs/aws-c-common/tarball/5cf17cd330ebe34736116fe5b901343f9111d987 -> aws-c-common-0.8.12-5cf17cd.tar.gz
	https://github.com/awslabs/aws-c-compression/tarball/b517b7decd0dac30be2162f5186c250221c53aff -> aws-c-compression-0.2.16-b517b7d.tar.gz
	https://github.com/awslabs/aws-c-event-stream/tarball/0f6eee87aee2860598084e814e0eedc0b3b9122d -> aws-c-event-stream-0.2.20-0f6eee8.tar.gz
	https://github.com/awslabs/aws-c-http/tarball/270f0968fd6b5317b8dd714b2bbc6fd04976dbcf -> aws-c-http-0.7.5-270f096.tar.gz
	https://github.com/awslabs/aws-c-io/tarball/ab77be6bf78932ec5bb357341f4bb2ca3e1103c7 -> aws-c-io-0.13.18-ab77be6.tar.gz
	https://github.com/awslabs/aws-c-mqtt/tarball/173bbb2155702b8cbb11abee2b767fdafd31fa6c -> aws-c-mqtt-0.8.7-173bbb2.tar.gz
	https://github.com/awslabs/aws-c-s3/tarball/00c7a3c02b2c01edd441ca7ca1411758c7f397fe -> aws-c-s3-0.2.5-00c7a3c.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/tarball/208a701fa01e99c7c8cc3dcebc8317da71362972 -> aws-c-sdkutils-0.1.7-208a701.tar.gz
	https://github.com/awslabs/aws-checksums/tarball/ad53be196a25bbefa3700a01187fdce573a7d2d0 -> aws-checksums-0.1.14-ad53be1.tar.gz
	https://github.com/awslabs/aws-lc/tarball/cfbc38bfbd72cfb1a680d0483381b2e93b9a3e73 -> aws-lc-1.4.0-cfbc38b.tar.gz
	https://github.com/aws/s2n-tls/tarball/0725d3c0bb5bc1383310e19dd94c821a9234d299 -> s2n-tls-1.3.37-0725d3c.tar.gz
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