# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="https://github.com/awslabs/aws-crt-python"
SRC_URI="
	https://github.com/awslabs/aws-crt-python/tarball/d0ac2a91e041736ec07dc2a0e8ba372eaccabfdd -> aws-crt-python-0.32.0-d0ac2a9.tar.gz
	https://github.com/awslabs/aws-c-auth/tarball/fc4b87655e5cd3921f18d1859193c74af4102071 -> aws-c-auth-0.10.1-fc4b876.tar.gz
	https://github.com/awslabs/aws-c-cal/tarball/1cb9412158890201a6ffceed779f90fe1f48180c -> aws-c-cal-0.9.13-1cb9412.tar.gz
	https://github.com/awslabs/aws-c-common/tarball/95515a8b1ff40d5bb14f965ca4cbbe99ad1843df -> aws-c-common-0.12.6-95515a8.tar.gz
	https://github.com/awslabs/aws-c-compression/tarball/d8264e64f698341eb03039b96b4f44702a9b3f83 -> aws-c-compression-0.3.2-d8264e6.tar.gz
	https://github.com/awslabs/aws-c-event-stream/tarball/66cafb1d8bb1bfeb62a7601ce03d1a6fcd4798ed -> aws-c-event-stream-0.7.0-66cafb1.tar.gz
	https://github.com/awslabs/aws-c-http/tarball/da535b1bf9c9334730eb78a26a1bbb3c069b38c9 -> aws-c-http-0.10.14-da535b1.tar.gz
	https://github.com/awslabs/aws-c-io/tarball/1ec8081f208ef8d51381889eda3bda9756fd5bb5 -> aws-c-io-0.26.3-1ec8081.tar.gz
	https://github.com/awslabs/aws-c-mqtt/tarball/3c2ceee52b66db42228053a4fb55210c8f8433a0 -> aws-c-mqtt-0.15.2-3c2ceee.tar.gz
	https://github.com/awslabs/aws-c-s3/tarball/ab764f57ec3cab7866c0f8b7d9e9772b7cc1b9ee -> aws-c-s3-0.12.2-ab764f5.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/tarball/f678bda9e21f7217e4bbf35e0d1ea59540687933 -> aws-c-sdkutils-0.2.4-f678bda.tar.gz
	https://github.com/awslabs/aws-checksums/tarball/1d5f2f1f3e5d013aae8810878ceb5b3f6f258c4e -> aws-checksums-0.2.10-1d5f2f1.tar.gz
	https://github.com/awslabs/aws-lc/tarball/47389586f8aa77c83245173793f4d44ed1d6c3a8 -> aws-lc-1.71.0-4738958.tar.gz
	https://github.com/aws/s2n-tls/tarball/a71ea1f9764ee9ae91b47c34faa0447c4fe11d0a -> s2n-tls-1.7.2-a71ea1f.tar.gz
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