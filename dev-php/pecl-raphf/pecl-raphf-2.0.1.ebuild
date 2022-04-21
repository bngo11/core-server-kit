# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PHP_EXT_NAME="raphf"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
PHP_EXT_ECONF_ARGS=""
PHP_INI_NAME="30-${PHP_EXT_NAME}"

USE_PHP="php7-3 php7-4 php8-0 php8-1"

inherit php-ext-pecl-r3

KEYWORDS="*"

DESCRIPTION="A reusable, persistent handle and resource factory API"
LICENSE="BSD-2"
SLOT="7"
IUSE=""