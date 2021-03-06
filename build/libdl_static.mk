PRJPATH = .

include $(PRJPATH)/build/common.mk

##################################################
# Module:  libdl_static
# Variant: android_x86_core_static
# Type:    cc_library_static
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: bionic/libdl/Android.bp:4:1

m.libdl_static_android_riscv64_core_static.cflags = \
	-Wall -Wextra -Wunused -Werror \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT -fPIC

m.libdl_static_android_riscv64_core_static.cppflags = \
	-std=gnu++17 \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-fno-rtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}

CPPFLAGS += \
	-Ibionic/libc -Ibionic/libdl \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libdl_static_android_riscv64_core_static.cflags} \
	${m.libdl_static_android_riscv64_core_static.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_CPP = \
	bionic/libdl/libdl.cpp \
	bionic/libdl/libdl_cfi.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : clean $(OBJS)
	@rm -rf ${LIB_DIR}/static/libdl_static.a
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/static ]; then mkdir -p $(LIB_DIR)/static; fi
	llvm-ar crsD -format=gnu ${LIB_DIR}/static/libdl_static.a \
		${OBJ_DIR}/bionic/libdl/libdl.o \
		${OBJ_DIR}/bionic/libdl/libdl_cfi.o
	@echo DONE!


