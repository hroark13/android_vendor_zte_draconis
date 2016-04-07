#!/system/bin/sh

# Move from init.qcom.sh
# Check if download mode is enabled; // changed from 8974 shilinfeng
# 0 means disable;1 means enable
# default is zero=disable download, but in eng mode as below: defualt dlctrl is NULL, so the value will keep in code enabled status
#
zte_user_eng_status=`getprop ro.secure`
dlctrl=`getprop persist.sys.dlctrl`

case "$zte_user_eng_status" in
  "0")
        case "$dlctrl" in
             "1")
                 echo 1 > /sys/module/restart/parameters/download_mode;;
             "0")
                 echo 0 > /sys/module/restart/parameters/download_mode;;
        esac
        ;;
  "1")
        case "$dlctrl" in
             "1")
                 echo 1 > /sys/module/restart/parameters/download_mode;;
             *)
                 echo 0 > /sys/module/restart/parameters/download_mode;;
        esac
        ;;
esac

#
# Start Charge_Monitor with iusbmax parameter
#
name=`getprop ro.product.name`

case "$name" in
	"zte_warp5")
		/system/bin/charger_monitor qpnp_charger 300000 0
		;;
	"P892A12")
		/system/bin/charger_monitor qpnp_charger 300000 0
		;;
	*)
		/system/bin/charger_monitor qpnp_charger 400000 50
		;;
esac
