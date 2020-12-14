PRJPATH = .

include $(PRJPATH)/build/common.mk

##################################################
# Module:  libc++abi
# Variant: android_x86_core_static
# Type:    cc_library_static
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: external/libcxxabi/Android.bp:17:1

m.libc__abi_android_riscv64_core_static.cflags = \
	-Wall -Werror \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-fPIC

m.libc__abi_android_riscv64_core_static.cppflags = \
	-std=gnu++17 \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-std=c++14 -fexceptions \
	-Wextra -Wno-unused-function -Wno-implicit-fallthrough \
	-DLIBCXXABI_USE_LLVM_UNWINDER=0 -DHAVE___CXA_THREAD_ATEXIT_IMPL \
	-frtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}

CPPFLAGS += \
	${g.android.soong.cc.config.ClangExternalCflags} \
	-Iexternal/libcxxabi/include -Iexternal/libcxxabi/include \
	-Iexternal/libcxx/include -Iexternal/libcxxabi \
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
	${m.libc__abi_android_riscv64_core_static.cflags} \
	${m.libc__abi_android_riscv64_core_static.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_CPP = \
	external/libcxxabi/src/abort_message.cpp \
	external/libcxxabi/src/cxa_aux_runtime.cpp \
	external/libcxxabi/src/cxa_default_handlers.cpp \
	external/libcxxabi/src/cxa_demangle.cpp \
	external/libcxxabi/src/cxa_exception.cpp \
	external/libcxxabi/src/cxa_exception_storage.cpp \
	external/libcxxabi/src/cxa_guard.cpp \
	external/libcxxabi/src/cxa_handlers.cpp \
	external/libcxxabi/src/cxa_personality.cpp \
	external/libcxxabi/src/cxa_thread_atexit.cpp \
	external/libcxxabi/src/cxa_unexpected.cpp \
	external/libcxxabi/src/cxa_vector.cpp \
	external/libcxxabi/src/cxa_virtual.cpp \
	external/libcxxabi/src/fallback_malloc.cpp \
	external/libcxxabi/src/private_typeinfo.cpp \
	external/libcxxabi/src/stdlib_exception.cpp \
	external/libcxxabi/src/stdlib_new_delete.cpp \
	external/libcxxabi/src/stdlib_stdexcept.cpp \
	external/libcxxabi/src/stdlib_typeinfo.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/static ]; then mkdir -p $(LIB_DIR)/static; fi
	@echo $(OUTPUT_OBJS) >> $(LIB_DIR)/static/libc++abi.a.rsp
	llvm-ar crsD -format=gnu $(LIB_DIR)/static/libc++abi.a @${LIB_DIR}/static/libc++abi.a.rsp