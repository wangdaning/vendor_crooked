include vendor/scorpion/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/scorpion/config/BoardConfigQcom.mk
endif

include vendor/scorpion/config/BoardConfigSoong.mk
