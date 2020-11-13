PRJPATH = .

include $(PRJPATH)/build/common.mk

AFLAGS += \
	-Ibionic/libc/include -Ibionic/libc \
	-DANDROID -fmessage-length=0 -W -Wall -Wno-unused -Winit-self -Wpointer-arith \
	-no-canonical-prefixes -DNDEBUG -UDEBUG -fno-exceptions -Wno-multichar -O2 -g \
	-fno-strict-aliasing \
	-fdebug-prefix-map=/proc/self/cwd= \
	-D__compiler_offsetof=__builtin_offsetof -faddrsig -Wimplicit-fallthrough \
	-Werror=int-conversion -Wno-reserved-id-macro -Wno-format-pedantic \
	-Wno-unused-command-line-argument -fcolor-diagnostics \
	-Wno-zero-as-null-pointer-constant -Wno-sign-compare \
	-Wno-defaulted-function-deleted -Wno-inconsistent-missing-override \
	-ffunction-sections -fdata-sections -fno-short-enums -funwind-tables \
	-fstack-protector-strong -Wa,--noexecstack -D_FORTIFY_SOURCE=2 \
	-Wstrict-aliasing=2 -Werror=return-type -Werror=non-virtual-dtor \
	-Werror=address -Werror=sequence-point -Werror=date-time -Werror=format-security \
	-nostdlibinc \
	-Iexternal/libcxx/include -Iexternal/libcxxabi/include \
	-Isystem/core/include -Isystem/media/audio/include -Ihardware/libhardware/include \
	-Ihardware/libhardware_legacy/include -Ihardware/ril/include \
	-Iframeworks/native/include -Iframeworks/native/opengl/include \
	-Iframeworks/av/include \
	-isystem bionic/libc/include -isystem bionic/libc/kernel/uapi \
	-isystem bionic/libc/kernel/uapi/asm-riscv \
	-isystem bionic/libc/kernel/android/scsi \
	-isystem bionic/libc/kernel/android/uapi \
	-Ilibnativehelper/include_jni \
	-target riscv64-unknown-linux-gnu \
	-B/opt/riscv64/bin \
	-D__ASSEMBLY__

SRCS_ASM = \
	bionic/libc/arch-common/bionic/crtend.S

SRCS_C =

SRCS_CPP =

OBJS = $(SRCS_ASM:.S=.o)
OBJS += $(SRCS_C:.c=.o)
OBJS += $(SRCS_CPP:.cpp=.o)

DEPS = $(OBJS:.o=.o.d)

%.o : %.c
	$(RELPWD) $(CC) $(CFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/$(OBJ_DIR)/
	mv $@.d $(PRJPATH)/$(OBJ_DIR)/

%.o : %.S
	$(RELPWD) $(CC) $(AFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/$(OBJ_DIR)/
	mv $@.d $(PRJPATH)/$(OBJ_DIR)/

all : $(OBJS)
	rm -f $(LIB_DIR)/crtend.o && cp $(OBJ_DIR)/crtend.o $(LIB_DIR)/crtend.o
	@echo DONE!

.PHONY : clean
clean:
	$(RM) $(OBJS)
	$(RM) $(DEPS)