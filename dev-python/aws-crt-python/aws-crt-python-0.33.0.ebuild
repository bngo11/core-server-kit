# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="https://github.com/awslabs/aws-crt-python"
SRC_URI="
	https://github.com/awslabs/aws-crt-python/tarball/74f88049cd779becbc93bbd5cd32b709d0a40420 -> aws-crt-python-0.33.0-74f8804.tar.gz
	https://github.com/awslabs/aws-c-auth/tarball/4cb7127fc2fe402310f9b2ccd7719baa348b2a19 -> aws-c-auth-0.10.3-4cb7127.tar.gz
	https://github.com/awslabs/aws-c-cal/tarball/9edd8eac2b21ca6a04535b91d60d361c2f1bb60f -> aws-c-cal-0.9.14-9edd8ea.tar.gz
	https://github.com/awslabs/aws-c-common/tarball/d3b926fd87e6c37887ae12bb2253550334e7445a -> aws-c-common-0.13.1-d3b926f.tar.gz
	https://github.com/awslabs/aws-c-compression/tarball/d8264e64f698341eb03039b96b4f44702a9b3f83 -> aws-c-compression-0.3.2-d8264e6.tar.gz
	https://github.com/awslabs/aws-c-event-stream/tarball/51bef3c44e1058b1689751539170b2e0f589ccdb -> aws-c-event-stream-0.7.1-51bef3c.tar.gz
	https://github.com/awslabs/aws-c-http/tarball/8aefd899fc3210bfd0e3fd414011a3cb708bf6e4 -> aws-c-http-0.11.0-8aefd89.tar.gz
	https://github.com/awslabs/aws-c-io/tarball/1ec8081f208ef8d51381889eda3bda9756fd5bb5 -> aws-c-io-0.26.3-1ec8081.tar.gz
	https://github.com/awslabs/aws-c-mqtt/tarball/2ef9605ec9c50bea3f921e08022ddd57eed70901 -> aws-c-mqtt-0.16.0-2ef9605.tar.gz
	https://github.com/awslabs/aws-c-s3/tarball/f1a52b5e960c06bd9392cb5e982c6fe04f1ce253 -> aws-c-s3-0.12.4-f1a52b5.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/tarball/f678bda9e21f7217e4bbf35e0d1ea59540687933 -> aws-c-sdkutils-0.2.4-f678bda.tar.gz
	https://github.com/awslabs/aws-checksums/tarball/1d5f2f1f3e5d013aae8810878ceb5b3f6f258c4e -> aws-checksums-0.2.10-1d5f2f1.tar.gz
	https://github.com/awslabs/aws-lc/tarball/44766fa7daa88e5afc7fc6de3311c48eeeb02f39 -> aws-lc-1.73.0-44766fa.tar.gz
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