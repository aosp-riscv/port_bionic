PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

###############################################
# libc_fortify


CPPFLAGS += \
	-U_FORTIFY_SOURCE -D__BIONIC_DECLARE_FORTIFY_HELPERS

SRCS_CPP = \
	$(SRCPATH_LIBC_BIONIC)/fortify.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!