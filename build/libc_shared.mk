PRJPATH = .

include $(PRJPATH)/build/common.mk

######################################
# libc shared
# Defined: bionic/libc/Android.bp:1528:1
# libc_sources_shared part defined in libc_sources_shared.mk

ALL_MODULES = \
	libc_sources_shared \
	libc_init_dynamic \
	libc_nopthread \
	libc_pthread \
	libc_bionic \
	libc_bionic_ndk \
	libsystemproperties \
	libpropertyinfoparser \
	libc_dns \
	libc_fortify \
	libc_freebsd \
	libc_freebsd_large_stack \
	libc_gdtoa \
	libc_malloc \
	libc_netbsd \
	libc_openbsd \
	libc_openbsd_large_stack \
	libc_openbsd_ndk \
	libc_stack_protector \
	libc_syscalls \
	libc_tzcode \
	libstdcpp \
	libjemalloc5

MODULES_1 = $(addprefix build/,${ALL_MODULES})
MODULES = $(addsuffix .mk,${MODULES_1})

.DEFAULT_GOAL := all
all : clean
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/shared ]; then mkdir -p $(LIB_DIR)/shared; fi
	@for m in $(MODULES); do $(MAKE) --no-print-directory -f $$m dumpobjs PATH_DUMPOBJS=$(LIB_DIR)/shared/libc.so.rsp || exit "$$?"; done
	riscv64-unknown-linux-gnu-gcc \
		@${LIB_DIR}/shared/libc.so.rsp \
		-nostdlib -Wl,--gc-sections -shared -Wl,-soname,libc.so \
		-o $(LIB_DIR)/shared/libc.so 
#	llvm-ar crsD -format=gnu $(LIB_DIR)/static/libc.a @${LIB_DIR}/static/libc.a.rsp

.PHONY : clean
clean:
	$(RM) $(LIB_DIR)/shared/libc.so
	$(RM) ${LIB_DIR}/shared/libc.so.rsp

# Following is build command for libc.so
# TBD: check it carefully and understand it
# [7869/8669] prebuilts/clang/host/linux-x86/clang-r353983c1/bin/clang++  @out/soong/.intermediates/bionic/libc/libc/android_x86_core_shared/unstripped/libc.so.rsp -Wl,--whole-archive  out/soong/.intermediates/external/jemalloc_new/libjemalloc5/android_x86_core_static/libjemalloc5.a out/soong/.intermediates/bionic/libc/libc_init_dynamic/android_x86_core_static/libc_init_dynamic.a out/soong/.intermediates/bionic/libc/libc_common_shared/android_x86_core_static/libc_common_shared.a -Wl,--no-whole-archive  out/soong/.intermediates/bionic/libdl/libdl_android/android_x86_core_static/libdl_android.a prebuilts/clang/host/linux-x86/clang-r353983c1/lib64/clang/9.0.3/lib/linux/libclang_rt.builtins-i686-android.a prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/x86_64-linux-android/lib/libatomic.a out/soong/.intermediates/build/soong/libgcc_stripped/android_x86_core_static/libgcc_stripped.a out/soong/.intermediates/bionic/linker/ld-android/android_x86_core_shared/ld-android.so out/soong/.intermediates/bionic/libdl/libdl/android_x86_core_shared_10000/libdl.so  -o out/soong/.intermediates/bionic/libc/libc/android_x86_core_shared/unstripped/libc.so -nostdlib -Wl,--gc-sections -shared -Wl,-soname,libc.so -target i686-linux-android -Bprebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/x86_64-linux-android/bin -Wl,-z,noexecstack -Wl,-z,relro -Wl,-z,now -Wl,--build-id=md5 -Wl,--warn-shared-textrel -Wl,--fatal-warnings -Wl,--no-undefined-version -Wl,--exclude-libs,libgcc.a -Wl,--exclude-libs,libgcc_stripped.a -fuse-ld=lld -Wl,--pack-dyn-relocs=none -Wl,--no-undefined -Wl,--hash-style=gnu -Wl,-z,muldefs -Wl,--hash-style=both -m32 -Wl,--version-script,out/soong/.intermediates/bionic/libc/libc.x86.map/gen/libc.x86.map -Wl,--symbol-ordering-file,bionic/libc/symbol_ordering
