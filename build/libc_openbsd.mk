PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

########################################
# libc_openbsd

CFLAGS += \
	-Wno-sign-compare \
	-Wno-unused-parameter \
	-include openbsd-compat.h \
	-Ibionic/libc/private \
	-Ibionic/libc/upstream-openbsd/android/include

SRCS_C = \
	bionic/libc/upstream-openbsd/lib/libc/crypt/arc4random.c \
	bionic/libc/upstream-openbsd/lib/libc/crypt/arc4random_uniform.c \
	bionic/libc/upstream-openbsd/lib/libc/string/memchr.c \
	bionic/libc/upstream-openbsd/lib/libc/string/memrchr.c \
	bionic/libc/upstream-openbsd/lib/libc/string/stpcpy.c \
	bionic/libc/upstream-openbsd/lib/libc/string/stpncpy.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strcat.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strcpy.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strlcat.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strlcpy.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strncat.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strncmp.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strncpy.c
# other files are arch depended, TBD

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!