PRJPATH = .

include $(PRJPATH)/build/common.mk

#########################################
# libc_gdtoa
CFLAGS_LOCAL = -Wno-sign-compare -include openbsd-compat.h

INC_LOCAL = \
	-Ibionic/libc/private \
	-Ibionic/libc/upstream-openbsd/android/include \
	-Ibionic/libc/upstream-openbsd/lib/libc/include

CFLAGS += \
	$(INC_LOCAL) \
	$(INC_LIBC) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(CFLAGS_LOCAL) \
	$(CFLAGS_COMPILER) \
	$(CFLAGS_NOOVERRIDECLANGGLOBAL)

CPPFLAGS += \
	$(INC_LOCAL) \
	$(INC_LIBC) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(CFLAGS_LOCAL) \
	$(CPPFLAGS_COMPILER) \
	$(CFLAGS_NOOVERRIDECLANGGLOBAL)

SRCS_ASM = 

# TBD: refer x86, so upstream-openbsd/lib/libc/gdtoa/strtorQ.c
# is not included, but for riscv64 this may need!
SRCS_C_1 = \
	upstream-openbsd/lib/libc/gdtoa/dmisc.c \
	upstream-openbsd/lib/libc/gdtoa/dtoa.c \
	upstream-openbsd/lib/libc/gdtoa/gdtoa.c \
	upstream-openbsd/lib/libc/gdtoa/gethex.c \
	upstream-openbsd/lib/libc/gdtoa/gmisc.c \
	upstream-openbsd/lib/libc/gdtoa/hd_init.c \
	upstream-openbsd/lib/libc/gdtoa/hdtoa.c \
	upstream-openbsd/lib/libc/gdtoa/hexnan.c \
	upstream-openbsd/lib/libc/gdtoa/ldtoa.c \
	upstream-openbsd/lib/libc/gdtoa/misc.c \
	upstream-openbsd/lib/libc/gdtoa/smisc.c \
	upstream-openbsd/lib/libc/gdtoa/strtod.c \
	upstream-openbsd/lib/libc/gdtoa/strtodg.c \
	upstream-openbsd/lib/libc/gdtoa/strtof.c \
	upstream-openbsd/lib/libc/gdtoa/strtord.c \
	upstream-openbsd/lib/libc/gdtoa/sum.c \
	upstream-openbsd/lib/libc/gdtoa/ulp.c \
	upstream-openbsd/lib/libc/gdtoa/strtorQ.c
SRCS_C = $(addprefix bionic/libc/,${SRCS_C_1})

SRCS_CPP_1 = \
	upstream-openbsd/android/gdtoa_support.cpp
SRCS_CPP = $(addprefix bionic/libc/,${SRCS_CPP_1})

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
