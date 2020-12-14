PRJPATH = .

include $(PRJPATH)/build/common.mk

##################################################
# Module:  libc++_static
# Variant: android_x86_core_static
# Type:    cc_library_static
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: external/libcxx/Android.bp:55:1

m.libc___static_android_riscv64_core_static.cflags = \
	-Wall -Werror -Wno-unused-parameter \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-fPIC

m.libc___static_android_riscv64_core_static.cppflags = \
	-std=gnu++17 \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-std=c++14 -nostdinc++ -fexceptions \
	-DLIBCXX_BUILDING_LIBCXXABI \
	-D_LIBCPP_BUILDING_LIBRARY \
	-frtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}


CPPFLAGS += \
	${g.android.soong.cc.config.ClangExternalCflags} \
	-Iexternal/libcxx/include -Iexternal/libcxx/include -Iexternal/libcxx \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Iexternal/libcxxabi/include -Ibionic/libc/include \
	-D__LIBC_API__=10000 -D__LIBM_API__=10000 -D__LIBDL_API__=10000 \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libc___static_android_riscv64_core_static.cflags} \
	${m.libc___static_android_riscv64_core_static.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_CPP = \
	external/libcxx/src/any.cpp \
	external/libcxx/src/algorithm.cpp \
	external/libcxx/src/bind.cpp \
	external/libcxx/src/charconv.cpp \
	external/libcxx/src/chrono.cpp \
	external/libcxx/src/condition_variable.cpp \
	external/libcxx/src/debug.cpp \
	external/libcxx/src/exception.cpp \
	external/libcxx/src/future.cpp \
	external/libcxx/src/hash.cpp \
	external/libcxx/src/ios.cpp \
	external/libcxx/src/iostream.cpp \
	external/libcxx/src/locale.cpp \
	external/libcxx/src/memory.cpp \
	external/libcxx/src/mutex.cpp \
	external/libcxx/src/new.cpp \
	external/libcxx/src/optional.cpp \
	external/libcxx/src/random.cpp \
	external/libcxx/src/regex.cpp \
	external/libcxx/src/shared_mutex.cpp \
	external/libcxx/src/stdexcept.cpp \
	external/libcxx/src/string.cpp \
	external/libcxx/src/strstream.cpp \
	external/libcxx/src/system_error.cpp \
	external/libcxx/src/thread.cpp \
	external/libcxx/src/typeinfo.cpp \
	external/libcxx/src/utility.cpp \
	external/libcxx/src/valarray.cpp \
	external/libcxx/src/variant.cpp \
	external/libcxx/src/vector.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/static ]; then mkdir -p $(LIB_DIR)/static; fi
	@echo $(OUTPUT_OBJS) >> $(LIB_DIR)/static/libc++_static.a.rsp
	llvm-ar crsD -format=gnu $(LIB_DIR)/static/libc++_static.a @${LIB_DIR}/static/libc++_static.a.rsp