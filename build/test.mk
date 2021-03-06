PRJPATH = .

include $(PRJPATH)/build/common.mk

########################################
# test
# 

m.test_android_riscv64_core.cflags = \
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
		${m.test_android_riscv64_core.cflags} \
		-std=gnu99 \
		${g.android.soong.cc.config.CommonGlobalConlyflags} \
		${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

ifeq (${EXPLICIT},yes)
CFLAGS += \
	-DDNAMIC_EXPLICIT
endif

SRCS_C = \
	build/test/hello.c

include $(PRJPATH)/build/common_rules.mk

# LDFLAGS & LIBFLAGS refer to that from mksh
# the only majpr difference is we use linker64 instead of linker
LDFLAGS = \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	${g.android.soong.cc.config.DeviceGlobalLldflags} \
	-Wl,--pack-dyn-relocs=android+relr \
	-Wl,--use-android-relr-tags \
	-Wl,--no-undefined \
	${g.android.soong.cc.config.RISCV64Lldflags} \
	${g.android.soong.cc.config.RISCV64ToolchainLdflags} \
	-pie \
	-nostdlib \
	-Bdynamic \
	-Wl,--gc-sections \
	-Wl,-z,nocopyreloc \
	-Wl,-dynamic-linker,/system/bin/linker64

# following libs are not used till now against aosp
# - libclang_rt.builtins-i686-android.a
# - libatomic.a
# - libgcc_stripped.a (replaced with libgcc.a & libgcc_eh.a)
# - libc++.so, just due to have not created it
# - libm.so, just due to have not created it
LIBFLAGS = \
	-Wl,--start-group \
	/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc.a \
	/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc_eh.a \
	$(LIB_DIR)/shared/libc.so \
	-Wl,--end-group \
	${LIB_DIR}/shared/libc.so \
	${LIB_DIR}/shared/libdl.so

ifeq (${EXPLICIT},yes)
LIBFLAGS += \
	${LIB_DIR}/shared/libdl.so
else
LIBFLAGS += \
	${LIB_DIR}/shared/libtest.so
endif


# command = ${ldCmd} ${crtBegin} @${out}.rsp ${libFlags} ${crtEnd} -o ${out} ${ldFlags}
.DEFAULT_GOAL := all
all : $(OBJS)
	@rm -f $(BIN_DIR)/unstripped/hello
	@rm -f $(BIN_DIR)/hello
	@if [ ! -e $(BIN_DIR) ]; then mkdir -p $(BIN_DIR)/unstripped; fi
	${CPP} \
		${LIB_DIR}/crtbegin_dynamic.o \
		$(OUTPUT_DIR)/obj/build/test/hello.o \
		${LIBFLAGS} \
		${LIB_DIR}/crtend.o \
		-o $(BIN_DIR)/unstripped/hello \
		${LDFLAGS}
	${STRIP} $(BIN_DIR)/unstripped/hello -o $(BIN_DIR)/hello
	@echo DONE!

