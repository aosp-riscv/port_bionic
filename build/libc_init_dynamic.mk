PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

CPPFLAGS += \
	-fno-stack-protector

SRCS_CPP = bionic/libc/bionic/libc_init_dynamic.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!