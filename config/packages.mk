#
# Copyright (C) 2022 The Crooked Android Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni

# Crooked Packages
PRODUCT_PACKAGES += \
    CustomDoze \
    RepainterServicePriv \
    SimpleDeviceConfig \
    CrookedWalls \
    QuickAccessWallet \
    SettingsIntelligenceGooglePrebuilt

# App overrides
#$(call inherit-product, vendor/rkicons/product.mk)
PRODUCT_PACKAGES += \
    StatixThemePicker \
    StatixSystemUI \
    StatixSettings

# Preopt StatixSystemUI
PRODUCT_DEXPREOPT_SPEED_APPS += \
    StatixSystemUI \
    NexusLaucherRelease

# Google Camera GO
PRODUCT_PACKAGES += \
    GoogleCameraGo

# Google Pixel Launcher
ifeq ($(INCLUDE_PIXEL_LAUNCHER),true)
PRODUCT_PACKAGES += \
    PixelLauncher
endif

# Updaters
ifeq ($(CROOKED_BUILD_TYPE),OFFICIAL)
PRODUCT_PACKAGES += \
    Updater
endif

# Some useful shell based utilities for Android
PRODUCT_PACKAGES += \
    htop \
    nano \
    vim

# Charger images
PRODUCT_PACKAGES += \
    charger_res_images

#$(call inherit-product, vendor/bromite/bromite.mk)
-include vendor/crooked/config/overlay.mk
