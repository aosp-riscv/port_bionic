# NOTE: we only do static
PRJPATH = .

include $(PRJPATH)/build/common.mk

##################################################
# Module:  libutils
# Variant: android_x86_core_static
# Type:    cc_library
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: system/core/libutils/Android.bp:121:1

m.libutils_android_riscv64_core_static.cflags = \
	-Wall -Werror -fvisibility=protected \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT -fPIC -D_USING_LIBCXX

ifeq (${CONFIG_UBSAN},y)
m.libutils_android_riscv64_core_static.cflags += \
	-fsanitize=integer -fsanitize-trap=all -ftrap-function=abort \
	-fsanitize-minimal-runtime -fno-sanitize-trap=integer,undefined \
	-fno-sanitize-recover=integer,undefined -fno-sanitize=implicit-integer-sign-change
endif

m.libutils_android_riscv64_core_static.cppflags = \
	-std=gnu++17 \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-fno-rtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}

CPPFLAGS += \
	-Isystem/core/libutils \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Isystem/core/base/include -Isystem/core/libutils/include \
	-Isystem/core/libbacktrace/include -Isystem/core/liblog/include \
	-Isystem/core/libsystem/include -Isystem/core/libcutils/include \
	-Isystem/core/libprocessgroup/include -Iexternal/libcxx/include \
	-Iexternal/libcxxabi/include -Isystem/core/libvndksupport/include \
	-Ibionic/libc/include \
	-D__LIBC_API__=10000 -D__LIBM_API__=10000 -D__LIBDL_API__=10000 \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libutils_android_riscv64_core_static.cflags} \
	${m.libutils_android_riscv64_core_static.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_CPP = \
	system/core/libutils/FileMap.cpp \
	system/core/libutils/JenkinsHash.cpp \
	system/core/libutils/NativeHandle.cpp \
	system/core/libutils/Printer.cpp \
	system/core/libutils/PropertyMap.cpp \
	system/core/libutils/RefBase.cpp \
	system/core/libutils/SharedBuffer.cpp \
	system/core/libutils/StopWatch.cpp \
	system/core/libutils/String8.cpp \
	system/core/libutils/String16.cpp \
	system/core/libutils/StrongPointer.cpp \
	system/core/libutils/SystemClock.cpp \
	system/core/libutils/Threads.cpp \
	system/core/libutils/Timers.cpp \
	system/core/libutils/Tokenizer.cpp \
	system/core/libutils/Unicode.cpp \
	system/core/libutils/VectorImpl.cpp \
	system/core/libutils/misc.cpp \
	system/core/libutils/Looper.cpp

# TBD: exclude the Trace.cpp, due to it will call 
# atrace_update_tags which is defined in libcutils, but till now
# I think it is not needed, why?
# system/core/libutils/Trace.cpp \

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/static ]; then mkdir -p $(LIB_DIR)/static; fi
	@echo $(OUTPUT_OBJS) >> $(LIB_DIR)/static/libutils.a.rsp
	llvm-ar crsD -format=gnu $(LIB_DIR)/static/libutils.a @${LIB_DIR}/static/libutils.a.rsp