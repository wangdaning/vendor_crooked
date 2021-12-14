# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# Scorpion OTA update package

#
# Build system colors
#
# PFX: Prefix "target C++:" in yellow
# INS: Module "Install:" output color (cyan for ics)
ifneq ($(BUILD_WITH_COLORS),0)
    include $(TOP_DIR)vendor/scorpion/build/core/colors.mk
endif

SCORPION_TARGET_PACKAGE := $(PRODUCT_OUT)/scorpion-$(SCORPION_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(SCORPION_TARGET_PACKAGE)
	$(hide) $(SHA256) $(SCORPION_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(SCORPION_TARGET_PACKAGE).sha256sum
	@echo "Package Complete:" >&2

	@echo -e ${CL_RED}""${CL_RED}
	@echo -e ${CL_RED}"  ________                         .__                "${CL_RED}
	@echo -e ${CL_RED}" /   ____/ ____  _________________ |__| ____   ____   "${CL_RED}
	@echo -e ${CL_RED}" \____  \_/ ___\/  _ \_  __ \____ \|  |/  _ \ /    \  "${CL_RED}
	@echo -e ${CL_RED}" /       \  \__(  <_> )  | \/  |_> >  (  <_> )   |  \ "${CL_RED}
	@echo -e ${CL_RED}"/______  /\___  >____/|__|  |   __/|__|\____/|___|  / "${CL_RED}
	@echo -e ${CL_RED}"       \/     \/            |__|                  \/  "${CL_RED}
	@echo -e "\033[92mDevice Name: $(TARGET_DEVICE)"
	@echo -e ${CL_RED}"========================================================================================"${CL_RED}
	@echo -e "\033[92mPackage Complete: scorpion-$(SCORPION_VERSION)"
	@echo -e ${CL_RED}"========================================================================================"${CL_RED}
	@echo -e "\033[92mFeel The Sting when you \033[5mFlash\033[0m \033[92mthat Thing!"
