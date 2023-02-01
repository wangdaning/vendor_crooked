#
# Copyright (C) 2022-2023 The Crooked Android Project
#
# SPDX-License-Identifier: Apache-2.0
#

CROOKED_DEVICE := $(patsubst %f,%,$(subst crooked_,,$(TARGET_PRODUCT)))

# Set date and time
BUILD_DATE := $(shell date +%Y%m%d)
BUILD_TIME := $(shell date +%H%M)

## Versioning System
# Set all versions
CROOKED_BASE_NAME := CrookedAndroid
CROOKED_BASE_VERSION := 3.0
CROOKED_PLATFORM_VERSION := t

# Set Crooked build types
ifndef CROOKED_BUILD_TYPE
    CROOKED_BUILD_TYPE := freeloader
endif

# Crooked OTA (Recovery): 
ifeq ($(CROOKED_BUILD_TYPE),Grubstaker)
# CrookedAndroid-3.0-Grubstaker-20230119-1051-cheetah.zip
    CROOKED_VERSION := $(CROOKED_BASE_NAME)-$(CROOKED_BASE_VERSION)-$(CROOKED_BUILD_TYPE)-$(BUILD_DATE)-$(BUILD_TIME)-$(CROOKED_DEVICE)
else
# CrookedAndroid-3.0-cheetah.t.freeloader-202301191051.zip
    CROOKED_VERSION := $(CROOKED_BASE_NAME)-$(CROOKED_BASE_VERSION)-$(CROOKED_DEVICE).$(CROOKED_PLATFORM_VERSION).$(CROOKED_BUILD_TYPE)-$(BUILD_DATE)$(BUILD_TIME)
endif

# Crooked Update (Fastboot):
ifeq ($(CROOKED_BUILD_TYPE),Grubstaker)
# CrookedAndroid-3.0-20230119-1051-cheetah-update.zip
    CROOKED_UPDATE_VERSION := $(CROOKED_BASE_NAME)-$(CROOKED_BASE_VERSION)-$(BUILD_DATE)-$(BUILD_TIME)-$(CROOKED_DEVICE)-update
else
# crooked_cheetah_3.0.20230128.1241-update.zip
    CROOKED_UPDATE_VERSION := $(TARGET_PRODUCT)_$(CROOKED_BASE_VERSION).$(BUILD_DATE).$(BUILD_TIME)-update
endif

# Fingerprint
ROM_FINGERPRINT := $(CROOKED_BASE_NAME)/$(PLATFORM_VERSION)/$(CROOKED_BUILD_TYPE)/$(BUILD_DATE)$(BUILD_TIME)
# Declare it's a Crooked build
CROOKED_BUILD := true
