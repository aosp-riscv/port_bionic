PRJPATH = .

include $(PRJPATH)/build/common.mk

#################################################
# Module:  linker
# Variant: android_x86_core
# Type:    cc_binary
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: bionic/linker/Android.bp:232:1

m.linker_android_riscv64_core.cflags = \
	-fno-stack-protector -Wstrict-overflow=5 -fvisibility=hidden -Wall -Wextra \
	-Wunused -Werror -D_USING_LIBCXX -D__work_around_b_24465209__ \
	'-DLIB_PATH="lib"' \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT \
	-fPIE

m.linker_android_riscv64_core.cppflags = \
	-std=gnu++17 \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-Wold-style-cast -DUSE_LD_CONFIG_FILE -fno-rtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}

m.linker_android_riscv64_core.asflags = \
	-fno-stack-protector \
	-Wstrict-overflow=5 -fvisibility=hidden -Wall -Wextra -Wunused -Werror \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-D__ASSEMBLY__

CFLAGS += \
	-Ibionic/libc -Ibionic/linker \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Isystem/core/debuggerd/include \
	-Isystem/core/debuggerd/common/include \
	-Ibionic/libc/async_safe/include \
	-Isystem/core/liblog/include \
	-Isystem/core/libcutils/include \
	-Isystem/core/libprocessgroup/include \
	-Isystem/core/debuggerd/libdebuggerd/include \
	-Isystem/core/debuggerd/tombstoned/include \
	-Isystem/core/base/include \
	-Isystem/core/libunwindstack/include \
	-Isystem/core/demangle/include \
	-Iart/libdexfile/external/include \
	-Iart/libdexfile \
	-Iart/libartbase \
	-Iexternal/lz4/lib \
	-Iexternal/lzma/C \
	-Iexternal/zlib \
	-Isystem/core/libziparchive/include \
	-Isystem/core/libutils/include \
	-Isystem/core/libbacktrace/include \
	-Isystem/core/libsystem/include \
	-Iexternal/libcxx/include \
	-Iexternal/libcxxabi/include \
	-Ibionic/libc/system_properties/include \
	-Isystem/core/property_service/libpropertyinfoparser/include \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.linker_android_riscv64_core.cflags} \
	-std=gnu99 \
	${g.android.soong.cc.config.CommonGlobalConlyflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

CPPFLAGS += \
	-Ibionic/libc -Ibionic/linker  \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Isystem/core/debuggerd/include \
	-Isystem/core/debuggerd/common/include \
	-Ibionic/libc/async_safe/include \
	-Isystem/core/liblog/include \
	-Isystem/core/libcutils/include \
	-Isystem/core/libprocessgroup/include \
	-Isystem/core/debuggerd/libdebuggerd/include \
	-Isystem/core/debuggerd/tombstoned/include \
	-Isystem/core/base/include \
	-Isystem/core/libunwindstack/include \
	-Isystem/core/demangle/include \
	-Iart/libdexfile/external/include \
	-Iart/libdexfile \
	-Iart/libartbase \
	-Iexternal/lz4/lib \
	-Iexternal/lzma/C \
	-Iexternal/zlib \
	-Isystem/core/libziparchive/include \
	-Isystem/core/libutils/include \
	-Isystem/core/libbacktrace/include \
	-Isystem/core/libsystem/include \
	-Iexternal/libcxx/include \
	-Iexternal/libcxxabi/include \
	-Ibionic/libc/system_properties/include \
	-Isystem/core/property_service/libpropertyinfoparser/include \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.linker_android_riscv64_core.cflags} \
	${m.linker_android_riscv64_core.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

AFLAGS += \
	-Ibionic/libc -Ibionic/linker \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Isystem/core/debuggerd/include \
	-Isystem/core/debuggerd/common/include \
	-Ibionic/libc/async_safe/include \
	-Isystem/core/liblog/include \
	-Isystem/core/libcutils/include \
	-Isystem/core/libprocessgroup/include \
	-Isystem/core/debuggerd/libdebuggerd/include \
	-Isystem/core/debuggerd/tombstoned/include \
	-Isystem/core/base/include \
	-Isystem/core/libunwindstack/include \
	-Isystem/core/demangle/include \
	-Iart/libdexfile/external/include \
	-Iart/libdexfile \
	-Iart/libartbase \
	-Iexternal/lz4/lib \
	-Iexternal/lzma/C \
	-Iexternal/zlib \
	-Isystem/core/libziparchive/include \
	-Isystem/core/libutils/include \
	-Isystem/core/libbacktrace/include \
	-Isystem/core/libsystem/include \
	-Iexternal/libcxx/include \
	-Iexternal/libcxxabi/include \
	-Ibionic/libc/system_properties/include \
	-Isystem/core/property_service/libpropertyinfoparser/include \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.linker_android_riscv64_core.asflags}

