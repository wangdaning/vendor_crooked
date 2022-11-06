# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
# Copyright (C) 2022 The Crooked Android Project
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
# Crooked Android image update package

#
# Build system colors
#
ifneq ($(BUILD_WITH_COLORS),0)
    include $(TOP_DIR)vendor/crooked/build/core/colors.mk
endif

CROOKED_UPDATE_TARGET_PACKAGE := $(PRODUCT_OUT)/$(CROOKED_UPDATE_VERSION).zip

.PHONY: eggs
eggs: $(INTERNAL_UPDATE_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_UPDATE_PACKAGE_TARGET) $(CROOKED_UPDATE_TARGET_PACKAGE)
	@echo -e ${CL_GRN}"Success:" >&2

	@echo -e ${CL_CYN}""
	@echo -e ${CL_CYN}"   ______                 __            __"
	@echo -e ${CL_CYN}"  / ____/________  ____  / /_____  ____/ /"
	@echo -e ${CL_CYN}" / /   / ___/ __ \/ __ \/ //_/ _ \/ __  / "
	@echo -e ${CL_CYN}"/ /___/ /  / /_/ / /_/ / ,< /  __/ /_/ /  "
	@echo -e ${CL_CYN}"\______/   \____/\______/|_|\___/\__,_/ __"
	@echo -e ${CL_CYN}"   /   |  ____  ____/ /________  (_)___/ /"
	@echo -e ${CL_CYN}"  / /| | / __ \/ __  / ___/ __ \/ / __  / "
	@echo -e ${CL_CYN}" / ___ |/ / / / /_/ / /  / /_/ / / /_/ /  "
	@echo -e ${CL_CYN}"/_/  |_/_/ /_/\__,_/_/   \____/_/\__,_/   "
	@echo -e ${CL_CYN}" "
	@echo -e ${CL_YLW}"Device Name: $(TARGET_DEVICE)"
	@echo -e ${CL_GRN}"========================================================================="
	@echo "Package Name: $(CROOKED_UPDATE_VERSION).zip" >&2
	@echo "Package Size: `du -h $(CROOKED_UPDATE_TARGET_PACKAGE) | cut -f 1`"
	@echo -e ${CL_GRN}"========================================================================="
	@echo -e ${CL_RED}"Lets Get Crooked!"
