# Versioning System
SCORPION_BASE_VERSION = v2.1

ifndef SCORPION_BUILD_TYPE
    SCORPION_BUILD_TYPE := UNOFFICIAL
endif

# Only include Scorpion-Updater for official, weeklies, and rc builds
#ifeq ($(filter-out OFFICIAL WEEKLIES RC,$(SCORPION_BUILD_TYPE)),)
#    PRODUCT_PACKAGES += \
#        Scorpion-Updater
#endif

# Sign builds if building an official or weekly build
ifeq ($(filter-out OFFICIAL WEEKLIES,$(SCORPION_BUILD_TYPE)),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := ../.keys/releasekey
endif

# Set all versions
DATE := $(shell date -u +%Y%m%d)
TIME := $(shell date -u +%H%M)
SCORPION_VERSION := $(TARGET_PRODUCT)-$(SCORPION_BASE_VERSION)-$(DATE)-$(TIME)-$(SCORPION_BUILD_TYPE)
TARGET_BACON_NAME := $(SCORPION_VERSION)
ROM_FINGERPRINT := Scorpion/$(PLATFORM_VERSION)/$(SCORPION_BUILD_TYPE)/$(DATE)$(TIME)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.scorpion.version=$(SCORPION_VERSION) \
    ro.mod.version=$(SCORPION_BUILD_TYPE)-$(SCORPION_BASE_VERSION)-$(DATE) \
    ro.scorpion.fingerprint=$(ROM_FINGERPRINT)
