PRJPATH = .

include $(PRJPATH)/build/common.mk

######################################
# libc_sources_shared
# Defined: bionic/libc/Android.bp:1528:1

m.libc_android_riscv64_core_shared.cflags = \
	-D_LIBC=1 -D__BIONIC_LP32_USE_STAT64 \
	-Wall -Wextra -Wunused -Wno-char-subscripts -Wno-deprecated-declarations \
	-Wno-gcc-compat -Wframe-larger-than=2048 -Wimplicit-fallthrough \
	-Werror=pointer-to-int-cast -Werror=int-to-pointer-cast -Werror=type-limits \
	-Werror -Wexit-time-destructors \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT -fPIC
m.libc_android_riscv64_core_shared.cppflags = \
	-std=gnu++17 \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-fno-rtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}
m.libc_android_riscv64_core_shared.asflags = \
	-D_LIBC=1 -D__BIONIC_LP32_USE_STAT64 \
	-Wall -Wextra -Wunused -Wno-char-subscripts -Wno-deprecated-declarations \
	-Wno-gcc-compat -Wframe-larger-than=2048 -Wimplicit-fallthrough \
	-Werror=pointer-to-int-cast -Werror=int-to-pointer-cast -Werror=type-limits \
	-Werror -Wexit-time-destructors \
	-DPLATFORM_SDK_VERSION=29 \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-D__ASSEMBLY__

CFLAGS += \
	-Ibionic/libc/include -Ibionic/libc/async_safe/include \
	-Iexternal/jemalloc_new/include -Ibionic/libc \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Ibionic/libc/system_properties/include \
	-Isystem/core/property_service/libpropertyinfoparser/include \
	-D__LIBDL_API__=10000 \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libc_android_riscv64_core_shared.cflags} \
	-std=gnu99 \
	${g.android.soong.cc.config.CommonGlobalConlyflags} \
	-std=gnu99 \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

AFLAGS += \
	-Ibionic/libc/include -Ibionic/libc/async_safe/include \
	-Iexternal/jemalloc_new/include -Ibionic/libc \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Ibionic/libc/system_properties/include \
	-Isystem/core/property_service/libpropertyinfoparser/include \
	-D__LIBDL_API__=10000 \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libc_android_riscv64_core_shared.asflags}

CPPFLAGS += \
	-Ibionic/libc/include -Ibionic/libc/async_safe/include \
	-Iexternal/jemalloc_new/include -Ibionic/libc \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Ibionic/libc/system_properties/include \
	-Isystem/core/property_service/libpropertyinfoparser/include \
	-D__LIBDL_API__=10000 \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libc_android_riscv64_core_shared.cflags} \
	${m.libc_android_riscv64_core_shared.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}


# libc_sources_shared
SRCS_ASM = \
	bionic/libc/arch-common/bionic/crtbrand.S \
	bionic/libc/arch-common/bionic/crtend_so.S

SRCS_C = \
	bionic/libc/arch-common/bionic/crtbegin_so.c

SRCS_CPP = \
	bionic/libc/bionic/icu.cpp \
	bionic/libc/bionic/malloc_common.cpp \
	bionic/libc/bionic/malloc_common_dynamic.cpp \
	bionic/libc/bionic/malloc_heapprofd.cpp \
	bionic/libc/bionic/malloc_limit.cpp \
	bionic/libc/bionic/NetdClient.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!