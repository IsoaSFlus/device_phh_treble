$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
-include vendor/lineage/build/core/config.mk
-include vendor/lineage/build/core/apicheck.mk
$(call inherit-product, vendor/Lawnchair/config.mk)
$(call inherit-product, external/pingfang-fonts/fonts.mk)

