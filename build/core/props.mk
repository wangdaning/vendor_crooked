# Only use stock build fingerprint for Google Play Services
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.stock_fingerprint=$(BUILD_FINGERPRINT)

ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.crooked.version=$(CROOKED_BASE_VERSION)-$(CROOKED_BUILD_TYPE)-$(BUILD_DATE)-$(BUILD_TIME) \
    ro.crooked.base.version=$(CROOKED_BASE_VERSION) \
    ro.mod.version=$(BUILD_ID)-$(BUILD_DATE)-$(CROOKED_BASE_VERSION) \
    ro.crooked.fingerprint=$(ROM_FINGERPRINT) \
    ro.crooked.buildtype=$(CROOKED_BUILD_TYPE) \
    ro.crooked.device=$(TARGET_DEVICE)
