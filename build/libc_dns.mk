PRJPATH = .

include $(PRJPATH)/build/common.mk

#########################################
# libc_dns
INC_LOCAL = \
	-Ibionic/libc/dns/include \
	-Ibionic/libc/private \
	-Ibionic/libc/upstream-netbsd/lib/libc/include \
	-Ibionic/libc/upstream-netbsd/android/include

CFLAGS_LOCAL = \
	-DANDROID_CHANGES \
	-DINET6 \
	-Wno-unused-parameter \
	-include netbsd-compat.h \
	-Wframe-larger-than=66000 

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

SRCS_C = $(wildcard bionic/libc/dns/**/*.c)
SRCS_C += \
	bionic/libc/upstream-netbsd/lib/libc/isc/ev_streams.c \
	bionic/libc/upstream-netbsd/lib/libc/isc/ev_timers.c

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