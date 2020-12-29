#!/bin/bash

PATH_QEMU=/opt/qemu/bin

PATH_PRJ=`pwd`
PATH_OUT=$PATH_PRJ/out

rm -f $PATH_OUT/rootfs.img
$PATH_QEMU/qemu-img create $PATH_OUT/rootfs.img 1g
chmod 666 $PATH_OUT/rootfs.img
mkfs.ext4 $PATH_OUT/rootfs.img
mkdir -p $PATH_OUT/rootfs
mount -o loop $PATH_OUT/rootfs.img  $PATH_OUT/rootfs
cd $PATH_OUT/rootfs && sudo mkdir -p bin sbin usr/bin usr/sbin proc sys dev etc etc/init.d system/bin system/etc system/lib64 root
cd $PATH_PRJ
cp $PATH_OUT/lib/shared/linker64 $PATH_OUT/rootfs/system/bin/
cp $PATH_PRJ/system/core/rootdir/etc/ld.config.txt $PATH_OUT/rootfs/system/etc/
cp $PATH_OUT/lib/shared/libc.so $PATH_OUT/rootfs/system/lib64/
cp $PATH_OUT/lib/shared/ld-android.so $PATH_OUT/rootfs/system/lib64/
cp $PATH_OUT/lib/shared/libdl.so $PATH_OUT/rootfs/system/lib64/
cp $PATH_OUT/lib/shared/libtest.so $PATH_OUT/rootfs/root/
cp $PATH_OUT/bin/hello $PATH_OUT/rootfs/root/
cp $PATH_OUT/bin/toybox $PATH_OUT/rootfs/bin/
cp $PATH_OUT/bin/sh $PATH_OUT/rootfs/bin/
CMDLIST=`/opt/qemu/bin/qemu-riscv64 out/bin/toybox --loop`
cd $PATH_OUT/rootfs && for i in $CMDLIST; do ln -s /bin/toybox $i; done
cd $PATH_PRJ
touch $PATH_OUT/rootfs/etc/init.d/rcS
cat > $PATH_OUT/rootfs/etc/init.d/rcS <<EOF
#!/bin/sh
mount -t proc none /proc
mount -t sysfs none /sys
/usr/bin/mdev -s
EOF
chmod +x $PATH_OUT/rootfs/etc/init.d/rcS
umount $PATH_OUT/rootfs
rmdir $PATH_OUT/rootfs
