PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

##########################################
# libc_syscalls

AFLAGS +=
CPPFLAGS +=

SRCS_ASM = $(wildcard bionic/libc/arch-riscv64/syscalls/*.S)
# TBD 
# riscv64 doesn't support renameat, use renameat2 instead
# https://github.com/golang/sys/commit/e5ecc2a6747ce8d4af18ed98b3de5ae30eb3a5bb
# https://www.openwall.com/lists/musl/2018/11/11/1
# so removed syscall of renameat
# but how to handle renameat2, waiting later integration with rootfs

SRCS_CPP = \
	$(SRCPATH_LIBC)/bionic/__set_errno.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!