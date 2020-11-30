PRJPATH = .

include $(PRJPATH)/build/common.mk

###############################################
# crtbegin_static
# Defined: bionic/libc/Android.bp:1893:1
#
# together with crtbegin_static1, which is ONLY used by crtbegin_static
# Defined: bionic/libc/Android.bp:1866:1

m.crtbegin_static1_android_x86_core.cflags = \
	-Wno-gcc-compat -Wall -Werror -fno-addrsig \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT -D_USING_LIBCXX

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
	${m.crtbegin_static1_android_riscv64_core.cflags} \
	-std=gnu99 \
	${g.android.soong.cc.config.CommonGlobalConlyflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_C = \
	bionic/libc/arch-riscv64/bionic/crtbegin.c

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@rm -f $(LIB_DIR)/crtbegin_static.o
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	$(CPP) -nostdlib -no-pie -Wl,-r \
		$(OBJ_DIR)/bionic/libc/arch-riscv64/bionic/crtbegin.o \
		$(OBJ_DIR)/bionic/libc/arch-common/bionic/crtbrand.o \
		-o $(LIB_DIR)/crtbegin_static.o -target riscv64-unknown-linux-gnu -B/opt/riscv64/bin
	@echo DONE!
