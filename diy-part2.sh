#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.100.1/192.168.20.1/g' package/base-files/files/bin/config_generate
# 默认打开WiFi
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/ssid=OpenWrt/OpenWrt_$(cat /sys/class/ieee80211/${dev}/macaddress|awk -F ":" '{print $4""$5""$6 }'| tr a-z A-Z)/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/set wireless.default_radio${devidx}.encryption=none/set wireless.default_radio${devidx}.encryption=psk2
			set wireless.default_radio${devidx}.key=1234567890/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
