PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

###################################################
# libc_init_dynamic
# Defined: bionic/libc/Android.bp:132:1

CPPFLAGS += \
	-fno-stack-protector

SRCS_CPP = bionic/libc/bionic/libc_init_dynamic.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!