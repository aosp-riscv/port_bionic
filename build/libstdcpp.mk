PRJPATH = .

include $(PRJPATH)/build/common.mk

#########################################
# libstdc++
# bionic/libc/Android.bp:1715

m.libstdc___android_riscv64_core_shared.cflags = \
	-D_LIBC=1 -D__BIONIC_LP32_USE_STAT64 -Wall -Wextra -Wunused \
	-Wno-char-subscripts -Wno-deprecated-declarations \
	-Wno-gcc-compat -Wframe-larger-than=2048 -Wimplicit-fallthrough \
	-Werror=pointer-to-int-cast -Werror=int-to-pointer-cast \
	-Werror=type-limits -Werror -Wexit-time-destructors \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT -fPIC
m.libstdc___android_riscv64_core_shared.cppflags = \
	-std=gnu++17 \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-fno-rtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}

m.libstdc___android_riscv64_core_static.cflags = ${m.libstdc___android_riscv64_core_shared.cflags}
m.libstdc___android_riscv64_core_static.cppflags = ${m.libstdc___android_riscv64_core_shared.cppflags}

ifeq (${VARIANT},dynamic)
CPPFLAGS += \
    -Ibionic/libc/async_safe/include -Iexternal/jemalloc_new/include \
	-Ibionic/libstdc++/include -Ibionic/libc \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Ibionic/libc/async_safe/include \
	-Isystem/core/liblog/include \
	-Ibionic/libc/include \
	-D__LIBC_API__=10000 \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libstdc___android_riscv64_core_shared.cflags} \
	${m.libstdc___android_riscv64_core_shared.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}
endif

ifeq (${VARIANT},static)
CPPFLAGS += \
	-Ibionic/libc/async_safe/include -Iexternal/jemalloc_new/include \
	-Ibionic/libstdc++/include -Ibionic/libc \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Ibionic/libc/async_safe/include \
	-Isystem/core/liblog/include \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libstdc___android_riscv64_core_static.cflags} \
	${m.libstdc___android_riscv64_core_static.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}
endif

# TBD, in Android.bp, there is:
# static_libs: ["libasync_safe"],
# not sure if this will involve more libs?
SRCS_CPP = \
	$(SRCPATH_LIBC)/bionic/__cxa_guard.cpp \
	$(SRCPATH_LIBC)/bionic/__cxa_pure_virtual.cpp \
	$(SRCPATH_LIBC)/bionic/new.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!