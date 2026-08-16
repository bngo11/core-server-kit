# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="https://github.com/awslabs/aws-crt-python"
SRC_URI="
	https://github.com/awslabs/aws-crt-python/tarball/241be07f82ebd3031a812492443d545676cb2018 -> aws-crt-python-0.36.2-241be07.tar.gz
	https://github.com/awslabs/aws-c-auth/tarball/4b5d524bf1a511b05e0fffe5bdc51800770b9427 -> aws-c-auth-0.10.4-4b5d524.tar.gz
	https://github.com/awslabs/aws-c-cal/tarball/8aa2a48a09f93c65d4cf06388e143a6584de6321 -> aws-c-cal-0.9.15-8aa2a48.tar.gz
	https://github.com/awslabs/aws-c-common/tarball/f7d471b1feaea9a310851672580f9ac7e031cfc0 -> aws-c-common-0.14.5-f7d471b.tar.gz
	https://github.com/awslabs/aws-c-compression/tarball/d8264e64f698341eb03039b96b4f44702a9b3f83 -> aws-c-compression-0.3.2-d8264e6.tar.gz
	https://github.com/awslabs/aws-c-event-stream/tarball/51bef3c44e1058b1689751539170b2e0f589ccdb -> aws-c-event-stream-0.7.1-51bef3c.tar.gz
	https://github.com/awslabs/aws-c-http/tarball/8aefd899fc3210bfd0e3fd414011a3cb708bf6e4 -> aws-c-http-0.11.0-8aefd89.tar.gz
	https://github.com/awslabs/aws-c-io/tarball/28e4eb351a536daf1627bf69279e50671f7729b5 -> aws-c-io-0.27.6-28e4eb3.tar.gz
	https://github.com/awslabs/aws-c-mqtt/tarball/e35b9ca3f9fcbf1a972c831c5e79046ce56959d1 -> aws-c-mqtt-0.16.1-e35b9ca.tar.gz
	https://github.com/awslabs/aws-c-s3/tarball/226c3e6937e3d5f7db9e10651f7bd20575e98187 -> aws-c-s3-0.13.5-226c3e6.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/tarball/a1cc19f53b63658f1b1400b36f199eafeeb895a6 -> aws-c-sdkutils-0.2.9-a1cc19f.tar.gz
	https://github.com/awslabs/aws-checksums/tarball/1d5f2f1f3e5d013aae8810878ceb5b3f6f258c4e -> aws-checksums-0.2.10-1d5f2f1.tar.gz
	https://github.com/awslabs/aws-lc/tarball/991e67ff4cf04df4dd89e407f8b920c6936cb56a -> aws-lc-5.5.0-991e67f.tar.gz
	https://github.com/aws/s2n-tls/tarball/853d1943bbbd7f782a159e77830cdaaf520d68ed -> s2n-tls-1.7.7-853d194.tar.gz
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