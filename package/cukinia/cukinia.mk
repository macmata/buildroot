################################################################################
#
# cukinia
#
################################################################################

CUKINIA_VERSION = 1e43172408e57140a5b5d84e8572a8eede1b8471
CUKINIA_SITE = $(call github,savoirfairelinux,cukinia,$(CUKINIA_VERSION))
CUKINIA_LICENSE = Apache-2.0 or GPLv3
CUKINIA_PKGDIR = $(TOPDIR)/package/cukinia

define CUKINIA_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/cukinia \
		$(TARGET_DIR)/usr/bin/cukinia

	$(INSTALL) -D -m 0644 $(CUKINIA_PKGDIR)/cukinia.conf \
		$(TARGET_DIR)/etc/cukinia/cukinia.conf
endef

ifeq ($(BR2_PACKAGE_CUKINIA_BOOT),y)
define CUKINIA_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(CUKINIA_PKGDIR)/SZZcukinia \
		$(TARGET_DIR)/etc/init.d/SZZcukinia
endef
endif

$(eval $(generic-package))
