PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

##################################################
# libsystemproperties
# Defined: bionic/libc/system_properties/Android.bp:1:1

m.libsystemproperties_android_riscv64_core_static.cflags = \
	-D_LIBC=1 -D__BIONIC_LP32_USE_STAT64 -Wall -Wextra \
	-Wunused -Wno-char-subscripts -Wno-deprecated-declarations -Wno-gcc-compat \
	-Wframe-larger-than=2048 -Wimplicit-fallthrough -Werror=pointer-to-int-cast \
	-Werror=int-to-pointer-cast -Werror=type-limits -Werror \
	-Wexit-time-destructors \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT -fPIC
m.libsystemproperties_android_riscv64_core_static.cppflags = \
	-std=gnu++17 \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-fno-rtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}

CPPFLAGS += \
	-Ibionic/libc/system_properties/include -Ibionic/libc/async_safe/include \
	-Iexternal/jemalloc_new/include -Ibionic/libc -Ibionic/libstdc++/include \
	-Ibionic/libc/system_properties \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Ibionic/libc/async_safe/include \
	-Isystem/core/property_service/libpropertyinfoparser/include \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libsystemproperties_android_riscv64_core_static.cflags} \
	${m.libsystemproperties_android_riscv64_core_static.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_CPP = \
	bionic/libc/system_properties/context_node.cpp \
	bionic/libc/system_properties/contexts_split.cpp \
	bionic/libc/system_properties/contexts_serialized.cpp \
	bionic/libc/system_properties/prop_area.cpp \
	bionic/libc/system_properties/prop_info.cpp \
	bionic/libc/system_properties/system_properties.cpp

PATH_DUMPOBJS=out/lib/static/libc.a.rsp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!