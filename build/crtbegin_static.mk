PRJPATH = .

include $(PRJPATH)/build/common.mk

CFLAGS += \
	-Ibionic/libc/include -Ibionic/libc \
	-DANDROID -fmessage-length=0 -W -Wall -Wno-unused -Winit-self -Wpointer-arith \
	-no-canonical-prefixes -DNDEBUG -UDEBUG -fno-exceptions -Wno-multichar -O2 -g \
	-fno-strict-aliasing \
	-fdebug-prefix-map=/proc/self/cwd= \
	-D__compiler_offsetof=__builtin_offsetof -faddrsig -Wimplicit-fallthrough \
	-Werror=int-conversion -Wno-reserved-id-macro -Wno-format-pedantic \
	-Wno-unused-command-line-argument -fcolor-diagnostics -Wno-zero-as-null-pointer-constant \
	-Wno-sign-compare -Wno-defaulted-function-deleted -Wno-inconsistent-missing-override \
	-ffunction-sections -fdata-sections -fno-short-enums -funwind-tables \
	-fstack-protector-strong -Wa,--noexecstack -D_FORTIFY_SOURCE=2 -Wstrict-aliasing=2 \
	-Werror=return-type -Werror=non-virtual-dtor -Werror=address -Werror=sequence-point \
	-Werror=date-time -Werror=format-security \
	-nostdlibinc \
	-Iexternal/libcxx/include -Iexternal/libcxxabi/include -Isystem/core/include \
	-Isystem/media/audio/include -Ihardware/libhardware/include \
	-Ihardware/libhardware_legacy/include -Ihardware/ril/include \
	-Iframeworks/native/include -Iframeworks/native/opengl/include \
	-Iframeworks/av/include \
	-isystem bionic/libc/include -isystem bionic/libc/kernel/uapi \
	-isystem bionic/libc/kernel/uapi/asm-x86 -isystem bionic/libc/kernel/android/scsi \
	-isystem bionic/libc/kernel/android/uapi \
	-Ilibnativehelper/include_jni \
	-Wno-gcc-compat -Wall -Werror -fno-addrsig \
	-target riscv64-unknown-linux-gnu \
	-B/opt/riscv64/bin \
	-DANDROID_STRICT -D_USING_LIBCXX -std=gnu99 \
	-Werror=int-to-pointer-cast -Werror=pointer-to-int-cast \
	-Werror=address-of-temporary -Werror=return-type -Wno-tautological-constant-compare \
	-Wno-tautological-type-limit-compare -Wno-tautological-unsigned-enum-zero-compare \
	-Wno-tautological-unsigned-zero-compare -Wno-c++98-compat-extra-semi \
	-Wno-return-std-move-in-c++11

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
	-Isystem/core/include -Isystem/media/audio/include -Ihardware/libhardware/include \
	-Ihardware/libhardware_legacy/include -Ihardware/ril/include \
	-Iframeworks/native/include -Iframeworks/native/opengl/include \
	-Iframeworks/av/include \
	-isystem bionic/libc/include -isystem bionic/libc/kernel/uapi \
	-isystem bionic/libc/kernel/uapi/asm-x86 \
	-isystem bionic/libc/kernel/android/scsi \
	-isystem bionic/libc/kernel/android/uapi \
	-Ilibnativehelper/include_jni \
	-DPLATFORM_SDK_VERSION=29 \
	-target riscv64-unknown-linux-gnu \
	-B/opt/riscv64/bin \
	-D__ASSEMBLY__

SRCS_ASM = \
	bionic/libc/arch-common/bionic/crtbrand.S

SRCS_C = \
	bionic/libc/arch-riscv64/bionic/crtbegin.c

SRCS_CPP =

OBJS = $(SRCS_ASM:.S=.o)
OBJS += $(SRCS_C:.c=.o)
OBJS += $(SRCS_CPP:.cpp=.o)

DEPS = $(OBJS:.o=.o.d)

%.o : %.c
	$(RELPWD) $(CC) $(CFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/out/
	mv $@.d $(PRJPATH)/out/

%.o : %.S
	$(RELPWD) $(CC) $(AFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/out/
	mv $@.d $(PRJPATH)/out/

all : $(OBJS)
	$(CPP) -nostdlib -no-pie -Wl,-r $(OUTPUT_DIR)/crtbegin.o $(OUTPUT_DIR)/crtbrand.o -o $(OUTPUT_DIR)/crtbegin_static.o -target riscv64-unknown-linux-gnu -B/opt/riscv64/bin
	cp $(OUTPUT_DIR)/crtbegin_static.o $(OUTPUT_DIR)/Scrt1.o
	@echo DONE!

.PHONY : clean
clean:
	$(RM) $(OBJS) $(DEPS)	
