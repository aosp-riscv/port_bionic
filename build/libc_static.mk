PRJPATH=.

include $(PRJPATH)/build/common.mk

# FIXME: don't know where it comes from, but see it in build log
INC_LOCAL = \
	-Ibionic/libc/include \
	-Ibionic/libc/system_properties/include \
	-Isystem/core/property_service/libpropertyinfoparser/include 

# -D__LIBDL_API__=10000: don't know where it comes from
# -DLIBC_STATIC: defined in Android.bp
CFLAGS_LOCAL = \
	-D__LIBDL_API__=10000 \
	-DLIBC_STATIC

CPPFLAGS += \
	$(INC_LOCAL) \
	$(INC_LIBC) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(CFLAGS_LOCAL) \
	$(CPPFLAGS_COMPILER) \
	$(CFLAGS_NOOVERRIDECLANGGLOBAL)

SRCS = \
	bionic/libc/bionic/dl_iterate_phdr_static.cpp \
	bionic/libc/bionic/malloc_common.cpp \
	bionic/libc/bionic/malloc_limit.cpp

OBJS = $(SRCS:.cpp=.o)
DEPS = $(SRCS:.cpp=.o.d)

%.o : %.cpp
	$(RELPWD) $(CPP) $(CPPFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/out/
	mv $@.d $(PRJPATH)/out/

all : $(OBJS)
	@echo DONE!

.PHONY : clean
clean:
	$(RM) $(OBJS) $(DEPS)	

