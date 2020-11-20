PRJPATH = .

include $(PRJPATH)/build/common.mk

CFLAGS += \
	-Wno-enum-compare -Wno-enum-compare-switch -Wno-null-pointer-arithmetic \
	-Wno-null-dereference \
	-Iexternal/toybox \
	-DANDROID -fmessage-length=0 -W -Wall -Wno-unused -Winit-self \
	-Wpointer-arith -no-canonical-prefixes -DNDEBUG -UDEBUG -fno-exceptions \
	-Wno-multichar -O2 -g -fno-strict-aliasing \
	-fdebug-prefix-map=/proc/self/cwd= \
	-D__compiler_offsetof=__builtin_offsetof -faddrsig -Wimplicit-fallthrough \
	-Werror=int-conversion -Wno-reserved-id-macro -Wno-format-pedantic \
	-Wno-unused-command-line-argument -fcolor-diagnostics \
	-Wno-zero-as-null-pointer-constant -Wno-sign-compare \
	-Wno-defaulted-function-deleted -Wno-inconsistent-missing-override \
	-ffunction-sections -fdata-sections -fno-short-enums -funwind-tables \
	-fstack-protector-strong -Wa,--noexecstack -D_FORTIFY_SOURCE=2 \
	-Wstrict-aliasing=2 -Werror=return-type -Werror=non-virtual-dtor \
	-Werror=address -Werror=sequence-point -Werror=date-time \
	-Werror=format-security -nostdlibinc \
	-Isystem/core/liblog/include -Iexternal/selinux/libselinux/include \
	-Isystem/core/libcutils/include -Isystem/core/libprocessgroup/include \
	-Iexternal/boringssl/src/include -Iexternal/zlib -Ibionic/libc/include \
	-D__LIBC_API__=10000 -D__LIBM_API__=10000 -D__LIBDL_API__=10000 \
	-Isystem/core/include -Isystem/media/audio/include \
	-Ihardware/libhardware/include -Ihardware/libhardware_legacy/include \
	-Ihardware/ril/include -Iframeworks/native/include \
	-Iframeworks/native/opengl/include -Iframeworks/av/include \
	-isystem bionic/libc/include -isystem bionic/libc/kernel/uapi \
	-isystem bionic/libc/kernel/uapi/asm-riscv \
	-isystem bionic/libc/kernel/android/scsi \
	-isystem bionic/libc/kernel/android/uapi \
	-Ilibnativehelper/include_jni \
	-std=gnu11 -Os -Wall -Werror -Wno-char-subscripts \
	-Wno-deprecated-declarations -Wno-missing-field-initializers \
	-Wno-pointer-arith -Wno-sign-compare -Wno-string-plus-int \
	-Wno-unused-parameter -funsigned-char -ffunction-sections -fdata-sections \
	-fno-asynchronous-unwind-tables '-DTOYBOX_VENDOR="-android"' \
	-target riscv64-unknown-linux-gnu \
	-B/opt/riscv64/bin \
	-fPIE -std=gnu99 \
	-Werror=int-to-pointer-cast -Werror=pointer-to-int-cast \
	-Werror=address-of-temporary -Werror=return-type \
	-Wno-tautological-constant-compare -Wno-tautological-type-limit-compare \
	-Wno-tautological-unsigned-enum-zero-compare \
	-Wno-tautological-unsigned-zero-compare \
	-Wno-c++98-compat-extra-semi -Wno-return-std-move-in-c++11

SRCS_C_A =
#SRCS_C_A = \
	toys/android/getenforce.c \
	toys/android/load_policy.c \
	toys/android/log.c \
	toys/android/restorecon.c \
	toys/android/runcon.c \
	toys/android/sendevent.c \
	toys/android/setenforce.c \
	toys/android/setprop.c \
	toys/android/start.c
