# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="https://github.com/awslabs/aws-crt-python"
SRC_URI="
	https://github.com/awslabs/aws-crt-python/tarball/241be07f82ebd3031a812492443d545676cb2018 -> aws-crt-python-0.36.2-241be07.tar.gz
	https://github.com/awslabs/aws-c-auth/tarball/9300470b602747b47d3fedd39a37350c27459366 -> aws-c-auth-0.10.5-9300470.tar.gz
	https://github.com/awslabs/aws-c-cal/tarball/8aa2a48a09f93c65d4cf06388e143a6584de6321 -> aws-c-cal-0.9.15-8aa2a48.tar.gz
	https://github.com/awslabs/aws-c-common/tarball/f7d471b1feaea9a310851672580f9ac7e031cfc0 -> aws-c-common-0.14.5-f7d471b.tar.gz
	https://github.com/awslabs/aws-c-compression/tarball/281801657a7b69c316e2a52689365bc8256cbb15 -> aws-c-compression-0.3.3-2818016.tar.gz
	https://github.com/awslabs/aws-c-event-stream/tarball/be448067250706b2f2739c7a3b1c0db0e19c5aed -> aws-c-event-stream-0.7.2-be44806.tar.gz
	https://github.com/awslabs/aws-c-http/tarball/bd6f0b0cf0814e87249cc621466800ab1ae2aa5d -> aws-c-http-0.11.1-bd6f0b0.tar.gz
	https://github.com/awslabs/aws-c-io/tarball/ad7d398a1aa5a59a59f3a3b6abc08aa910422896 -> aws-c-io-0.27.7-ad7d398.tar.gz
	https://github.com/awslabs/aws-c-mqtt/tarball/95739b3f34830e9e32a392b783994df5279387d9 -> aws-c-mqtt-0.16.2-95739b3.tar.gz
	https://github.com/awslabs/aws-c-s3/tarball/72e355a0a51fb82ba33a1f64bc9090b0a1d76dd7 -> aws-c-s3-0.13.6-72e355a.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/tarball/bb4c0918b84a1a5e0ecfafb960711024cfee916f -> aws-c-sdkutils-0.2.10-bb4c091.tar.gz
	https://github.com/awslabs/aws-checksums/tarball/32fed6fc25a90146bd0ac7e5c639e3778b78fdf1 -> aws-checksums-0.2.11-32fed6f.tar.gz
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