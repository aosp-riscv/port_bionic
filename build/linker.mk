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
	${g.android.soong.cc.config.X86ClangCppflags}

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

.DEFAULT_GOAL := all
all : $(OBJS)
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/shared ]; then mkdir -p $(LIB_DIR)/shared; fi
	${LD} \
		out/obj/bionic/linker/linker_libc_support.o \
		out/obj/bionic/linker/dlfcn.o \
		out/obj/bionic/linker/linker.o \
		out/obj/bionic/linker/linker_block_allocator.o \
		out/obj/bionic/linker/linker_dlwarning.o \
		out/obj/bionic/linker/linker_cfi.o \
		out/obj/bionic/linker/linker_config.o \
		out/obj/bionic/linker/linker_gdb_support.o \
		out/obj/bionic/linker/linker_globals.o \
		out/obj/bionic/linker/linker_libcxx_support.o \
		out/obj/bionic/linker/linker_main.o \
		out/obj/bionic/linker/linker_namespaces.o \
		out/obj/bionic/linker/linker_logger.o \
		out/obj/bionic/linker/linker_mapped_file_fragment.o \
		out/obj/bionic/linker/linker_phdr.o \
		out/obj/bionic/linker/linker_sdk_versions.o \
		out/obj/bionic/linker/linker_soinfo.o \
		out/obj/bionic/linker/linker_tls.o \
		out/obj/bionic/linker/linker_utils.o \
		out/obj/bionic/linker/rt.o \
		out/obj/bionic/linker/arch/riscv64/begin.o \
		out/lib/static/libziparchive.a \
		out/lib/static/libutils.a \
		out/lib/static/libz.a \
		out/lib/static/liblinker_malloc.a \
		out/lib/static/libasync_safe.a \
		out/lib/static/libbase.a \
		out/lib/static/liblog.a \
		out/lib/static/libc++_static.a \
		out/lib/static/libc++abi.a \
		--start-group \
		out/lib/static/libc_nomalloc.a \
		--end-group \
		-nostdlib -shared \
		-o $(LIB_DIR)/shared/linker 
	@echo DONE!

#		out/lib/static/libdebuggerd_handler_fallback.a \
#		out/lib/static/libm.a \
