# NOTE: we only do static
PRJPATH = .

include $(PRJPATH)/build/common.mk

##################################################
# Module:  libz
# Variant: android_x86_core_static
# Type:    cc_library
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: external/zlib/Android.bp:1:1

m.libz_android_riscv64_core_static.cflags = \
	-O3 -DUSE_MMAP -DZLIB_CONST -Wall -Werror \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-fPIC

CFLAGS += \
	${g.android.soong.cc.config.ClangExternalCflags} \
	-Iexternal/zlib -Iexternal/zlib \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Ibionic/libc/include \
	-D__LIBC_API__=10000 -D__LIBM_API__=10000 -D__LIBDL_API__=10000 \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libz_android_riscv64_core_static.cflags} \
	-std=gnu99 \
	${g.android.soong.cc.config.CommonGlobalConlyflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_C = \
	external/zlib/src/adler32.c \
	external/zlib/src/compress.c \
	external/zlib/src/crc32.c \
	external/zlib/src/deflate.c \
	external/zlib/src/gzclose.c \
	external/zlib/src/gzlib.c \
	external/zlib/src/gzread.c \
	external/zlib/src/gzwrite.c \
	external/zlib/src/infback.c \
	external/zlib/src/inflate.c \
	external/zlib/src/inftrees.c \
	external/zlib/src/inffast.c \
	external/zlib/src/trees.c \
	external/zlib/src/uncompr.c \
	external/zlib/src/zutil.c

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/static ]; then mkdir -p $(LIB_DIR)/static; fi
	@echo $(OUTPUT_OBJS) >> $(LIB_DIR)/static/libz.a.rsp
	llvm-ar crsD -format=gnu $(LIB_DIR)/static/libz.a @${LIB_DIR}/static/libz.a.rsp