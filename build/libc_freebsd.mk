PRJPATH = .

include $(PRJPATH)/build/common.mk

#########################################
# libc_freebsd
INC_LOCAL = -Ibionic/libc/upstream-freebsd/android/include 

CFLAGS_LOCAL = -Wno-sign-compare -Wno-unused-parameter -include freebsd-compat.h

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

# TBD
# notice I copy this from x86 building, some files are excluded.
# for risc-v, the sourcefile list may be different, double-check this！！！
SRCS_C = \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/gen/ldexp.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/gen/sleep.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/gen/usleep.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/stdlib/getopt_long.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/stdlib/hcreate.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/stdlib/hcreate_r.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/stdlib/hdestroy_r.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/stdlib/hsearch_r.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/stdlib/qsort.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/stdlib/quick_exit.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcpcpy.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcpncpy.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcscasecmp.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcscspn.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcsdup.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcslcat.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcsncasecmp.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcsncmp.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcsncpy.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcsnlen.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcsncat.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcspbrk.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcsspn.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcsstr.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wcstok.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wmemchr.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wmemcpy.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wmemmove.c \
	$(SRCPATH_LIBC_FREEBSD)/lib/libc/string/wmemset.c

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