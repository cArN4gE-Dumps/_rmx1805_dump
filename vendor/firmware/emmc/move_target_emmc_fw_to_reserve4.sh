#!/bin/bash
fw_path=$1
echo fw_path=$fw_path
cat /proc/devinfo/emmc
cat /proc/devinfo/emmc_version

#reserve4 -> /dev/block/mmcblk0p7
if [ "$fw_path" != "" ]; then
	if [ -f $fw_path ];then
		dd if="${fw_path}" of=/cache/src_fw_header bs=1 count=48 skip=80;
		dd if=/dev/block/bootdevice/by-name/opporeserve1 of=/cache/local_fw_header bs=1 count=48 skip=0;
		cmp -s /cache/src_fw_header /cache/local_fw_header;
		if [ $? -eq 1 ]; then
			echo "new fw found, copy to target partition";
			dd if="${fw_path}" of=/dev/block/bootdevice/by-name/opporeserve1  bs=1 seek=0 skip=80;
		else
			echo "fw is same, don't copy to target partition";
		fi
	fi
fi