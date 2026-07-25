# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="https://github.com/awslabs/aws-crt-python"
SRC_URI="
	https://github.com/awslabs/aws-crt-python/tarball/bf57332e2a38e8a8477ea1fe2f1c47e4f98e5875 -> aws-crt-python-0.36.1-bf57332.tar.gz
	https://github.com/awslabs/aws-c-auth/tarball/4b5d524bf1a511b05e0fffe5bdc51800770b9427 -> aws-c-auth-0.10.4-4b5d524.tar.gz
	https://github.com/awslabs/aws-c-cal/tarball/8aa2a48a09f93c65d4cf06388e143a6584de6321 -> aws-c-cal-0.9.15-8aa2a48.tar.gz
	https://github.com/awslabs/aws-c-common/tarball/3c69b871dfa1815231802febf1bb6899f84cccdb -> aws-c-common-0.14.3-3c69b87.tar.gz
	https://github.com/awslabs/aws-c-compression/tarball/d8264e64f698341eb03039b96b4f44702a9b3f83 -> aws-c-compression-0.3.2-d8264e6.tar.gz
	https://github.com/awslabs/aws-c-event-stream/tarball/51bef3c44e1058b1689751539170b2e0f589ccdb -> aws-c-event-stream-0.7.1-51bef3c.tar.gz
	https://github.com/awslabs/aws-c-http/tarball/8aefd899fc3210bfd0e3fd414011a3cb708bf6e4 -> aws-c-http-0.11.0-8aefd89.tar.gz
	https://github.com/awslabs/aws-c-io/tarball/e2946c99521fa12d285c9a0829c92b1bf713922b -> aws-c-io-0.27.5-e2946c9.tar.gz
	https://github.com/awslabs/aws-c-mqtt/tarball/2ef9605ec9c50bea3f921e08022ddd57eed70901 -> aws-c-mqtt-0.16.0-2ef9605.tar.gz
	https://github.com/awslabs/aws-c-s3/tarball/a852faa2df3ab2b31fb4cfd64fd3379a2f4ae22e -> aws-c-s3-0.13.2-a852faa.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/tarball/cb14fea362c82c995eebd34e2e96590ab4e0ed58 -> aws-c-sdkutils-0.2.7-cb14fea.tar.gz
	https://github.com/awslabs/aws-checksums/tarball/1d5f2f1f3e5d013aae8810878ceb5b3f6f258c4e -> aws-checksums-0.2.10-1d5f2f1.tar.gz
	https://github.com/awslabs/aws-lc/tarball/f6acf748df0ea6157d55e640730b38d21a7751cd -> aws-lc-5.4.0-f6acf74.tar.gz
	https://github.com/aws/s2n-tls/tarball/66b1c94d1dfc99b237427cbde230eca63bb8b89c -> s2n-tls-1.7.6-66b1c94.tar.gz
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