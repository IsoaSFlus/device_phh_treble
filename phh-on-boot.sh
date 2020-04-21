#!/system/bin/sh

[ "$(getprop vold.decrypt)" = "trigger_restart_min_framework" ] && exit 0

setprop ctl.start media.swcodec

if getprop ro.hw.oemName | grep -q  -e '^VTR-';then
       	setprop odm.thp.service_enable 0
fi

for i in wpa p2p;do
	if [ ! -f /data/misc/wifi/${i}_supplicant.conf ];then
		cp /vendor/etc/wifi/wpa_supplicant.conf /data/misc/wifi/${i}_supplicant.conf
	fi
	chmod 0660 /data/misc/wifi/${i}_supplicant.conf
	chown wifi:system /data/misc/wifi/${i}_supplicant.conf
done

if [ -f /vendor/bin/mtkmal ];then
    if [ "$(getprop persist.mtk_ims_support)" = 1 ] || [ "$(getprop persist.mtk_epdg_support)" = 1 ];then
        setprop persist.mtk_ims_support 0
        setprop persist.mtk_epdg_support 0
        reboot
    fi
fi

if grep -qF android.hardware.boot /vendor/manifest.xml || grep -qF android.hardware.boot /vendor/etc/vintf/manifest.xml ;then
	bootctl mark-boot-successful
fi

setprop ctl.restart sec-light-hal-2-0
if find /sys/firmware -name support_fod |grep -qE .;then
	setprop ctl.restart vendor.fps_hal
fi

#Clear looping services
sleep 30
getprop | \
    grep restarting | \
    sed -nE -e 's/\[([^]]*).*/\1/g'  -e 's/init.svc.(.*)/\1/p' |
    while read -r svc ;do
        setprop ctl.stop "$svc"
    done

# VTR
if getprop ro.hw.oemName | grep -q  -e '^VTR-';then
    printf '1' > /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
    printf '90' > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
    printf '50:999000:75:1402000:90:1709000:95' > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
    printf '0' > /sys/devices/system/cpu/cpu0/cpufreq/interactive/fast_ramp_down

    printf '1' > /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy
    printf '0' > /sys/devices/system/cpu/cpu4/cpufreq/interactive/fast_ramp_down
fi
