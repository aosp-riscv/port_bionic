PRJPATH = .

include $(PRJPATH)/build/common.mk

########################################
# test
# 

m.libtest_android_riscv64_core.cflags = \
	-Wall -Werror -Wno-deprecated-declarations -fno-asynchronous-unwind-tables \
	-fno-strict-aliasing -fwrapv \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-fPIE -D_USING_LIBCXX

CFLAGS += \
	    ${g.android.soong.cc.config.ClangExternalCflags} \
		${g.android.soong.cc.config.RISCV64ClangCflags} \
		${g.android.soong.cc.config.CommonClangGlobalCflags} \
		${g.android.soong.cc.config.DeviceClangGlobalCflags} \
		${g.android.soong.cc.config.RISCV64ToolchainCflags} \
		${g.android.soong.cc.config.RISCV64VariantClangCflags} \
		-Iexternal/libcxx/include -Iexternal/libcxxabi/include \
		-Ibionic/libc/include -D__LIBC_API__=10000 \
		-D__LIBM_API__=10000 -D__LIBDL_API__=10000 \
		${g.android.soong.cc.config.CommonGlobalIncludes} \
		${g.android.soong.cc.config.RISCV64IncludeFlags} \
		${g.android.soong.cc.config.CommonNativehelperInclude} \
		${m.libtest_android_riscv64_core.cflags} \
		-std=gnu99 \
		${g.android.soong.cc.config.CommonGlobalConlyflags} \
		${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_C = \
	build/test/libtest.c

include $(PRJPATH)/build/common_rules.mk

LDFLAGS = \
	-nostdlib \
	-Wl,--gc-sections \
	-shared \
	-Wl,-soname,libtest.so \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	${g.android.soong.cc.config.DeviceGlobalLldflags} \
	-Wl,--pack-dyn-relocs=none \
	-Wl,--no-undefined \
	${g.android.soong.cc.config.RISCV64Lldflags} \
	-Wl,-z,muldefs \
	-Wl,--hash-style=both \
	${g.android.soong.cc.config.RISCV64ToolchainLdflags}

LIBFLAGS = \
	/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc.a \
	/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc_eh.a \
	$(LIB_DIR)/shared/libc.so

.DEFAULT_GOAL := all
all : $(OBJS)
	@rm -f $(LIB_DIR)/shared/libtest.so
	@if [ ! -e $(LIB_DIR)/shared ]; then mkdir -p $(LIB_DIR)/shared; fi
	${CPP} \
		$(OUTPUT_DIR)/obj/build/test/libtest.o \
		${LIBFLAGS} \
		-o $(LIB_DIR)/shared/libtest.so \
		${LDFLAGS}

