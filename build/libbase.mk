# NOTE: we only do static
PRJPATH = .

include $(PRJPATH)/build/common.mk

##################################################
# Module:  libbase
# Variant: android_x86_core_static
# Type:    cc_library
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: system/core/base/Android.bp:97:1

m.libbase_android_riscv64_core_static.cflags = \
	-Wall -Werror -Wextra -D_FILE_OFFSET_BITS=64 \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT -fPIC -D_USING_LIBCXX

ifeq (${CONFIG_UBSAN},y)
m.libbase_android_riscv64_core_static.cflags += \
	-fsanitize=integer -fsanitize-trap=all -ftrap-function=abort \
	-fsanitize-minimal-runtime -fno-sanitize-trap=integer,undefined \
	-fno-sanitize-recover=integer,undefined -fno-sanitize=implicit-integer-sign-change
endif

m.libbase_android_riscv64_core_static.cppflags = \
	-std=gnu++17 \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-Wexit-time-destructors -fno-rtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}

CPPFLAGS += \
	-Isystem/core/base \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Isystem/core/base/include -Iexternal/libcxx/include \
	-Iexternal/libcxxabi/include -Isystem/core/liblog/include \
	-Ibionic/libc/include -D__LIBC_API__=10000 -D__LIBM_API__=10000 \
	-D__LIBDL_API__=10000 \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libbase_android_riscv64_core_static.cflags} \
	${m.libbase_android_riscv64_core_static.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_CPP = \
	system/core/base/chrono_utils.cpp \
	system/core/base/cmsg.cpp \
	system/core/base/file.cpp \
	system/core/base/logging.cpp \
	system/core/base/mapped_file.cpp \
	system/core/base/parsenetaddress.cpp \
	system/core/base/properties.cpp \
	system/core/base/quick_exit.cpp \
	system/core/base/stringprintf.cpp \
	system/core/base/strings.cpp \
	system/core/base/threads.cpp \
	system/core/base/test_utils.cpp \
	system/core/base/errors_unix.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/static ]; then mkdir -p $(LIB_DIR)/static; fi
	@echo $(OUTPUT_OBJS) >> $(LIB_DIR)/static/libbase.a.rsp
	llvm-ar crsD -format=gnu $(LIB_DIR)/static/libbase.a @${LIB_DIR}/static/libbase.a.rsp