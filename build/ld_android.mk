# NOTE: we only do dynamic, no static
PRJPATH = .

include $(PRJPATH)/build/common.mk

##################################################
# Module:  ld-android
# Variant: android_x86_core_shared
# Type:    cc_library
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: bionic/linker/Android.bp:310:1

m.ld-android_android_riscv64_core_static.cflags = \
	-Wall -Wextra -Wunused -Werror \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT -fPIC

m.ld-android_android_riscv64_core_static.cppflags = \
	-std=gnu++17 \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-fno-rtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}

CPPFLAGS += \
	-Ibionic/linker \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.ld-android_android_riscv64_core_static.cflags} \
	${m.ld-android_android_riscv64_core_static.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_CPP = \
	bionic/linker/ld_android.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/shared ]; then mkdir -p $(LIB_DIR)/shared; fi
	${CPP} \
		$(OBJ_DIR)/bionic/linker/ld_android.o \
		/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc.a \
		/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc_eh.a \
		-o $(LIB_DIR)/shared/ld-android.so \
		-nostdlib \
		-Wl,--gc-sections \
		-shared \
		-Wl,-soname,ld-android.so \
		-target riscv64-unknown-linux-gnu \
		-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
		-Wl,-z,noexecstack \
		-Wl,-z,relro \
		-Wl,-z,now \
		-Wl,--build-id=md5 \
		-Wl,--warn-shared-textrel \
		-Wl,--fatal-warnings \
		-Wl,--no-undefined-version \
		-Wl,--exclude-libs,libgcc.a \
		-fuse-ld=lld \
		-Wl,--pack-dyn-relocs=android+relr \
		-Wl,--use-android-relr-tags \
		-Wl,--no-undefined \
		-Wl,--hash-style=gnu \
		-Wl,--exclude-libs=libgcc.a \
		-Wl,--exclude-libs=libgcc_eh.a
	@echo DONE!

# prebuilts/clang/host/linux-x86/clang-r353983c1/bin/clang++ 
# @out/soong/.intermediates/bionic/linker/ld-android/android_x86_core_shared/unstripped/ld-android.so.rsp 
# prebuilts/clang/host/linux-x86/clang-r353983c1/lib64/clang/9.0.3/lib/linux/libclang_rt.builtins-i686-android.a 
# prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/x86_64-linux-android/lib/libatomic.a 
# out/soong/.intermediates/build/soong/libgcc_stripped/android_x86_core_static/libgcc_stripped.a 
# -o out/soong/.intermediates/bionic/linker/ld-android/android_x86_core_shared/unstripped/ld-android.so 
# -nostdlib 
# -Wl,--gc-sections 
# -shared 
# -Wl,-soname,ld-android.so 
# -target i686-linux-android 
# -Bprebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/x86_64-linux-android/bin 
# -Wl,-z,noexecstack 
# -Wl,-z,relro 
# -Wl,-z,now 
# -Wl,--build-id=md5 
# -Wl,--warn-shared-textrel 
# -Wl,--fatal-warnings 
# -Wl,--no-undefined-version 
# -Wl,--exclude-libs,libgcc.a 
# -Wl,--exclude-libs,libgcc_stripped.a 
# -fuse-ld=lld 
# -Wl,--pack-dyn-relocs=android+relr 
# -Wl,--use-android-relr-tags 
# -Wl,--no-undefined 
# -Wl,--hash-style=gnu 
# -Wl,--exclude-libs=libgcc.a 
# -Wl,--exclude-libs=libgcc_stripped.a 
# -Wl,--exclude-libs=libclang_rt.builtins-arm-android.a 
# -Wl,--exclude-libs=libclang_rt.builtins-aarch64-android.a 
# -Wl,--exclude-libs=libclang_rt.builtins-x86-android.a 
# -Wl,--exclude-libs=libclang_rt.builtins-x86_64-android.a 
# -Wl,--exclude-libs=libgcc_eh.a 
# -m32 
# -Wl,--version-script,bionic/linker/linker.generic.map