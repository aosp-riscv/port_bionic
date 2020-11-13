PRJPATH = .

include $(PRJPATH)/build/common.mk

###############################################
# libc_malloc
INC_LOCAL =

CFLAGS_LOCAL = -fvisibility=hidden

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
	$(SRCPATH_LIBC_BIONIC)/jemalloc_wrapper.cpp

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