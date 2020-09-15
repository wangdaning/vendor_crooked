PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
SCORPION_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
SCORPION_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# General additions
SCORPION_PRODUCT_PROPERTIES += \
    keyguard.no_require_sim=true \
    dalvik.vm.debug.alloc=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    ro.setupwizard.rotation_locked=true \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.theme_id=5 \
    ro.build.selinux=1

# Allow tethering without provisioning app
SCORPION_PRODUCT_PROPERTIES += \
    net.tethering.noprovisioning=true

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI \
    Launcher3QuickStep

# Init files
PRODUCT_COPY_FILES += \
    vendor/scorpion/prebuilt/common/etc/dirtyunicorns.rc:system/etc/init/dirtyunicorns.rc

# Permissions
PRODUCT_COPY_FILES += \
    vendor/scorpion/prebuilt/common/etc/custom_permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/custom_permissions.xml

# Backup tool
PRODUCT_COPY_FILES += \
    vendor/extras/build/tools/backuptool.sh:install/bin/backuptool.sh \
    vendor/extras/build/tools/backuptool.functions:install/bin/backuptool.functions \
    vendor/extras/build/tools/50-scorpion.sh:system/addon.d/50-scorpion.sh

# Weather client
#PRODUCT_COPY_FILES += \
#    vendor/scorpion/etc/permissions/org.pixelexperience.weather.client.xml:system/etc/permissions/org.pixelexperience.weather.client.xml \
#    vendor/scorpion/etc/default-permissions/org.pixelexperience.weather.client.xml:system/etc/default-permissions/org.pixelexperience.weather.client.xml

# Packages
include vendor/scorpion/config/packages.mk

# Branding
include vendor/scorpion/config/branding.mk

# Themes
#include vendor/themes/common.mk

# Overlays
DEVICE_PACKAGE_OVERLAYS += vendor/scorpion/overlay/common
