PRJPATH = .

include $(PRJPATH)/build/common.mk

########################################
# libc_bionic
INC_LOCAL = -Ibionic/libstdc++/include

CFLAGS += \
	$(INC_LIBC) \
	$(INC_LOCAL) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(CFLAGS_LOCAL) \
	$(CFLAGS_COMPILER) \
	$(CFLAGS_NOOVERRIDECLANGGLOBAL)

AFLAGS += \
	$(INC_LIBC) \
	$(INC_LOCAL) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(CFLAGS_LOCAL) \
	$(AFLAGS_COMPILER)

CPPFLAGS += \
	$(INC_LIBC) \
	$(INC_LOCAL) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(CFLAGS_LOCAL) \
	$(CPPFLAGS_COMPILER) \
	$(CFLAGS_NOOVERRIDECLANGGLOBAL)

SRCS_ASM = \
	bionic/libc/arch-riscv64/bionic/__bionic_clone.S \
	bionic/libc/arch-riscv64/bionic/_exit_with_stack_teardown.S \
	bionic/libc/arch-riscv64/bionic/syscall.S \
	bionic/libc/arch-riscv64/bionic/vfork.S \
	bionic/libc/arch-riscv64/bionic/setjmp.S

SRCS_C = $(wildcard bionic/libc/arch-riscv64/string/*.c)
SRCS_C += \
	bionic/libc/arch-riscv64/bionic/renameat.c \
	bionic/libc/bionic/strnlen.c \

# TBD: refer x86, so exclude strchr.cpp/strnlen.c/strrchr.cpp
# mem*/str* files are arch depended, have not compiled, TBD
SRCS_CPP = \
	bionic/libc/bionic/getauxval.cpp \
	bionic/libc/bionic/sysconf.cpp \
	bionic/libc/bionic/vdso.cpp \
	bionic/libc/bionic/setjmp_cookie.cpp \
	bionic/libc/bionic/android_set_abort_message.cpp \
	bionic/libc/bionic/strchr.cpp \
	bionic/libc/bionic/strrchr.cpp


OBJS = $(SRCS_ASM:.S=.o)
OBJS += $(SRCS_C:.c=.o)
OBJS += $(SRCS_CPP:.cpp=.o)

DEPS = $(OBJS:.o=.o.d)

%.o : %.cpp
	$(RELPWD) $(CPP) $(CPPFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/$(OBJ_DIR)/
	mv $@.d $(PRJPATH)/$(OBJ_DIR)/

%.o : %.c
	$(RELPWD) $(CC) $(CFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/$(OBJ_DIR)/
	mv $@.d $(PRJPATH)/$(OBJ_DIR)/

%.o : %.S
	$(RELPWD) $(CC) $(AFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/$(OBJ_DIR)/
	mv $@.d $(PRJPATH)/$(OBJ_DIR)/

all : $(OBJS)
	@echo DONE!

.PHONY : clean
clean:
	$(RM) $(OBJS)
	$(RM) $(DEPS)