PRJPATH = .

include $(PRJPATH)/build/common.mk

###############################################
# libc_tzcode
INC_LOCAL = -Ibionic/libc/tzcode

CFLAGS_LOCAL = \
	-Wno-unused-parameter \
	-DALL_STATE \
	-DSTD_INSPIRED \
	-DTHREAD_SAFE \
	-DTM_GMTOFF=tm_gmtoff \
	'-DTZDIR="/system/usr/share/zoneinfo"' \
	-DHAVE_POSIX_DECLS=0 \
	-DUSG_COMPAT=1 \
	'-DWILDABBR=""' \
	-DNO_RUN_TIME_WARNINGS_ABOUT_YEAR_2000_PROBLEMS_THANK_YOU \
	-Dlint

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

SRCS_C = \
	$(SRCPATH_LIBC)/tzcode/asctime.c \
	$(SRCPATH_LIBC)/tzcode/difftime.c \
	$(SRCPATH_LIBC)/tzcode/localtime.c \
	$(SRCPATH_LIBC)/tzcode/strftime.c \
	$(SRCPATH_LIBC)/tzcode/strptime.c \
	$(SRCPATH_LIBC_OPENBSD)/lib/libc/time/wcsftime.c

SRCS_CPP = \
	$(SRCPATH_LIBC)/tzcode/bionic.cpp

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
