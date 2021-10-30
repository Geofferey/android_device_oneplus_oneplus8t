# Copyright (C) 2010 The Android Open Source Project
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

#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#
DEVICE_PATH := device/oneplus/oneplus8t

# Must set before build or no Magisk
ifeq ($(BOARD_MAGISK_INIT),true)
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk
endif

BOARD_PREBUILT_VENDORIMAGE := vendor/image/oneplus/oneplus8t/vendor.img
BOARD_PREBUILT_ODMIMAGE := vendor/image/oneplus/oneplus8t/odm.img
BOARD_PREBUILT_RECOVERYIMAGE := vendor/image/oneplus/oneplus8t/recovery.img
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

OMNI_PRODUCT_PROPERTIES += \
    ro.sf.lcd_density=420

ifneq ($(filter $(ROM_BUILD_RADIO), true),)
BOARD_PACK_RADIOIMAGES := abl
BOARD_PACK_RADIOIMAGES += aop
BOARD_PACK_RADIOIMAGES += bluetooth
BOARD_PACK_RADIOIMAGES += cmnlib64
BOARD_PACK_RADIOIMAGES += cmnlib
BOARD_PACK_RADIOIMAGES += devcfg
BOARD_PACK_RADIOIMAGES += dsp
BOARD_PACK_RADIOIMAGES += featenabler
BOARD_PACK_RADIOIMAGES += hyp
BOARD_PACK_RADIOIMAGES += imagefv
BOARD_PACK_RADIOIMAGES += keymaster
BOARD_PACK_RADIOIMAGES += logo
#BOARD_PACK_RADIOIMAGES += mdm_oem_stanvbk
BOARD_PACK_RADIOIMAGES += modem
BOARD_PACK_RADIOIMAGES += multiimgoem
BOARD_PACK_RADIOIMAGES += qupfw
#BOARD_PACK_RADIOIMAGES += reserve
BOARD_PACK_RADIOIMAGES += storsec
#BOARD_PACK_RADIOIMAGES += spunvm
BOARD_PACK_RADIOIMAGES += tz
BOARD_PACK_RADIOIMAGES += uefisecapp
BOARD_PACK_RADIOIMAGES += xbl_config
BOARD_PACK_RADIOIMAGES += xbl_config_lp5
BOARD_PACK_RADIOIMAGES += xbl
BOARD_PACK_RADIOIMAGES += xbl_lp5
BOARD_PACK_RADIOIMAGES += storsec
endif

include device/oneplus/oneplus8pro/BoardConfig.mk

PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)
PRODUCT_SOONG_NAMESPACES += vendor/oneplus/oneplus8t vendor/omnihax0r

TARGET_RECOVERY_UI_SCREEN_WIDTH := 1080
TARGET_RECOVERY_UI_MARGIN_WIDTH := 30
TARGET_RECOVERY_UI_FONT := device/oneplus/oneplus8t/recovery/font.png
