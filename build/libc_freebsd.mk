PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

#########################################
# libc_freebsd
CFLAGS += \
	-Wno-sign-compare -Wno-unused-parameter -include freebsd-compat.h \
	-Ibionic/libc/upstream-freebsd/android/include

SRCS_C = \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/gen/ldexp.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/gen/sleep.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/gen/usleep.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/stdlib/getopt_long.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/stdlib/hcreate.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/stdlib/hcreate_r.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/stdlib/hdestroy_r.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/stdlib/hsearch_r.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/stdlib/qsort.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/stdlib/quick_exit.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcpcpy.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcpncpy.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcscasecmp.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcscspn.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcsdup.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcslcat.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcsncasecmp.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcsncmp.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcsncpy.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcsnlen.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcsncat.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcspbrk.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcsspn.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcsstr.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcstok.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wmemchr.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wmemcpy.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wmemmove.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wmemset.c

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!