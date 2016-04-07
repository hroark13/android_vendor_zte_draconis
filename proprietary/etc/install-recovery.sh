#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 15847424 7793ab8972156f658c1cfdf264dd3a098a9ee9b7 13895680 93fc0e6fedc8a2820a47c1793803b37fb3cbc420
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:15847424:7793ab8972156f658c1cfdf264dd3a098a9ee9b7; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:13895680:93fc0e6fedc8a2820a47c1793803b37fb3cbc420 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 7793ab8972156f658c1cfdf264dd3a098a9ee9b7 15847424 93fc0e6fedc8a2820a47c1793803b37fb3cbc420:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