SRCS_C_T = \
	lib/args.c \
	lib/commas.c \
	lib/dirtree.c \
	lib/help_2.c \
	lib/lib.c \
	lib/linestack.c \
	lib/llist.c \
	lib/net.c \
	lib/portability.c \
	lib/tty_2.c \
	lib/xwrap.c \
	main.c \
	toys/lsb/dmesg.c \
	toys/lsb/hostname.c \
	toys/lsb/killall.c \
	toys/lsb/md5sum.c \
	toys/lsb/mknod.c \
	toys/lsb/mktemp.c \
	toys/lsb/mount.c \
	toys/lsb/pidof.c \
	toys/lsb/seq.c \
	toys/lsb/sync.c \
	toys/lsb/umount.c \
	toys/net/ifconfig.c \
	toys/net/microcom.c \
	toys/net/netcat.c \
	toys/net/netstat.c \
	toys/net/ping.c \
	toys/net/rfkill.c \
	toys/net/tunctl.c \
	toys/other/acpi.c \
	toys/other/base64.c \
	toys/other/blkid.c \
	toys/other/blockdev.c \
	toys/other/chroot.c \
	toys/other/chrt.c \
	toys/other/clear.c \
	toys/other/devmem.c \
	toys/other/dos2unix.c \
	toys/other/fallocate.c \
	toys/other/flock.c \
	toys/other/fmt.c \
	toys/other/free.c \
	toys/other/freeramdisk.c \
	toys/other/fsfreeze.c \
	toys/other/fsync.c \
	toys/other/help.c \
	toys/other/hwclock.c \
	toys/other/i2ctools.c \
	toys/other/inotifyd.c \
	toys/other/insmod.c \
	toys/other/ionice.c \
	toys/other/losetup.c \
	toys/other/lsattr.c \
	toys/other/lsmod.c \
	toys/other/lspci.c \
	toys/other/lsusb.c \
	toys/other/makedevs.c \
	toys/other/mkswap.c \
	toys/other/modinfo.c \
	toys/other/mountpoint.c \
	toys/other/nbd_client.c \
	toys/other/nsenter.c \
	toys/other/partprobe.c \
	toys/other/pivot_root.c \
	toys/other/pmap.c \
	toys/other/printenv.c \
	toys/other/pwdx.c \
	toys/other/readlink.c \
	toys/other/realpath.c \
	toys/other/rev.c \
	toys/other/rmmod.c \
	toys/other/setfattr.c \
	toys/other/setsid.c \
	toys/other/stat.c \
	toys/other/swapoff.c \
	toys/other/swapon.c \
	toys/other/sysctl.c \
	toys/other/tac.c \
	toys/other/taskset.c \
	toys/other/timeout.c \
	toys/other/truncate.c \
	toys/other/uptime.c \
	toys/other/usleep.c \
	toys/other/uuidgen.c \
	toys/other/vconfig.c \
	toys/other/vmstat.c \
	toys/other/watch.c \
	toys/other/which.c \
	toys/other/xxd.c \
	toys/other/yes.c \
	toys/posix/basename.c \
	toys/posix/cal.c \
	toys/posix/cat.c \
	toys/posix/chgrp.c \
	toys/posix/chmod.c \
	toys/posix/cksum.c \
	toys/posix/cmp.c \
	toys/posix/comm.c \
	toys/posix/cp.c \
	toys/posix/cpio.c \
	toys/posix/cut.c \
	toys/posix/date.c \
	toys/posix/df.c \
	toys/posix/dirname.c \
	toys/posix/du.c \
	toys/posix/echo.c \
	toys/posix/env.c \
	toys/posix/expand.c \
	toys/posix/false.c \
	toys/posix/file.c \
	toys/posix/find.c \
	toys/posix/getconf.c \
	toys/posix/grep.c \
	toys/posix/head.c \
	toys/posix/iconv.c \
	toys/posix/id.c \
	toys/posix/kill.c \
	toys/posix/ln.c \
	toys/posix/ls.c \
	toys/posix/mkdir.c \
	toys/posix/mkfifo.c \
	toys/posix/nice.c \
	toys/posix/nl.c \
	toys/posix/nohup.c \
	toys/posix/od.c \
	toys/posix/paste.c \
	toys/posix/patch.c \
	toys/posix/printf.c \
	toys/posix/ps.c \
	toys/posix/pwd.c \
	toys/posix/renice.c \
	toys/posix/rm.c \
	toys/posix/rmdir.c \
	toys/posix/sed.c \
	toys/posix/sleep.c \
	toys/posix/sort.c \
	toys/posix/split.c \
	toys/posix/strings.c \
	toys/posix/tail.c \
	toys/posix/tee.c \
	toys/posix/time.c \
	toys/posix/touch.c \
	toys/posix/true.c \
	toys/posix/tty.c \
	toys/posix/ulimit.c \
	toys/posix/uname.c \
	toys/posix/uniq.c \
	toys/posix/unlink.c \
	toys/posix/uudecode.c \
	toys/posix/uuencode.c \
	toys/posix/wc.c \
	toys/posix/xargs.c

SRCS_C_P = \
	toys/pending/bc.c \
	toys/pending/dd.c \
	toys/pending/diff.c \
	toys/pending/expr.c \
	toys/pending/getfattr.c \
	toys/pending/lsof.c \
	toys/pending/modprobe.c \
	toys/pending/more.c \
	toys/pending/stty.c \
	toys/pending/tar.c \
	toys/pending/tr.c \
	toys/pending/traceroute.c \
	toys/pending/getty.c \
	toys/pending/mdev.c \
	toys/pending/init.c
#	toys/pending/gzip.c

SRCS_C_ALL = $(SRCS_C_A) $(SRCS_C_T) $(SRCS_C_P)
SRCS_C = $(addprefix external/toybox/,${SRCS_C_ALL})

OBJS = $(SRCS_C:.c=.o)

DEPS = $(OBJS:.o=.o.d)

%.o : %.c
	$(RELPWD) $(CC) $(CFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/$(OBJ_DIR)/
	mv $@.d $(PRJPATH)/$(OBJ_DIR)/

all : $(OBJS)
	rm -f $(BIN_DIR)/unstripped/toybox
	rm -f $(BIN_DIR)/toybox
	/opt/riscv64/bin/riscv64-unknown-linux-gnu-ld \
		-nostdlib -static \
		./out/lib/crtbegin_static.o \
		-L./out/lib/static \
		$(OBJ_DIR)/*.o \
		--start-group \
		/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc.a \
		/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc_eh.a \
		-lc \
		--end-group \
		./out/lib/crtend.o \
		-o $(BIN_DIR)/unstripped/toybox
	/opt/riscv64/bin/riscv64-unknown-linux-gnu-strip $(BIN_DIR)/unstripped/toybox -o $(BIN_DIR)/toybox
	@echo DONE!

.PHONY : clean
clean:
	$(RM) $(OBJS)
	$(RM) $(DEPS)
