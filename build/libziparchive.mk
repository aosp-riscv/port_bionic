# NOTE: we only do static
PRJPATH = .

include $(PRJPATH)/build/common.mk

##################################################
# Module:  libziparchive
# Variant: android_riscv64_core_static
# Type:    cc_library
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: system/core/libziparchive/Android.bp:80:1

m.libziparchive_android_riscv64_core_static.cflags = \
	-DZLIB_CONST -Werror -Wall -D_FILE_OFFSET_BITS=64 \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT -fPIC -D_USING_LIBCXX \
	-fsanitize=signed-integer-overflow,unsigned-integer-overflow,shift,integer-divide-by-zero,implicit-signed-integer-truncation \
	-fsanitize-trap=all -ftrap-function=abort -fsanitize-minimal-runtime \
	-fno-sanitize-trap=integer,undefined \
	-fno-sanitize-recover=integer,undefined \
	-fno-sanitize=implicit-integer-sign-change

m.libziparchive_android_riscv64_core_static.cppflags = \
	-std=gnu++17 \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-Wno-missing-field-initializers -fno-rtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}


CPPFLAGS += \
	-Isystem/core/libziparchive/include -Isystem/core/libziparchive \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Iexternal/libcxx/include -Iexternal/libcxxabi/include \
	-Isystem/core/liblog/include \
	-Isystem/core/base/include -Iexternal/zlib -Ibionic/libc/include \
	-D__LIBC_API__=10000 -D__LIBM_API__=10000 -D__LIBDL_API__=10000 \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libziparchive_android_riscv64_core_static.cflags} \
	${m.libziparchive_android_riscv64_core_static.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_CC = \
	system/core/libziparchive/zip_archive.cc \
	system/core/libziparchive/zip_archive_stream_entry.cc \
	system/core/libziparchive/zip_writer.cc

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/static ]; then mkdir -p $(LIB_DIR)/static; fi
	@echo $(OUTPUT_OBJS) >> $(LIB_DIR)/static/libziparchive.a.rsp
	llvm-ar crsD -format=gnu $(LIB_DIR)/static/libziparchive.a @${LIB_DIR}/static/libziparchive.a.rsp