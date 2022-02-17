#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:67108864:52fe92d70d16508f9384da35b083feeb9d08a48d; then
  applypatch  EMMC:/dev/block/bootdevice/by-name/boot:67108864:01dd9f1a5216a773509376aedf63b41951101043 EMMC:/dev/block/bootdevice/by-name/recovery 52fe92d70d16508f9384da35b083feeb9d08a48d 67108864 01dd9f1a5216a773509376aedf63b41951101043:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
