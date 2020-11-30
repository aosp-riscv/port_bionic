PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

#############################################
# libc_netbsd

CFLAGS += \
	-Wno-sign-compare -Wno-unused-parameter -DPOSIX_MISTAKE -include netbsd-compat.h \
	-Ibionic/libc/upstream-netbsd/android/include \
	-Ibionic/libc/upstream-netbsd/lib/libc/include

SRCS_C_1 = \
	upstream-netbsd/common/lib/libc/stdlib/random.c \
	upstream-netbsd/lib/libc/gen/nice.c \
	upstream-netbsd/lib/libc/gen/psignal.c \
	upstream-netbsd/lib/libc/gen/utime.c \
	upstream-netbsd/lib/libc/gen/utmp.c \
	upstream-netbsd/lib/libc/inet/nsap_addr.c \
	upstream-netbsd/lib/libc/regex/regcomp.c \
	upstream-netbsd/lib/libc/regex/regerror.c \
	upstream-netbsd/lib/libc/regex/regexec.c \
	upstream-netbsd/lib/libc/regex/regfree.c \
	upstream-netbsd/lib/libc/stdlib/bsearch.c \
	upstream-netbsd/lib/libc/stdlib/drand48.c \
	upstream-netbsd/lib/libc/stdlib/erand48.c \
	upstream-netbsd/lib/libc/stdlib/jrand48.c \
	upstream-netbsd/lib/libc/stdlib/lcong48.c \
	upstream-netbsd/lib/libc/stdlib/lrand48.c \
	upstream-netbsd/lib/libc/stdlib/mrand48.c \
	upstream-netbsd/lib/libc/stdlib/nrand48.c \
	upstream-netbsd/lib/libc/stdlib/_rand48.c \
	upstream-netbsd/lib/libc/stdlib/rand_r.c \
	upstream-netbsd/lib/libc/stdlib/reallocarr.c \
	upstream-netbsd/lib/libc/stdlib/seed48.c \
	upstream-netbsd/lib/libc/stdlib/srand48.c
SRCS_C = $(addprefix bionic/libc/,${SRCS_C_1})

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!