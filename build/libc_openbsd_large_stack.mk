PRJPATH = .

include $(PRJPATH)/build/common.mk

######################################
# libc_openbsd_large_stack
INC_LOCAL = \
	-Ibionic/libc/upstream-openbsd/android/include \
	-Ibionic/libc/upstream-openbsd/lib/libc/include \
	-Ibionic/libc/upstream-openbsd/lib/libc/gdtoa \
	-Ibionic/libc/upstream-openbsd/lib/libc/stdio

CFLAGS_LOCAL = \
	-include openbsd-compat.h \
	-Wno-sign-compare \
	-Wframe-larger-than=5000

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

SRCS_C =

SRCS_CPP = \
	$(SRCPATH_LIBC)/stdio/vfprintf.cpp \
	$(SRCPATH_LIBC)/stdio/vfwprintf.cpp

OBJS = $(SRCS_ASM:.S=.o)
OBJS += $(SRCS_C:.c=.o)
OBJS += $(SRCS_CPP:.cpp=.o)

DEPS = $(OBJS:.o=.o.d)

%.o : %.cpp
	$(RELPWD) $(CPP) $(CPPFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/out/
	mv $@.d $(PRJPATH)/out/

%.o : %.c
	$(RELPWD) $(CC) $(CFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/out/
	mv $@.d $(PRJPATH)/out/

%.o : %.S
	$(RELPWD) $(CC) $(AFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/out/
	mv $@.d $(PRJPATH)/out/

all : $(OBJS)
	@echo DONE!

.PHONY : clean
clean:
	$(RM) $(OBJS) $(DEPS)	
