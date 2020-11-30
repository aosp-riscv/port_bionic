PRJPATH=.

include $(PRJPATH)/build/common_bionic_libc.mk

#########################################
# libc_nopthread
#
# libc_common_src_files is used both by libc_nopthread and libc_ndk, 
# but lib_ndk is not part of libc.a, so we here only consider 
# libc_common_src_files for libc_nopthread

CFLAGS += \
	-Ibionic/libc/system_properties/include \
	-Isystem/core/property_service/libpropertyinfoparser/include

CPPFLAGS += \
	-Ibionic/libc/system_properties/include \
	-Isystem/core/property_service/libpropertyinfoparser/include

SRCS_C = \
	$(SRCPATH_LIBC)/bionic/ether_aton.c \
	$(SRCPATH_LIBC)/bionic/ether_ntoa.c \
	$(SRCPATH_LIBC)/bionic/fts.c \
	$(SRCPATH_LIBC)/bionic/initgroups.c \
	$(SRCPATH_LIBC)/bionic/isatty.c \
	$(SRCPATH_LIBC)/bionic/pututline.c \
	$(SRCPATH_LIBC)/bionic/sched_cpualloc.c \
	$(SRCPATH_LIBC)/bionic/sched_cpucount.c \
	$(SRCPATH_LIBC)/stdio/parsefloat.c \
	$(SRCPATH_LIBC)/stdio/refill.c \
	$(SRCPATH_LIBC)/stdio/vfwscanf.c \
	$(SRCPATH_LIBC)/stdlib/exit.c

SRCS_CPP = \
	$(SRCPATH_LIBC)/async_safe/async_safe_log.cpp \
	$(SRCPATH_LIBC)/stdio/fmemopen.cpp \
	$(SRCPATH_LIBC)/stdio/stdio.cpp \
	$(SRCPATH_LIBC)/stdio/stdio_ext.cpp \
	$(SRCPATH_LIBC)/stdio/vfscanf.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!