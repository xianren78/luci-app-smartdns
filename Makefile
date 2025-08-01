# 
# Copyright 2018-2025 Nick Peng <pymumu@gmail.com>
# Licensed to the public under the GPL V3 License.

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-smartdns
PKG_VERSION:=1.2025.47.2
PKG_RELEASE:=2

PKG_LICENSE:=GPL-3.0-or-later
PKG_MAINTAINER:=Nick Peng <pymumu@gmail.com>

LUCI_TITLE:=LuCI for smartdns
LUCI_DESCRIPTION:=Provides Luci for smartdns
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+luci-base +smartdns \
	+PACKAGE_$(PKG_NAME)_INCLUDE_smartdns_ui:smartdns-ui

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)/config
# shown in make menuconfig <Help>
help
	$(LUCI_TITLE)
	Version: $(PKG_VERSION)-$(PKG_RELEASE)

config PACKAGE_$(PKG_NAME)_INCLUDE_smartdns_ui
	bool "Include smartdns-ui"
	default y
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
