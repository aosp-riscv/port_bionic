PRJPATH = .

include $(PRJPATH)/build/common.mk

m.libpropertyinfoparser_android_riscv64_core_static.cflags = \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT \
	-fPIC

m.libpropertyinfoparser_android_riscv64_core_static.cppflags = \
	-std=gnu++2a \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-Wall -Wextra -Werror -fno-rtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}


CPPFLAGS += \
	-Isystem/core/property_service/libpropertyinfoparser/include \
	-Isystem/core/property_service/libpropertyinfoparser \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Ibionic/libc/include \
	-Ibionic/libc/kernel/uapi \
	-Ibionic/libc/kernel/android/uapi \
	-Ibionic/libc/kernel/uapi/asm-riscv64 \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libpropertyinfoparser_android_riscv64_core_static.cflags} \
	${m.libpropertyinfoparser_android_riscv64_core_static.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_CPP = \
	system/core/property_service/libpropertyinfoparser/property_info_parser.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!