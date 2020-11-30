PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

######################################
# libc_freebsd_large_stack
INC_LOCAL = 

CFLAGS_LOCAL = \
	

CFLAGS += \
	-Wno-sign-compare \
	-include freebsd-compat.h \
	-Wframe-larger-than=66000 \
	-Ibionic/libc/upstream-freebsd/android/include

SRCS_C = \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/gen/glob.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/stdlib/realpath.c

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!