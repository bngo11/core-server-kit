# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="https://github.com/awslabs/aws-crt-python"
SRC_URI="
	https://github.com/awslabs/aws-crt-python/tarball/462596483dc088a66750d95258cddd62ff1d9091 -> aws-crt-python-0.16.21-4625964.tar.gz
	https://github.com/awslabs/aws-c-auth/tarball/c076002aa2bc051e81dec988aaa3e88895b242dd -> aws-c-auth-0.7.0-c076002.tar.gz
	https://github.com/awslabs/aws-c-cal/tarball/de43d69dbda4e2a048620c28767174483397f72f -> aws-c-cal-0.6.0-de43d69.tar.gz
	https://github.com/awslabs/aws-c-common/tarball/9f36d07189435db27f746c10e39ba58511fadd0d -> aws-c-common-0.8.23-9f36d07.tar.gz
	https://github.com/awslabs/aws-c-compression/tarball/99ec79ee2970f1a045d4ced1501b97ee521f2f85 -> aws-c-compression-0.2.17-99ec79e.tar.gz
	https://github.com/awslabs/aws-c-event-stream/tarball/ec1716c726babd1381560aa8d28941fffc987394 -> aws-c-event-stream-0.3.1-ec1716c.tar.gz
	https://github.com/awslabs/aws-c-http/tarball/27efc273f228306031c7345de8acaeee956db765 -> aws-c-http-0.7.10-27efc27.tar.gz
	https://github.com/awslabs/aws-c-io/tarball/1f9a085027c5e0f3e0c0e2a9fbe685f12af8105d -> aws-c-io-0.13.27-1f9a085.tar.gz
	https://github.com/awslabs/aws-c-mqtt/tarball/8e40355e03b456bb7b4bf0cd37c5d878afa2476f -> aws-c-mqtt-0.8.13-8e40355.tar.gz
	https://github.com/awslabs/aws-c-s3/tarball/61c5282da191ccdb7f6460800c7bfc4d013ca8b4 -> aws-c-s3-0.3.12-61c5282.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/tarball/df511a1f2518279eb5721ab5fca6bc816efc6b32 -> aws-c-sdkutils-0.1.11-df511a1.tar.gz
	https://github.com/awslabs/aws-checksums/tarball/a5b0e7f00be4240f77d3b6e090c8bed3c9c2e536 -> aws-checksums-0.1.16-a5b0e7f.tar.gz
	https://github.com/awslabs/aws-lc/tarball/80c394324382c78d2cbd783babaad1f612c1642d -> aws-lc-1.11.0-80c3943.tar.gz
	https://github.com/aws/s2n-tls/tarball/e954ee5dc878c5c343d35574e7d07246a1e59314 -> s2n-tls-1.3.46-e954ee5.tar.gz
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