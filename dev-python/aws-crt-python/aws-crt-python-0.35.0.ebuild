# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3+ )
inherit distutils-r1

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="https://github.com/awslabs/aws-crt-python"
SRC_URI="
	https://github.com/awslabs/aws-crt-python/tarball/c8c605c8f988470f5ac4dafd34ded2cdd153d85d -> aws-crt-python-0.35.0-c8c605c.tar.gz
	https://github.com/awslabs/aws-c-auth/tarball/4cb7127fc2fe402310f9b2ccd7719baa348b2a19 -> aws-c-auth-0.10.3-4cb7127.tar.gz
	https://github.com/awslabs/aws-c-cal/tarball/9edd8eac2b21ca6a04535b91d60d361c2f1bb60f -> aws-c-cal-0.9.14-9edd8ea.tar.gz
	https://github.com/awslabs/aws-c-common/tarball/2b4c620fecec43fb847da3d2064ce023ebfd3ef9 -> aws-c-common-0.14.1-2b4c620.tar.gz
	https://github.com/awslabs/aws-c-compression/tarball/d8264e64f698341eb03039b96b4f44702a9b3f83 -> aws-c-compression-0.3.2-d8264e6.tar.gz
	https://github.com/awslabs/aws-c-event-stream/tarball/51bef3c44e1058b1689751539170b2e0f589ccdb -> aws-c-event-stream-0.7.1-51bef3c.tar.gz
	https://github.com/awslabs/aws-c-http/tarball/8aefd899fc3210bfd0e3fd414011a3cb708bf6e4 -> aws-c-http-0.11.0-8aefd89.tar.gz
	https://github.com/awslabs/aws-c-io/tarball/9156a8f7970d615cbb689900f7adef70f2366c88 -> aws-c-io-0.27.2-9156a8f.tar.gz
	https://github.com/awslabs/aws-c-mqtt/tarball/2ef9605ec9c50bea3f921e08022ddd57eed70901 -> aws-c-mqtt-0.16.0-2ef9605.tar.gz
	https://github.com/awslabs/aws-c-s3/tarball/9bcccf21bbbef08fda20efacb50b8a180e63f0ac -> aws-c-s3-0.12.7-9bcccf2.tar.gz
	https://github.com/awslabs/aws-c-sdkutils/tarball/727df06fc0e998e673de70fb69e5a634fe4979bc -> aws-c-sdkutils-0.2.6-727df06.tar.gz
	https://github.com/awslabs/aws-checksums/tarball/1d5f2f1f3e5d013aae8810878ceb5b3f6f258c4e -> aws-checksums-0.2.10-1d5f2f1.tar.gz
	https://github.com/awslabs/aws-lc/tarball/6f246af4cd1de8cee8c62d76139bcda299c1aa00 -> aws-lc-5.0.0-6f246af.tar.gz
	https://github.com/aws/s2n-tls/tarball/f5f6c6c2ce2370de1aa3ade6899a7321d1127bb8 -> s2n-tls-1.7.5-f5f6c6c.tar.gz
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