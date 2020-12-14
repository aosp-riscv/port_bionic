PRJPATH = .

include $(PRJPATH)/build/common.mk

##################################################
# Module:  liblinker_malloc
# Variant: android_x86_core_static
# Type:    cc_library_static
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: bionic/linker/Android.bp:1:1

m.liblinker_malloc_android_riscv64_core_static.cflags = \
	-Wall -Werror \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT -fPIC -D_USING_LIBCXX

m.liblinker_malloc_android_riscv64_core_static.cppflags = \
	-std=gnu++17 \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-fno-rtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}

CPPFLAGS += \
	-Ibionic/libc -Ibionic/linker \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Ibionic/libc/async_safe/include -Isystem/core/liblog/include \
	-Isystem/core/base/include -Iexternal/libcxx/include \
	-Iexternal/libcxxabi/include -Ibionic/libc/include \
	-D__LIBC_API__=10000 -D__LIBM_API__=10000 -D__LIBDL_API__=10000 \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.liblinker_malloc_android_riscv64_core_static.cflags} \
	${m.liblinker_malloc_android_riscv64_core_static.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_CPP = \
	bionic/linker/linker_memory.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/static ]; then mkdir -p $(LIB_DIR)/static; fi
	@echo $(OUTPUT_OBJS) >> $(LIB_DIR)/static/liblinker_malloc.a.rsp
	llvm-ar crsD -format=gnu $(LIB_DIR)/static/liblinker_malloc.a @${LIB_DIR}/static/liblinker_malloc.a.rsp