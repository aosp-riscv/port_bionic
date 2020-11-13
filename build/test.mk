PRJPATH = .

include $(PRJPATH)/build/common.mk

AFLAGS += \
	$(INC_LIBC) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(AFLAGS_COMPILER)


INC_LOCAL = \
	-Ibionic/libc/stdio \
	-Ibionic/libstdc++/include

INC_EXTRA = \
	-Ibionic/libc/system_properties/include \
	-Isystem/core/property_service/libpropertyinfoparser/include \
	-I.intermediates

CFLAGS_LOCAL = -DTREBLE_LINKER_NAMESPACES

CPPFLAGS_COMPILER += -Wold-style-cast

CPPFLAGS += \
	$(INC_LOCAL) \
	$(INC_LIBC) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_EXTRA) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(CFLAGS_LOCAL) \
	$(CPPFLAGS_COMPILER) \
	$(CFLAGS_NOOVERRIDECLANGGLOBAL)

SRCS_ASM = bionic/libc/arch-riscv64/syscalls/__getcwd.S

SRCS_C = 

SRCS_CPP = build/test/test.cpp

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
	$(CPP) -g -nostdlib -no-pie -Wl,-r $(OBJ_DIR)/test.o $(OBJ_DIR)/__getcwd.o -o $(OBJ_DIR)/t.o -target riscv64-unknown-linux-gnu -B/opt/riscv64/bin
	@echo DONE!

.PHONY : clean
clean:
	$(RM) $(OBJS)
	$(RM) $(DEPS)
