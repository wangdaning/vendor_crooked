#
# Copyright (C) 2022 The Crooked Android Project
#
# SPDX-License-Identifier: Apache-2.0
#

include vendor/crooked/build/core/vendor/*.mk

# Apex
$(call inherit-product-if-exists, vendor/partner_modules/build/mainline_modules.mk)

# Conditionally call QCOM makefiles
ifeq ($(PRODUCT_USES_QCOM_HARDWARE), true)
include vendor/crooked/build/core/ProductConfigQcom.mk
endif

$(call inherit-product, vendor/qcom/opensource/power/power-vendor-board.mk)

# Define some properties for GMS
ifneq ($(TARGET_DOES_NOT_USE_GAPPS), true)
$(call inherit-product-if-exists, vendor/gms/products/gms.mk)
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true \
    dalvik.vm.debug.alloc=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.sys.disable_rescue=true \
    ro.build.selinux=1

# Conditionally enable blur
ifeq ($(TARGET_USES_BLUR), true)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.sf.blurs_are_expensive=1 \
    ro.surface_flinger.supports_background_blur=1
endif

# Make some features conditional
ifeq ($(ENABLE_GAMETOOLS), true)
PRODUCT_COPY_FILES += \
    vendor/crooked/prebuilt/etc/sysconfig/game_service.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/game_service.xml
endif
ifneq ($(DISABLE_COLUMBUS), true)
PRODUCT_COPY_FILES += \
    vendor/crooked/prebuilt/etc/sysconfig/quick_tap.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/quick_tap.xml
endif

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

# Copy over some Crooked assets
PRODUCT_COPY_FILES += \
    vendor/crooked/prebuilt/etc/init.crooked.rc:system/etc/init/init.crooked.rc \
    vendor/crooked/prebuilt/etc/permissions/privapp-permissions-crooked-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-crooked-product.xml \
    vendor/crooked/prebuilt/etc/permissions/privapp-permissions-crooked-se.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-crooked-se.xml

# Build ID
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_DISPLAY_ID="$(BUILD_ID)-$(TARGET_BUILD_VARIANT)"

# Packages
include vendor/crooked/config/packages.mk

# Branding
include vendor/crooked/config/branding.mk

# Bootanimation
include vendor/crooked/config/bootanimation.mk

# Fonts
include vendor/crooked/config/fonts.mk

# Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/crooked/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/crooked/overlay/common

# Artifact path requirements
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/etc/init/init.crooked.rc \
    system/lib/libRSSupport.so \
    system/lib/libblasV8.so \
    system/lib/librsjni.so \
    system/lib64/libRSSupport.so \
    system/lib64/libblasV8.so \
    system/lib64/librsjni.so

# Pixel Framework
# $(call inherit-product, vendor/pixel-framework/config.mk)
