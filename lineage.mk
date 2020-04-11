$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
-include vendor/lineage/build/core/config.mk
-include vendor/lineage/build/core/apicheck.mk

# Lawnchair
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/permissions/privapp-permissions-lawnchair.xml:system/etc/permissions/privapp-permissions-lawnchair.xml \
    $(LOCAL_PATH)/prebuilt/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml:system/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml

PRODUCT_PACKAGES += \
    Lawnchair

