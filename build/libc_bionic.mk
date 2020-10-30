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

SRCS_ASM = 

SRCS_C =

# TBD: refer x86, so exclude strchr.cpp/strnlen.c/strrchr.cpp
# mem*/str* files are arch depended, have not compiled, TBD
SRCS_CPP = \
	bionic/libc/bionic/getauxval.cpp \
	bionic/libc/bionic/sysconf.cpp \
	bionic/libc/bionic/vdso.cpp \
	bionic/libc/bionic/setjmp_cookie.cpp \
	bionic/libc/bionic/android_set_abort_message.cpp

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
