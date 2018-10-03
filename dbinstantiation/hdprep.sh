#!/bin/bash

(
echo n # Add a new partition
echo p # Primary partition
echo 1 # Partition number
echo   # First sector (Accept default: 1)
echo   # Last sector (Accept default: varies)
echo w # Write changes
) | sudo fdisk /dev/sdb

echo yes | mkfs.ext4 /dev/sdb

mkdir /mongodb
echo '/dev/sdb	/mongodb  ext4	defaults  0 0' >> /etc/fstab
mount -a
