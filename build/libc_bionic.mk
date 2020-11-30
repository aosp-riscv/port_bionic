PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

########################################
# libc_bionic
INC_LOCAL = -Ibionic/libstdc++/include

CFLAGS += \
	-Ibionic/libstdc++/include

AFLAGS += \
	-Ibionic/libstdc++/include

# TBD need to double checkout, I used to lost this -Wold-style-cast
CPPFLAGS += \
	-Wold-style-cast \
	-Ibionic/libstdc++/include

SRCS_ASM = \
	bionic/libc/arch-riscv64/bionic/__bionic_clone.S \
	bionic/libc/arch-riscv64/bionic/_exit_with_stack_teardown.S \
	bionic/libc/arch-riscv64/bionic/syscall.S \
	bionic/libc/arch-riscv64/bionic/vfork.S \
	bionic/libc/arch-riscv64/bionic/setjmp.S \
	bionic/libc/arch-riscv64/bionic/longjmp.S \
	bionic/libc/arch-riscv64/bionic/sigsetjmp.S

SRCS_C = $(wildcard bionic/libc/arch-riscv64/string/*.c)
SRCS_C += \
	bionic/libc/arch-riscv64/bionic/renameat.c \
	bionic/libc/bionic/strnlen.c \
	bionic/libc/arch-riscv64/bionic/siglongjmp.c \
	bionic/libc/arch-riscv64/bionic/sigsetjmp_tail.c

SRCS_CPP = \
	bionic/libc/bionic/getauxval.cpp \
	bionic/libc/bionic/sysconf.cpp \
	bionic/libc/bionic/vdso.cpp \
	bionic/libc/bionic/setjmp_cookie.cpp \
	bionic/libc/bionic/android_set_abort_message.cpp \
	bionic/libc/bionic/strchr.cpp \
	bionic/libc/bionic/strrchr.cpp


include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!