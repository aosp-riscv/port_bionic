PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

########################################
# libc_bionic_ndk
#
# -DTREBLE_LINKER_NAMESPACES from m.libc_bionic_ndk_android_x86_core_static.cflags
# -Wold-style-cast from m.libc_bionic_ndk_android_x86_core_static.cppflags
# other flags are from build rules
# notice:
# depends on generated out/soong/.intermediates/bionic/libc/generated_android_ids/gen/generated_android_ids.h,
# which has been added manually under ./.intermediates till now (TBD)

CPPFLAGS += \
	-DTREBLE_LINKER_NAMESPACES \
	-Wold-style-cast \
	-Ibionic/libc/stdio -Ibionic/libstdc++/include \
	-Ibionic/libc/system_properties/include -Isystem/core/property_service/libpropertyinfoparser/include \
	-I.intermediates

SRCS_CPP_1 = \
	bionic/NetdClientDispatch.cpp \
	bionic/__bionic_get_shell_path.cpp \
	bionic/__cmsg_nxthdr.cpp \
	bionic/__errno.cpp \
	bionic/__gnu_basename.cpp \
	bionic/__libc_current_sigrtmax.cpp \
	bionic/__libc_current_sigrtmin.cpp \
	bionic/abort.cpp \
	bionic/accept.cpp \
	bionic/accept4.cpp \
	bionic/access.cpp \
	bionic/arpa_inet.cpp \
	bionic/assert.cpp \
	bionic/atof.cpp \
	bionic/bionic_allocator.cpp \
	bionic/bionic_arc4random.cpp \
	bionic/bionic_futex.cpp \
	bionic/bionic_netlink.cpp \
	bionic/bionic_systrace.cpp \
	bionic/bionic_time_conversions.cpp \
	bionic/brk.cpp \
	bionic/c16rtomb.cpp \
	bionic/c32rtomb.cpp \
	bionic/chmod.cpp \
	bionic/chown.cpp \
	bionic/clearenv.cpp \
	bionic/clock.cpp \
	bionic/clock_getcpuclockid.cpp \
	bionic/clock_nanosleep.cpp \
	bionic/clone.cpp \
	bionic/connect.cpp \
	bionic/ctype.cpp \
	bionic/dirent.cpp \
	bionic/dup2.cpp \
	bionic/environ.cpp \
	bionic/error.cpp \
	bionic/eventfd_read.cpp \
	bionic/eventfd_write.cpp \
	bionic/exec.cpp \
	bionic/faccessat.cpp \
	bionic/fchmod.cpp \
	bionic/fchmodat.cpp \
	bionic/fdsan.cpp \
	bionic/ffs.cpp \
	bionic/fgetxattr.cpp \
	bionic/flistxattr.cpp \
	bionic/flockfile.cpp \
	bionic/fpclassify.cpp \
	bionic/fsetxattr.cpp \
	bionic/ftruncate.cpp \
	bionic/ftw.cpp \
	bionic/futimens.cpp \
	bionic/getcwd.cpp \
	bionic/getdomainname.cpp \
	bionic/getentropy.cpp \
	bionic/gethostname.cpp \
	bionic/getloadavg.cpp \
	bionic/getpagesize.cpp \
	bionic/getpgrp.cpp \
	bionic/getpid.cpp \
	bionic/getpriority.cpp \
	bionic/gettid.cpp \
	bionic/get_device_api_level.cpp \
	bionic/grp_pwd.cpp \
	bionic/grp_pwd_file.cpp \
	bionic/iconv.cpp \
	bionic/icu_wrappers.cpp \
	bionic/ifaddrs.cpp \
	bionic/inotify_init.cpp \
	bionic/ioctl.cpp \
	bionic/killpg.cpp \
	bionic/langinfo.cpp \
	bionic/lchown.cpp \
	bionic/lfs64_support.cpp \
	bionic/libc_init_common.cpp \
	bionic/libgen.cpp \
	bionic/link.cpp \
	bionic/locale.cpp \
	bionic/lockf.cpp \
	bionic/lstat.cpp \
	bionic/mblen.cpp \
	bionic/mbrtoc16.cpp \
	bionic/mbrtoc32.cpp \
	bionic/memmem.cpp \
	bionic/mempcpy.cpp \
	bionic/mkdir.cpp \
	bionic/mkfifo.cpp \
	bionic/mknod.cpp \
	bionic/mntent.cpp \
	bionic/mremap.cpp \
	bionic/net_if.cpp \
	bionic/netdb.cpp \
	bionic/netinet_in.cpp \
	bionic/nl_types.cpp \
	bionic/open.cpp \
	bionic/pathconf.cpp \
	bionic/pause.cpp \
	bionic/pipe.cpp \
	bionic/poll.cpp \
	bionic/posix_fadvise.cpp \
	bionic/posix_fallocate.cpp \
	bionic/posix_madvise.cpp \
	bionic/posix_timers.cpp \
	bionic/ptrace.cpp \
	bionic/pty.cpp \
	bionic/raise.cpp \
	bionic/rand.cpp \
	bionic/readlink.cpp \
	bionic/reboot.cpp \
	bionic/recv.cpp \
	bionic/rename.cpp \
	bionic/rmdir.cpp \
	bionic/scandir.cpp \
	bionic/sched_getaffinity.cpp \
	bionic/sched_getcpu.cpp \
	bionic/semaphore.cpp \
	bionic/send.cpp \
	bionic/setegid.cpp \
	bionic/seteuid.cpp \
	bionic/setpgrp.cpp \
	bionic/sigaction.cpp \
	bionic/signal.cpp \
	bionic/sigprocmask.cpp \
	bionic/socket.cpp \
	bionic/spawn.cpp \
	bionic/stat.cpp \
	bionic/statvfs.cpp \
	bionic/stdlib_l.cpp \
	bionic/strchrnul.cpp \
	bionic/strerror.cpp \
	bionic/string_l.cpp \
	bionic/strings_l.cpp \
	bionic/strsignal.cpp \
	bionic/strtol.cpp \
	bionic/strtold.cpp \
	bionic/swab.cpp \
	bionic/symlink.cpp \
	bionic/sync_file_range.cpp \
	bionic/sys_epoll.cpp \
	bionic/sys_msg.cpp \
	bionic/sys_sem.cpp \
	bionic/sys_shm.cpp \
	bionic/sys_signalfd.cpp \
	bionic/sys_time.cpp \
	bionic/sysinfo.cpp \
	bionic/syslog.cpp \
	bionic/system.cpp \
	bionic/system_property_api.cpp \
	bionic/system_property_set.cpp \
	bionic/tdestroy.cpp \
	bionic/termios.cpp \
	bionic/thread_private.cpp \
	bionic/timespec_get.cpp \
	bionic/tmpfile.cpp \
	bionic/umount.cpp \
	bionic/unlink.cpp \
	bionic/wait.cpp \
	bionic/wchar.cpp \
	bionic/wchar_l.cpp \
	bionic/wcstod.cpp \
	bionic/wctype.cpp \
	bionic/wcwidth.cpp \
	bionic/wmempcpy.cpp \
	bionic/icu_static.cpp
SRCS_CPP = $(addprefix bionic/libc/,${SRCS_CPP_1})

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!