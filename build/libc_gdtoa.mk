PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

#########################################
# libc_gdtoa

CFLAGS += \
	-Wno-sign-compare -include openbsd-compat.h \
	-Ibionic/libc/private \
	-Ibionic/libc/upstream-openbsd/android/include \
	-Ibionic/libc/upstream-openbsd/lib/libc/include

CPPFLAGS += \
	-Wno-sign-compare -include openbsd-compat.h \
	-Ibionic/libc/private \
	-Ibionic/libc/upstream-openbsd/android/include \
	-Ibionic/libc/upstream-openbsd/lib/libc/include

# refer x86, upstream-openbsd/lib/libc/gdtoa/strtorQ.c
# is not included, but for riscv64 this is needed!
SRCS_C_1 = \
	upstream-openbsd/lib/libc/gdtoa/dmisc.c \
	upstream-openbsd/lib/libc/gdtoa/dtoa.c \
	upstream-openbsd/lib/libc/gdtoa/gdtoa.c \
	upstream-openbsd/lib/libc/gdtoa/gethex.c \
	upstream-openbsd/lib/libc/gdtoa/gmisc.c \
	upstream-openbsd/lib/libc/gdtoa/hd_init.c \
	upstream-openbsd/lib/libc/gdtoa/hdtoa.c \
	upstream-openbsd/lib/libc/gdtoa/hexnan.c \
	upstream-openbsd/lib/libc/gdtoa/ldtoa.c \
	upstream-openbsd/lib/libc/gdtoa/misc.c \
	upstream-openbsd/lib/libc/gdtoa/smisc.c \
	upstream-openbsd/lib/libc/gdtoa/strtod.c \
	upstream-openbsd/lib/libc/gdtoa/strtodg.c \
	upstream-openbsd/lib/libc/gdtoa/strtof.c \
	upstream-openbsd/lib/libc/gdtoa/strtord.c \
	upstream-openbsd/lib/libc/gdtoa/sum.c \
	upstream-openbsd/lib/libc/gdtoa/ulp.c \
	upstream-openbsd/lib/libc/gdtoa/strtorQ.c
SRCS_C = $(addprefix bionic/libc/,${SRCS_C_1})

SRCS_CPP_1 = \
	upstream-openbsd/android/gdtoa_support.cpp
SRCS_CPP = $(addprefix bionic/libc/,${SRCS_CPP_1})

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!