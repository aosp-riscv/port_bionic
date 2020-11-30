PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

###############################################
# libc_malloc

CPPFLAGS += \
	-fvisibility=hidden

SRCS_CPP = \
	$(SRCPATH_LIBC_BIONIC)/jemalloc_wrapper.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!