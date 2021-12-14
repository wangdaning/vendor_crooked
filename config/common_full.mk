# Inherit common stuff
$(call inherit-product, vendor/scorpion/config/common_mobile.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder
