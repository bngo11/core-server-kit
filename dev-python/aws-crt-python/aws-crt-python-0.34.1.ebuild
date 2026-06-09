# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="https://github.com/awslabs/aws-crt-python"
SRC_URI="
	https://github.com/awslabs/aws-crt-python/tarball/f78d829f8cd5d2ccff7cd2498a1b16d38cefcc95 -> aws-crt-python-0.34.1-f78d829.tar.gz
	https://github.com/awslabs/aws-c-auth/tarball/4cb7127fc2fe402310f9b2ccd7719baa348b2a19 -> aws-c-auth-0.10.3-4cb7127.tar.gz
	https://github.com/awslabs/aws-c-cal/tarball/9edd8eac2b21ca6a04535b91d60d361c2f1bb60f -> aws-c-cal-0.9.14-9edd8ea.tar.gz
	https://github.com/awslabs/aws-c-common/tarball/48dd6cdff7bac0005a9c6b49c15a0765622c0e70 -> aws-c-common-0.14.0-48dd6cd.tar.gz
	https://github.com/awslabs/aws-c-compression/tarball/d8264e64f698341eb03039b96b4f44702a9b3f83 -> aws-c-compression-0.3.2-d8264e6.tar.gz
	https://github.com/awslabs/aws-c-event-stream/tarball/51bef3c44e1058b1689751539170b2e0f589ccdb -> aws-c-event-stream-0.7.1-51bef3c.tar.gz
	https://github.com/awslabs/aws-c-http/tarball/8aefd899fc3210bfd0e3fd414011a3cb708bf6e4 -> aws-c-http-0.11.0-8aefd89.tar.gz
	https://github.com/awslabs/aws-c-io/tarball/bdfd85e293965439146bc30a70379e7889c27bb7 -> aws-c-io-0.27.0-bdfd85e.tar.gz
	https://github.com/awslabs/aws-c-mqtt/tarball/2ef9605ec9c50bea3f921e08022ddd57eed70901 -> aws-c-mqtt-0.16.0-2ef9605.tar.gz
	https://github.com/awslabs/aws-c-s3/tarball/dd71b3be7d2545d1470cd20464742fef297d50d3 -> aws-c-s3-0.12.5-dd71b3b.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/tarball/f678bda9e21f7217e4bbf35e0d1ea59540687933 -> aws-c-sdkutils-0.2.4-f678bda.tar.gz
	https://github.com/awslabs/aws-checksums/tarball/1d5f2f1f3e5d013aae8810878ceb5b3f6f258c4e -> aws-checksums-0.2.10-1d5f2f1.tar.gz
	https://github.com/awslabs/aws-lc/tarball/6f246af4cd1de8cee8c62d76139bcda299c1aa00 -> aws-lc-5.0.0-6f246af.tar.gz
	https://github.com/aws/s2n-tls/tarball/211695cb91f5b74b64a81ebb3045ec3d7d5ab264 -> s2n-tls-1.7.3-211695c.tar.gz
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