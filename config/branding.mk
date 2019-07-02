# Versioning System
SCORPION_BASE_VERSION = v2.7

# Set all versions
DATE := $(shell date +%Y%m%d)
TIME := $(shell date +%H%M)
SCORPION_VERSION := Scorpion-$(SCORPION_BASE_VERSION)-$(SCORPION_BUILD)-$(DATE)-$(TIME)
TARGET_BACON_NAME := $(SCORPION_VERSION)
ROM_FINGERPRINT := Scorpion/$(PLATFORM_VERSION)/$(SCORPION_BUILD_TYPE)/$(DATE)$(TIME)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.scorpion.version=$(SCORPION_VERSION) \
    ro.mod.version=$(SCORPION_BUILD_TYPE)-$(SCORPION_BASE_VERSION)-$(DATE) \
    ro.scorpion.fingerprint=$(ROM_FINGERPRINT)
