PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

#########################################
# libc_dns

CFLAGS += \
	-DANDROID_CHANGES \
	-DINET6 \
	-Wno-unused-parameter \
	-include netbsd-compat.h \
	-Wframe-larger-than=66000 \
	-Ibionic/libc/dns/include \
	-Ibionic/libc/private \
	-Ibionic/libc/upstream-netbsd/lib/libc/include \
	-Ibionic/libc/upstream-netbsd/android/include

SRCS_C = $(wildcard bionic/libc/dns/**/*.c)
SRCS_C += \
	bionic/libc/upstream-netbsd/lib/libc/isc/ev_streams.c \
	bionic/libc/upstream-netbsd/lib/libc/isc/ev_timers.c

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!