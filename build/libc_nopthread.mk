PRJPATH=.

include $(PRJPATH)/build/common.mk

#########################################
# libc_common_src_files is used both by libc_nopthread and libc_ndk, 
# but lib_ndk is not part of libc.a, so we here only consider 
# libc_common_src_files for libc_nopthread

# TBD: where this comes from? checked Android.bp but no answer yet
INC_LOCAL = \
	-Ibionic/libc/system_properties/include \
	-Isystem/core/property_service/libpropertyinfoparser/include

CFLAGS_LOCAL =

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

SRCS_C = \
	$(SRCPATH_LIBC)/bionic/ether_aton.c \
	$(SRCPATH_LIBC)/bionic/ether_ntoa.c \
	$(SRCPATH_LIBC)/bionic/fts.c \
	$(SRCPATH_LIBC)/bionic/initgroups.c \
	$(SRCPATH_LIBC)/bionic/isatty.c \
	$(SRCPATH_LIBC)/bionic/pututline.c \
	$(SRCPATH_LIBC)/bionic/sched_cpualloc.c \
	$(SRCPATH_LIBC)/bionic/sched_cpucount.c \
	$(SRCPATH_LIBC)/stdio/parsefloat.c \
	$(SRCPATH_LIBC)/stdio/refill.c \
	$(SRCPATH_LIBC)/stdio/vfwscanf.c \
	$(SRCPATH_LIBC)/stdlib/exit.c

SRCS_CPP = \
	$(SRCPATH_LIBC)/async_safe/async_safe_log.cpp \
	$(SRCPATH_LIBC)/stdio/fmemopen.cpp \
	$(SRCPATH_LIBC)/stdio/stdio.cpp \
	$(SRCPATH_LIBC)/stdio/stdio_ext.cpp \
	$(SRCPATH_LIBC)/stdio/vfscanf.cpp

OBJS = $(SRCS_C:.c=.o)
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

all : $(OBJS)
	@echo DONE!	

.PHONY : clean
clean:
	$(RM) $(OBJS)
	$(RM) $(DEPS)