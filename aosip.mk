#
# Copyright (C) 2019 The LineageOS Project
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

 # Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

 # Inherit from daisy device
$(call inherit-product, device/xiaomi/daisy/device.mk)

 # Inherit some common Lineage stuff.	
$(call inherit-product, vendor/aosip/config/common_full_phone.mk)

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    bootctrl.msm8953 \

PRODUCT_PACKAGES_DEBUG += \
    bootctl

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.msm8953 \
    libcutils \
    libgptutils \
    libz

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

 # Device identifier. This must come after all inclusions.
PRODUCT_NAME := aosip_daisy
PRODUCT_DEVICE := daisy
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := MI A2 Lite
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="daisy_sprout" \
    PRODUCT_NAME="daisy_sprout" \
    PRIVATE_BUILD_DESC="daisy-user 9 PKQ1.180917.001 V10.0.9.0.PDLMIXM release-keys "

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop	
BUILD_FINGERPRINT := "xiaomi/daisy/daisy_sprout:9/PKQ1.180917.001/V10.0.9.0.PDLMIXM:user/release-keys"

TARGET_VENDOR := Xiaomi
