PRJPATH = .

include $(PRJPATH)/build/common.mk

m.crtend_android_android_riscv64_core.asflags = \
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
	-Iexternal/libcxx/include -Iexternal/libcxxabi/include \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.crtend_android_android_riscv64_core.asflags}

SRCS_ASM = \
	bionic/libc/arch-common/bionic/crtend.S

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@rm -f $(LIB_DIR)/crtend.o
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	cp $(OBJ_DIR)/bionic/libc/arch-common/bionic/crtend.o $(LIB_DIR)/crtend.o
	@echo DONE!

