PRJPATH = .

include $(PRJPATH)/build/common.mk

m.libc_android_riscv64_core_common.cflags = \
	-D_LIBC=1 -D__BIONIC_LP32_USE_STAT64 -Wall -Wextra \
	-Wunused -Wno-char-subscripts -Wno-deprecated-declarations \
	-Wno-gcc-compat -Wframe-larger-than=2048 -Wimplicit-fallthrough \
	-Werror=pointer-to-int-cast -Werror=int-to-pointer-cast \
	-Werror=type-limits -Werror -Wexit-time-destructors \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT -fPIC

m.libc_android_riscv64_core_common.cppflags = \
	-std=gnu++17 \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-fno-rtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}

m.libc_android_riscv64_core_common.asflags = \
	-D_LIBC=1 -D__BIONIC_LP32_USE_STAT64 \
	-Wall -Wextra -Wunused -Wno-char-subscripts -Wno-deprecated-declarations \
	-Wno-gcc-compat -Wframe-larger-than=2048 -Wimplicit-fallthrough \
	-Werror=pointer-to-int-cast -Werror=int-to-pointer-cast -Werror=type-limits \
	-Werror -Wexit-time-destructors \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-D__ASSEMBLY__

CFLAGS += \
    -Ibionic/libc/async_safe/include -Iexternal/jemalloc_new/include -Ibionic/libc \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libc_android_riscv64_core_common.cflags} \
	-std=gnu99 \
	${g.android.soong.cc.config.CommonGlobalConlyflags} \
	-std=gnu99 \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

CPPFLAGS += \
	-Ibionic/libc/async_safe/include -Iexternal/jemalloc_new/include -Ibionic/libc \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libc_android_riscv64_core_common.cflags} \
	${m.libc_android_riscv64_core_common.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

AFLAGS += \
	-Ibionic/libc/async_safe/include -Iexternal/jemalloc_new/include -Ibionic/libc \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libc_android_riscv64_core_common.asflags}
    