PRJPATH = .

include $(PRJPATH)/build/common.mk

###############################################
# Module:  crtbegin_dynamic
# Variant: android_arm64_armv8-a_core
# Type:    cc_object
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: bionic/libc/Android.bp:1929:1
#
# Module:  crtbegin_dynamic1
# Variant: android_x86_core
# Type:    cc_object
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: bionic/libc/Android.bp:1903:1

# Notice, we have to add -fPIC to create the crtbegin
# otherwise lld will create a strange relocation entry
# in the final executable with the Sym. Name as a digital 
# number, and this will crash the executable
# But interesting is in AOSP(of course it's for arch other
# than RISC-V), there is no -fPIC, am I right?
m.crtbegin_dynamic1_android_riscv64_core.cflags = \
	-Wno-gcc-compat -Wall -Werror -fno-addrsig \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT -D_USING_LIBCXX \
	-fPIC

CFLAGS += \
	-Ibionic/libc/include -Ibionic/libc \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Iexternal/libcxx/include -Iexternal/libcxxabi/include \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.crtbegin_dynamic1_android_riscv64_core.cflags} \
	-std=gnu99 \
	${g.android.soong.cc.config.CommonGlobalConlyflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_C = \
	bionic/libc/arch-riscv64/bionic/crtbegin.c

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@rm -f $(LIB_DIR)/crtbegin_dynamic.o
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	$(CPP) -nostdlib -no-pie -Wl,-r \
		$(OBJ_DIR)/bionic/libc/arch-riscv64/bionic/crtbegin.o \
		$(OBJ_DIR)/bionic/libc/arch-common/bionic/crtbrand.o \
		-o $(LIB_DIR)/crtbegin_dynamic.o -target riscv64-unknown-linux-gnu -B/opt/riscv64/bin
	@echo DONE!
