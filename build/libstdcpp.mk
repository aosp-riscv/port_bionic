PRJPATH = .

include $(PRJPATH)/build/common.mk

#########################################
# libstdc++
# NOTICE: TBD, where the liblog comes from?
INC_LOCAL = \
	-Ibionic/libstdc++/include \
	-Isystem/core/liblog/include

CFLAGS_LOCAL =

CPPFLAGS += \
	$(INC_LOCAL) \
	$(INC_LIBC) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(CFLAGS_LOCAL) \
	$(CPPFLAGS_COMPILER) \
	$(CFLAGS_NOOVERRIDECLANGGLOBAL)

SRCS_C =

# TBD, in Android.bp, there is:
# static_libs: ["libasync_safe"],
# not sure if this will involve more libs?
SRCS_CPP = \
	$(SRCPATH_LIBC)/bionic/__cxa_guard.cpp \
	$(SRCPATH_LIBC)/bionic/__cxa_pure_virtual.cpp \
	$(SRCPATH_LIBC)/bionic/new.cpp

OBJS = $(SRCS_C:.c=.o)
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

all : $(OBJS)
	@echo DONE!

.PHONY : clean
clean:
	$(RM) $(OBJS) $(DEPS)	
