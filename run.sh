#!/bin/bash
PATH_KERNEL=/home/u/ws/aosp-kernel/common/arch/riscv/boot/Image
PATH_ROOTFS=out/rootfs.img

qemu-system-riscv64 -M virt -m 256M -nographic -kernel ${PATH_KERNEL} -drive file=${PATH_ROOTFS},format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -append "root=/dev/vda rw console=ttyS0"
