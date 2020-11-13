PRJPATH = .

include $(PRJPATH)/build/common.mk

########################################
# libc_openbsd
INC_LOCAL = \
	-Ibionic/libc/private \
	-Ibionic/libc/upstream-openbsd/android/include

CFLAGS_LOCAL = \
	-Wno-sign-compare \
	-Wno-unused-parameter \
	-include openbsd-compat.h

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

# These two depend on getentropy, which isn't in libc_ndk.a.
SRCS_C = \
	bionic/libc/upstream-openbsd/lib/libc/crypt/arc4random.c \
	bionic/libc/upstream-openbsd/lib/libc/crypt/arc4random_uniform.c \
	bionic/libc/upstream-openbsd/lib/libc/string/memchr.c \
	bionic/libc/upstream-openbsd/lib/libc/string/memrchr.c \
	bionic/libc/upstream-openbsd/lib/libc/string/stpcpy.c \
	bionic/libc/upstream-openbsd/lib/libc/string/stpncpy.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strcat.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strcpy.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strlcat.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strlcpy.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strncat.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strncmp.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strncpy.c
# other files are arch depended, TBD

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