PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

###############################################
# libc_stack_protector

# TBD: used use -fno-stack-protector for .S, need double check if works after
# remove it
AFLAGS +=

CPPFLAGS += \
	-fno-stack-protector

# TBD:
# __libc_init_main_thread_early(), which defined in __libc_init_main_thread.cpp
# will call __set_tls(), which is arch depeneded routine.
# We should impletment this for riscv64
# some refernece: https://keithp.com/documents/lca2020-picolibc.pdf
# TLS: Thread Local Storage

SRCS_ASM = \
	bionic/libc/arch-riscv64/bionic/__set_tls.S

SRCS_CPP = \
	$(SRCPATH_LIBC_BIONIC)/__libc_init_main_thread.cpp \
	$(SRCPATH_LIBC_BIONIC)/__stack_chk_fail.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!