PRJPATH = .

include $(PRJPATH)/build/common.mk

###############################################
# libc_stack_protector
INC_LOCAL =

CFLAGS_LOCAL = -fno-stack-protector

AFLAGS += \
	$(INC_LIBC) \
	$(INC_LOCAL) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(CFLAGS_LOCAL) \
	$(AFLAGS_COMPILER)

CPPFLAGS += \
	$(INC_LOCAL) \
	$(INC_LIBC) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(CFLAGS_LOCAL) \
	$(CPPFLAGS_COMPILER) \
	$(CFLAGS_NOOVERRIDECLANGGLOBAL)

# TBD:
# __libc_init_main_thread_early(), which defined in __libc_init_main_thread.cpp
# will call __set_tls(), which is arch depeneded routine.
# We should impletment this for riscv64
# some refernece: https://keithp.com/documents/lca2020-picolibc.pdf
# TLS: Thread Local Storage

SRCS_ASM = \
	bionic/libc/arch-riscv64/bionic/__set_tls.S

SRCS_C =

SRCS_CPP = \
	$(SRCPATH_LIBC_BIONIC)/__libc_init_main_thread.cpp \
	$(SRCPATH_LIBC_BIONIC)/__stack_chk_fail.cpp

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
