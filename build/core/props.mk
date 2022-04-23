# Only use stock build fingerprint for Google Play Services
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.stock_fingerprint=$(BUILD_FINGERPRINT)

ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.statix.version=$(STATIX_BASE_VERSION)-$(STATIX_BUILD_TYPE)-$(BUILD_DATE)-$(BUILD_TIME) \
    ro.statix.base.version=$(STATIX_BASE_VERSION) \
    ro.mod.version=$(BUILD_ID)-$(BUILD_DATE)-$(STATIX_BASE_VERSION) \
    ro.statix.fingerprint=$(ROM_FINGERPRINT) \
    ro.statix.buildtype=$(STATIX_BUILD_TYPE) \
    ro.statix.device=$(TARGET_DEVICE)
