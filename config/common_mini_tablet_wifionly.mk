# Inherit mini common stuff
$(call inherit-product, vendor/scorpion/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME
