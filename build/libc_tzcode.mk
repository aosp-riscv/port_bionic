PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

###############################################
# libc_tzcode
CFLAGS_LOCAL = \
	-Wno-unused-parameter \
	-DALL_STATE \
	-DSTD_INSPIRED \
	-DTHREAD_SAFE \
	-DTM_GMTOFF=tm_gmtoff \
	'-DTZDIR="/system/usr/share/zoneinfo"' \
	-DHAVE_POSIX_DECLS=0 \
	-DUSG_COMPAT=1 \
	'-DWILDABBR=""' \
	-DNO_RUN_TIME_WARNINGS_ABOUT_YEAR_2000_PROBLEMS_THANK_YOU \
	-Dlint

CFLAGS += \
	-Ibionic/libc/tzcode \
	$(CFLAGS_LOCAL)

CPPFLAGS += \
	-Ibionic/libc/tzcode \
	$(CFLAGS_LOCAL)

SRCS_C = \
	$(SRCPATH_LIBC)/tzcode/asctime.c \
	$(SRCPATH_LIBC)/tzcode/difftime.c \
	$(SRCPATH_LIBC)/tzcode/localtime.c \
	$(SRCPATH_LIBC)/tzcode/strftime.c \
	$(SRCPATH_LIBC)/tzcode/strptime.c \
	$(SRCPATH_LIBC_OPENBSD)/lib/libc/time/wcsftime.c

SRCS_CPP = \
	$(SRCPATH_LIBC)/tzcode/bionic.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo ${OBJS}
	@echo DONE!

