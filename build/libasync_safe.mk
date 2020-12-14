PRJPATH = .

include $(PRJPATH)/build/common.mk

##################################################
# Module:  libasync_safe
# Variant: android_x86_core_static
# Type:    cc_library_static
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: bionic/libc/async_safe/Android.bp:4:1

m.libasync_safe_android_riscv64_core_static.cflags = \
	-D_LIBC=1 -D__BIONIC_LP32_USE_STAT64 \
	-Wall -Wextra -Wunused -Wno-char-subscripts -Wno-deprecated-declarations \
	-Wno-gcc-compat -Wframe-larger-than=2048 -Wimplicit-fallthrough \
	-Werror=pointer-to-int-cast -Werror=int-to-pointer-cast -Werror=type-limits \
	-Werror -Wexit-time-destructors \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT -fPIC

m.libasync_safe_android_riscv64_core_static.cppflags = \
	-std=gnu++17 \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-fno-rtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}

CPPFLAGS += \
	-Ibionic/libc/async_safe/include -Ibionic/libc/async_safe/include \
	-Iexternal/jemalloc_new/include -Ibionic/libc -Ibionic/libc/async_safe \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Ibionic/libc/include -Ibionic/libc/kernel/uapi \
	-Ibionic/libc/kernel/android/uapi \
	-Ibionic/libc/kernel/uapi/asm-riscv \
	-Isystem/core/liblog/include \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libasync_safe_android_riscv64_core_static.cflags} \
	${m.libasync_safe_android_riscv64_core_static.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_CPP = \
	bionic/libc/async_safe/async_safe_log.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/static ]; then mkdir -p $(LIB_DIR)/static; fi
	@echo $(OUTPUT_OBJS) >> $(LIB_DIR)/static/libasync_safe.a.rsp
	llvm-ar crsD -format=gnu $(LIB_DIR)/static/libasync_safe.a @${LIB_DIR}/static/libasync_safe.a.rsp