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
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/static ]; then mkdir -p $(LIB_DIR)/static; fi
	@echo $(OUTPUT_OBJS) >> $(LIB_DIR)/static/libc_init_dynamic.a.rsp
	llvm-ar crsD -format=gnu $(LIB_DIR)/static/libc_init_dynamic.a @${LIB_DIR}/static/libc_init_dynamic.a.rsp
	@echo DONE!