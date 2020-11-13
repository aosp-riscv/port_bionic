PRJPATH = .

include $(PRJPATH)/build/common.mk

#############################################
# libc_netbsd
INC_LOCAL = \
	-Ibionic/libc/upstream-netbsd/android/include \
	-Ibionic/libc/upstream-netbsd/lib/libc/include

CFLAGS_LOCAL = \
	-Wno-sign-compare -Wno-unused-parameter -DPOSIX_MISTAKE -include netbsd-compat.h

CFLAGS += \
	$(INC_LOCAL) \
	$(INC_LIBC) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(CFLAGS_LOCAL) \
	$(CFLAGS_COMPILER) \
	$(CFLAGS_NOOVERRIDECLANGGLOBAL)

SRCS_ASM = 

SRCS_C_1 = \
	upstream-netbsd/common/lib/libc/stdlib/random.c \
	upstream-netbsd/lib/libc/gen/nice.c \
	upstream-netbsd/lib/libc/gen/psignal.c \
	upstream-netbsd/lib/libc/gen/utime.c \
	upstream-netbsd/lib/libc/gen/utmp.c \
	upstream-netbsd/lib/libc/inet/nsap_addr.c \
	upstream-netbsd/lib/libc/regex/regcomp.c \
	upstream-netbsd/lib/libc/regex/regerror.c \
	upstream-netbsd/lib/libc/regex/regexec.c \
	upstream-netbsd/lib/libc/regex/regfree.c \
	upstream-netbsd/lib/libc/stdlib/bsearch.c \
	upstream-netbsd/lib/libc/stdlib/drand48.c \
	upstream-netbsd/lib/libc/stdlib/erand48.c \
	upstream-netbsd/lib/libc/stdlib/jrand48.c \
	upstream-netbsd/lib/libc/stdlib/lcong48.c \
	upstream-netbsd/lib/libc/stdlib/lrand48.c \
	upstream-netbsd/lib/libc/stdlib/mrand48.c \
	upstream-netbsd/lib/libc/stdlib/nrand48.c \
	upstream-netbsd/lib/libc/stdlib/_rand48.c \
	upstream-netbsd/lib/libc/stdlib/rand_r.c \
	upstream-netbsd/lib/libc/stdlib/reallocarr.c \
	upstream-netbsd/lib/libc/stdlib/seed48.c \
	upstream-netbsd/lib/libc/stdlib/srand48.c
SRCS_C = $(addprefix bionic/libc/,${SRCS_C_1})

SRCS_CPP =


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
