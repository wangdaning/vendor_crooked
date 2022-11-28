#
# Copyright (C) 2018-2022 The Crooked Android Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Set date and time
BUILD_DATE := $(shell date +%Y%m%d)
BUILD_TIME := $(shell date +%H%M)

## Versioning System
# Set all versions
CROOKED_BASE_VERSION := v2.2
CROOKED_PLATFORM_VERSION := T

# Use signing keys and don't print date & time in the final zip for official builds
ifndef CROOKED_BUILD_TYPE
    CROOKED_BUILD_TYPE := UNOFFICIAL
endif

ifeq ($(CROOKED_BUILD_TYPE),OFFICIAL)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := ./.keys/releasekey
    CROOKED_VERSION := $(TARGET_PRODUCT)-$(CROOKED_BASE_VERSION)-$(BUILD_DATE)-$(CROOKED_PLATFORM_VERSION)-$(CROOKED_BUILD_TYPE)
else
    CROOKED_VERSION := $(TARGET_PRODUCT)-$(CROOKED_BASE_VERSION)-$(BUILD_DATE)-$(BUILD_TIME)-$(CROOKED_PLATFORM_VERSION)-$(CROOKED_BUILD_TYPE)
endif

# Crooked Update Version, for update packages
CROOKED_UPDATE_VERSION := $(TARGET_PRODUCT)-$(CROOKED_BASE_VERSION)-$(BUILD_DATE)-$(BUILD_TIME)-update

# Fingerprint
ROM_FINGERPRINT := CrookedAndroid/$(PLATFORM_VERSION)/$(CROOKED_BUILD_TYPE)/$(BUILD_DATE)$(BUILD_TIME)
# Declare it's a Crooked build
CROOKED_BUILD := true
