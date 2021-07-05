################################################################################
#
# trojan
#
################################################################################

TROJAN_VERSION = 3e7bb9aecdc694f9bcae8d646fae395f773d60f8
TROJAN_SITE = $(call github,trojan-gfw,trojan,$(TROJAN_VERSION))
# libopenssl requires zlib
TROJAN_DEPENDENCIES = zlib
#TROJAN_INSTALL_STAGING = YES
TROJAN_CONF_OPTS = -DENABLE_MYSQL=OFF \
	-DENABLE_NAT=ON \
	-DENABLE_REUSE_PORT=ON \
	-DENABLE_SSL_KEYLOG=ON \
	-DENABLE_TLS13_CIPHERSUITES=ON \
	-DFORCE_TCP_FASTOPEN=OFF \
	-DSYSTEMD_SERVICE=OFF \
	-DOPENSSL_USE_STATIC_LIBS=TRUE \
	-DBoost_DEBUG=ON \
	-DBoost_NO_BOOST_CMAKE=ON



#define TROJAN_POST_TARGET_CLEANUP
#	rm -Rf $(TARGET_DIR)/usr/src
#endef
#TROJAN_POST_INSTALL_TARGET_HOOKS += TROJAN_POST_TARGET_CLEANUP

$(eval $(cmake-package))
