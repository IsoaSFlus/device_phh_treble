$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
-include vendor/lineage/build/core/config.mk
-include vendor/lineage/build/core/apicheck.mk
$(call inherit-product, vendor/Lawnchair/config.mk)
$(call inherit-product, external/pingfang-fonts/fonts.mk)

#PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/phh/treble/rootdir/emui,system/emui)

$(shell mkdir -p "${OUT_DIR}/system")
$(shell cp -rf device/phh/treble/rootdir/emui "${OUT_DIR}/system/emui")

PRODUCT_PACKAGES += \
	init.victoria.rc
