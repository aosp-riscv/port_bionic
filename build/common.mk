g.android.soong.cc.config.RISCV64GccRoot = /opt

g.android.soong.cc.config.ClangBin = /home/u/ws/llvm-project/install/bin

g.android.soong.cc.config.RISCV64ClangCflags = -mno-relax

g.android.soong.cc.config.RISCV64ClangCppflags = 

g.android.soong.cc.config.ClangExtraCflags = \
	-D__compiler_offsetof=__builtin_offsetof -faddrsig -Wimplicit-fallthrough \
	-Werror=int-conversion -Wno-reserved-id-macro -Wno-format-pedantic \
	-Wno-unused-command-line-argument -fcolor-diagnostics \
	-Wno-zero-as-null-pointer-constant -Wno-sign-compare \
	-Wno-defaulted-function-deleted -Wno-inconsistent-missing-override

g.android.soong.cc.config.ClangExtraCppflags = \
	-D_LIBCPP_ENABLE_THREAD_SAFETY_ANNOTATIONS \
	-Wno-thread-safety-negative -Wno-gnu-include-next

g.android.soong.cc.config.CommonClangGlobalCflags = \
	-DANDROID -fmessage-length=0 -W -Wall -Wno-unused -Winit-self \
	-Wpointer-arith -no-canonical-prefixes -DNDEBUG -UDEBUG -fno-exceptions \
	-Wno-multichar -O2 -g -fno-strict-aliasing \
	-fdebug-prefix-map=/proc/self/cwd= ${g.android.soong.cc.config.ClangExtraCflags} \

g.android.soong.cc.config.CommonClangGlobalCppflags = \
	-Wsign-promo \
	${g.android.soong.cc.config.ClangExtraCppflags}

g.android.soong.cc.config.ClangExtraTargetCflags = -nostdlibinc

g.android.soong.cc.config.DeviceClangGlobalCflags = \
	-ffunction-sections -fdata-sections -fno-short-enums -funwind-tables \
	-fstack-protector-strong -Wa,--noexecstack -D_FORTIFY_SOURCE=2 \
	-Wstrict-aliasing=2 -Werror=return-type -Werror=non-virtual-dtor \
	-Werror=address -Werror=sequence-point -Werror=date-time \
	-Werror=format-security ${g.android.soong.cc.config.ClangExtraTargetCflags}

g.android.soong.cc.config.DeviceGlobalCppflags = \
	-fvisibility-inlines-hidden

g.android.soong.cc.config.RISCV64ToolchainCflags =

g.android.soong.cc.config.RISCV64ToolchainLdflags =

g.android.soong.cc.config.RISCV64VariantClangCflags =

g.android.soong.cc.config.CommonGlobalIncludes = \
	-Isystem/core/include -Isystem/media/audio/include -Ihardware/libhardware/include \
	-Ihardware/libhardware_legacy/include -Ihardware/ril/include \
	-Iframeworks/native/include -Iframeworks/native/opengl/include -Iframeworks/av/include

g.android.soong.cc.config.RISCV64IncludeFlags = \
	-isystem bionic/libc/include \
	-isystem bionic/libc/kernel/uapi \
	-isystem bionic/libc/kernel/uapi/asm-riscv \
	-isystem bionic/libc/kernel/android/scsi \
	-isystem bionic/libc/kernel/android/uapi

g.android.soong.cc.config.RISCV64Lldflags = \
	-Wl,--hash-style=gnu

g.android.soong.cc.config.CommonNativehelperInclude = \
	-Ilibnativehelper/include_jni

g.android.soong.cc.config.CommonGlobalConlyflags = 

g.android.soong.cc.config.ClangExtraNoOverrideCflags = \
	-Werror=address-of-temporary -Werror=return-type \
	-Wno-tautological-constant-compare -Wno-tautological-type-limit-compare \
	-Wno-tautological-unsigned-enum-zero-compare \
	-Wno-tautological-unsigned-zero-compare -Wno-c++98-compat-extra-semi \
	-Wno-return-std-move-in-c++11

g.android.soong.cc.config.NoOverrideClangGlobalCflags = \
	-Werror=int-to-pointer-cast -Werror=pointer-to-int-cast \
	${g.android.soong.cc.config.ClangExtraNoOverrideCflags}


# TBD:
# - currently still use libgcc.a from gcc, but seems aosp use it's self
#   prebuilt libgcc.a
# - have not involved libgcc_stripped.a, just keep the exclude-libs for it, I
#   hope it does nothing impact
g.android.soong.cc.config.DeviceGlobalLldflags = \
	-Wl,-z,noexecstack \
	-Wl,-z,relro \
	-Wl,-z,now \
	-Wl,--build-id=md5 \
	-Wl,--warn-shared-textrel \
	-Wl,--fatal-warnings \
	-Wl,--no-undefined-version \
	-Wl,--exclude-libs,libgcc.a \
	-Wl,--exclude-libs,libgcc_stripped.a \
	-fuse-ld=lld

OUTPUT_DIR = out

CPPFLAGS = -c
CFLAGS = -c
AFLAGS = -c

###############################################
# source paths
SRCPATH_LIBC = bionic/libc
SRCPATH_LIBC_OPENBSD = $(SRCPATH_LIBC)/upstream-openbsd
SRCPATH_LIBC_NETBSD = $(SRCPATH_LIBC)/upstream-netbsd
SRCPATH_LIBC_FREEBSD = $(SRCPATH_LIBC)/upstream-freebsd
SRCPATH_LIBC_GDTOA = $(SRCPATH_LIBC_OPENBSD)/lib/libc/gdtoa
SRCPATH_LIBC_BIONIC = $(SRCPATH_LIBC)/bionic
SRCPATH_LIBC_DNS = $(SRCPATH_LIBC)/dns

OUTPUT_DIR = out
OBJ_DIR = $(OUTPUT_DIR)/obj
LIB_DIR = $(OUTPUT_DIR)/lib
BIN_DIR = $(OUTPUT_DIR)/bin

RELPWD = PWD=/proc/self/cwd
CC = ${g.android.soong.cc.config.ClangBin}/clang
CPP = ${g.android.soong.cc.config.ClangBin}/clang++
LD = /opt/riscv64/bin/riscv64-unknown-linux-gnu-ld
STRIP = /opt/riscv64/bin/riscv64-unknown-linux-gnu-strip

# UBSAN stands for "The Undefined Behavior Sanitizer".
# Those ubsan_handler_xxx() are implemented in libclang_rt.ubsan_minimal-i686-android.a.
# We have not ported this lib and exclude it when linking for bionic/linker.
CONFIG_UBSAN = n
