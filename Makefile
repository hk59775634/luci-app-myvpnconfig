include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-myvpnconfig
PKG_VERSION=1
PKG_RELEASE:=36

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
    SECTION:=luci
    CATEGORY:=LuCI
    SUBMENU:=3. Applications
    TITLE:=myvpnconfig for LuCI
    PKGARCH:=all
    DEPENDS:= 
endef

define Package/$(PKG_NAME)/description
    This package contains LuCI configuration pages for myvpnconfig.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
    $(CP) ./files/* $(1)/
endef

define Package/$(PKG_NAME)/postinst
	/etc/init.d/myvpn stop
    /etc/init.d/myvpn start
    rm -f /tmp/luci-indexcache  >/dev/null 2>&1
endef

define Package/$(PKG_NAME)/postrm
	/etc/init.d/myvpn stop
    rm -f /tmp/luci-indexcache  >/dev/null 2>&1
endef

$(eval $(call BuildPackage,$(PKG_NAME)))