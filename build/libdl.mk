# NOTE: we only do dynamic, no static
PRJPATH = .

include $(PRJPATH)/build/common.mk

##################################################
# Module:  libdl
# Variant: android_x86_core_shared
# Type:    cc_library
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: bionic/libdl/Android.bp:32:1

.DEFAULT_GOAL := all
all : 
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/shared ]; then mkdir -p $(LIB_DIR)/shared; fi
	${CPP} \
		-Wl,--whole-archive \
		$(LIB_DIR)/static/libdl_static.a \
		-Wl,--no-whole-archive \
		/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc.a \
		/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc_eh.a \
		$(LIB_DIR)/shared/ld-android.so \
		-o $(LIB_DIR)/shared/libdl.so \
		-nostdlib \
		-Wl,--gc-sections \
		-shared \
		-Wl,-soname,libdl.so \
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
		-Wl,--pack-dyn-relocs=none \
		-Wl,--no-undefined \
		-Wl,--hash-style=gnu \
		-Wl,--exclude-libs=libgcc.a \
		-Wl,--exclude-libs=libgcc_eh.a \
		-Wl,--hash-style=both 
	@echo DONE!

# prebuilts/clang/host/linux-x86/clang-r353983c1/bin/clang++  
# @out/soong/.intermediates/bionic/libdl/libdl/android_x86_core_shared/unstripped/libdl.so.rsp 
# -Wl,--whole-archive 
# out/soong/.intermediates/bionic/libdl/libdl_static/android_x86_core_static/libdl_static.a 
# -Wl,--no-whole-archive  
# prebuilts/clang/host/linux-x86/clang-r353983c1/lib64/clang/9.0.3/lib/linux/libclang_rt.builtins-i686-android.a 
# prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/x86_64-linux-android/lib/libatomic.a 
# out/soong/.intermediates/build/soong/libgcc_stripped/android_x86_core_static/libgcc_stripped.a 
# out/soong/.intermediates/bionic/linker/ld-android/android_x86_core_shared/ld-android.so  
# -o out/soong/.intermediates/bionic/libdl/libdl/android_x86_core_shared/unstripped/libdl.so 
# -nostdlib 
# -Wl,--gc-sections 
# -shared 
# -Wl,-soname,libdl.so 
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
# -Wl,--pack-dyn-relocs=none 
# -Wl,--no-undefined 
# -Wl,--hash-style=gnu 
# -Wl,--exclude-libs=libgcc.a 
# -Wl,--exclude-libs=libgcc_stripped.a 
# -Wl,--exclude-libs=libclang_rt.builtins-arm-android.a 
# -Wl,--exclude-libs=libclang_rt.builtins-aarch64-android.a 
# -Wl,--exclude-libs=libclang_rt.builtins-x86-android.a 
# -Wl,--exclude-libs=libclang_rt.builtins-x86_64-android.a 
# -Wl,--exclude-libs=libgcc_eh.a 
# -Wl,--hash-style=both 
# -m32 
# -Wl,--version-script,out/soong/.intermediates/bionic/libdl/libdl.x86.map/gen/libdl.x86.map
