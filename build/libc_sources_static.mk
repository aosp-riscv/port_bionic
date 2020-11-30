PRJPATH=.

include $(PRJPATH)/build/common_bionic_libc.mk

CPPFLAGS += \
	-Ibionic/libc/system_properties/include \
	-Isystem/core/property_service/libpropertyinfoparser/include \
	-D__LIBDL_API__=10000 \
	-DLIBC_STATIC

SRCS_CPP = \
	bionic/libc/bionic/dl_iterate_phdr_static.cpp \
	bionic/libc/bionic/malloc_common.cpp \
	bionic/libc/bionic/malloc_limit.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!