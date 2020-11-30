PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

######################################
# libc_openbsd_large_stack

CPPFLAGS += \
	-include openbsd-compat.h \
	-Wno-sign-compare \
	-Wframe-larger-than=5000 \
	-Ibionic/libc/upstream-openbsd/android/include \
	-Ibionic/libc/upstream-openbsd/lib/libc/include \
	-Ibionic/libc/upstream-openbsd/lib/libc/gdtoa \
	-Ibionic/libc/upstream-openbsd/lib/libc/stdio

SRCS_CPP = \
	$(SRCPATH_LIBC)/stdio/vfprintf.cpp \
	$(SRCPATH_LIBC)/stdio/vfwprintf.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!