SRCS_C = \
	bionic/linker/linker_libc_support.c

SRCS_CPP = \
	bionic/linker/dlfcn.cpp \
	bionic/linker/linker.cpp \
	bionic/linker/linker_block_allocator.cpp \
	bionic/linker/linker_dlwarning.cpp \
	bionic/linker/linker_cfi.cpp \
	bionic/linker/linker_config.cpp \
	bionic/linker/linker_gdb_support.cpp \
	bionic/linker/linker_globals.cpp \
	bionic/linker/linker_libcxx_support.cpp \
	bionic/linker/linker_main.cpp \
	bionic/linker/linker_namespaces.cpp \
	bionic/linker/linker_logger.cpp \
	bionic/linker/linker_mapped_file_fragment.cpp \
	bionic/linker/linker_phdr.cpp \
	bionic/linker/linker_sdk_versions.cpp \
	bionic/linker/linker_soinfo.cpp \
	bionic/linker/linker_tls.cpp \
	bionic/linker/linker_utils.cpp \
	bionic/linker/rt.cpp

SRCS_ASM = \
	bionic/linker/arch/riscv64/begin.S

include $(PRJPATH)/build/common_rules.mk

# following flags are not included yet
#	-Wl,--version-script,bionic/linker/linker.generic.map
#	${g.android.soong.cc.config.ClangAsanLibDir}/libclang_rt.ubsan_minimal-i686-android.a
#	-Wl,--exclude-libs,libclang_rt.ubsan_minimal-i686-android.a
#
# -Bsymbolic: https://docs.oracle.com/cd/E19957-01/806-0641/chapter4-16/index.html
LDFLAGS = \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	${g.android.soong.cc.config.DeviceGlobalLldflags} \
	-Wl,--pack-dyn-relocs=android+relr \
	-Wl,--use-android-relr-tags \
	-Wl,--no-undefined \
	${g.android.soong.cc.config.RISCV64Lldflags} \
	-shared \
	-Wl,-Bsymbolic \
	-Wl,--exclude-libs,ALL \
	-Wl,-soname,ld-android.so \
	${g.android.soong.cc.config.RISCV64ToolchainLdflags} \
	-nostdlib \
	-Bstatic \
	-Wl,--gc-sections

# following are differences against current aosp
# - libdebuggerd_handler_fallback.a is not included: only see related code in
#   linker_main() and embraced with __ANDROID__, hope we don't need it in general,
#   otherwise will involve more dependencies if we need to build this lib
# - libclang_rt.builtins-i686-android.a is not included, have not investigated
#   it since it is provided by google prebuilt tools
# - libatomic.a is not included, have not investigated it since it is provided
#   by google prebuilt tools
# - libgcc_stripped currently is directly replaced with libgcc from gnu-tools
# - libc++abi.a is added, just due to we make the libc++abi.a and libc++_static.a
#   as two separated libs, aosp combined them two in one libc++_static.a
# - libgcc_eh.a is added, due to libc++ may need such functions as
#   _Unwind_Resume()/_Unwind_RaiseException()/..., tell me what are they doing?
LIBFLAGS = \
	$(LIB_DIR)/static/libm.a \
	$(LIB_DIR)/static/libziparchive.a \
	$(LIB_DIR)/static/libutils.a \
	$(LIB_DIR)/static/libz.a \
	$(LIB_DIR)/static/liblinker_malloc.a \
	$(LIB_DIR)/static/libasync_safe.a \
	$(LIB_DIR)/static/libbase.a \
	$(LIB_DIR)/static/liblog.a \
	$(LIB_DIR)/static/libc++_static.a \
	$(LIB_DIR)/static/libc++abi.a \
	-Wl,--start-group \
	$(LIB_DIR)/static/libc_nomalloc.a \
	/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc.a \
	/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc_eh.a \
	-Wl,--end-group

# command = ${ldCmd} ${crtBegin} @${out}.rsp ${libFlags} ${crtEnd} -o ${out} ${ldFlags}
.DEFAULT_GOAL := all
all : $(OBJS)
	@rm -f $(LIB_DIR)/shared/linker
	@rm -f $(LIB_DIR)/shared/linker.rsp
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/shared ]; then mkdir -p $(LIB_DIR)/shared; fi
	@echo $(OUTPUT_OBJS) > $(LIB_DIR)/shared/linker.rsp
	${CPP} @$(LIB_DIR)/shared/linker.rsp ${LIBFLAGS} -o $(LIB_DIR)/shared/linker64 ${LDFLAGS}
	@echo DONE!

