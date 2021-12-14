# Inherit full common stuff
$(call inherit-product, vendor/scorpion/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/scorpion/overlay/dictionaries
