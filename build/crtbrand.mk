PRJPATH = .

include $(PRJPATH)/build/common.mk

#########################################
# crtbrand
# Defined: bionic/libc/Android.bp:1826:1

m.crtbrand_android_riscv64_core.asflags = \
	-DPLATFORM_SDK_VERSION=29 \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-D__ASSEMBLY__

AFLAGS += \
	-Ibionic/libc/include -Ibionic/libc \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.crtbrand_android_riscv64_core.asflags}

SRCS_ASM = \
	bionic/libc/arch-common/bionic/crtbrand.S

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!

