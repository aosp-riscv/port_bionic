RELPWD = PWD=/proc/self/cwd
CC = clang
CPP = clang++

################################
# commonFlags = globalFlags + systemIncludeFlags
################################

# default
CFLAGS_COMMON_GLOBAL = -DANDROID -fmessage-length=0 -W -Wall -Wno-unused \
	-Winit-self -Wpointer-arith -no-canonical-prefixes -DNDEBUG -UDEBUG \
	-fno-exceptions -Wno-multichar -O2 -g -fno-strict-aliasing

# if we build on linux
CFLAGS_COMMON_GLOBAL += -fdebug-prefix-map=/proc/self/cwd=

# compile flags for clang extra (ClangExtraCflags)
CFLAGS_COMMON_GLOBAL += -D__compiler_offsetof=__builtin_offsetof -faddrsig \
	-Wimplicit-fallthrough -Werror=int-conversion -Wno-reserved-id-macro \
	-Wno-format-pedantic -Wno-unused-command-line-argument -fcolor-diagnostics \
	-Wno-zero-as-null-pointer-constant -Wno-sign-compare \
	-Wno-defaulted-function-deleted -Wno-inconsistent-missing-override

# for device (deviceGlobalCflags)
CFLAGS_COMMON_GLOBAL += -ffunction-sections -fdata-sections -fno-short-enums \
	-funwind-tables -fstack-protector-strong -Wa,--noexecstack -D_FORTIFY_SOURCE=2 \
	-Wstrict-aliasing=2 -Werror=return-type -Werror=non-virtual-dtor -Werror=address \
	-Werror=sequence-point -Werror=date-time -Werror=format-security

# for clang extra on target (ClangExtraTargetCflags)
CFLAGS_COMMON_GLOBAL += -nostdlibinc

# include dirs
INC_COMMON_GLOBAL = -Isystem/core/include -Isystem/media/audio/include \
	-Ihardware/libhardware/include -Ihardware/libhardware_legacy/include \
	-Ihardware/ril/include -Iframeworks/native/include \
	-Iframeworks/native/opengl/include -Iframeworks/av/include

INC_COMMON_GLOBAL += -isystem bionic/libc/include -isystem bionic/libc/kernel/uapi \
	-isystem bionic/libc/kernel/uapi/asm-x86 -isystem bionic/libc/kernel/android/scsi \
	-isystem bionic/libc/kernel/android/uapi

# CommonNativehelperInclude
INC_COMMON_GLOBAL += -Ilibnativehelper/include_jni

################################
# libc level
################################
# default for libc
CFLAGS_LIBC = -D_LIBC=1 -D__BIONIC_LP32_USE_STAT64 -Wall -Wextra -Wunused \
	-Wno-char-subscripts -Wno-deprecated-declarations -Wno-gcc-compat \
	-Wframe-larger-than=2048 -Wimplicit-fallthrough -Werror=pointer-to-int-cast \
	-Werror=int-to-pointer-cast -Werror=type-limits -Werror -Wexit-time-destructors

# default include dirs
INC_LIBC = -Ibionic/libc/async_safe/include -Iexternal/jemalloc_new/include
INC_LIBC += -Ibionic/libc

###################################
# Compiler related
# target, Should be changed for RISC-V
CFLAGS_COMPILER_COMMON = -target riscv64-unknown-linux-gnu
# gcc prefix, Should be changed for RISC-V
CFLAGS_COMPILER_COMMON += -B/opt/riscv64/bin

AFLAGS_COMPILER = $(CFLAGS_COMPILER_COMMON)
AFLAGS_COMPILER += -D__ASSEMBLY__

CFLAGS_COMPILER = $(CFLAGS_COMPILER_COMMON)
CFLAGS_COMPILER += -DANDROID_STRICT
CFLAGS_COMPILER += -fPIC
CFLAGS_COMPILER += -std=gnu99

# target level, Should be changed for RISC-V
#CFLAGS_COMPILER += -msse3 -mstackrealign
#CFLAGS_COMPILER += -m32 -march=prescott

CPPFLAGS_COMPILER = $(CFLAGS_COMPILER_COMMON)
CPPFLAGS_COMPILER += -DANDROID_STRICT
CPPFLAGS_COMPILER += -fPIC
CPPFLAGS_COMPILER += -std=gnu++17
CPPFLAGS_COMPILER += -Wsign-promo \
	-D_LIBCPP_ENABLE_THREAD_SAFETY_ANNOTATIONS -Wno-thread-safety-negative \
	-Wno-gnu-include-next -fvisibility-inlines-hidden -fno-rtti

#######################################
# NoOverrideClangGlobalCflags
CFLAGS_NOOVERRIDECLANGGLOBAL += -Werror=int-to-pointer-cast -Werror=pointer-to-int-cast
CFLAGS_NOOVERRIDECLANGGLOBAL += -Werror=address-of-temporary -Werror=return-type \
	-Wno-tautological-constant-compare -Wno-tautological-type-limit-compare \
	-Wno-tautological-unsigned-enum-zero-compare -Wno-tautological-unsigned-zero-compare \
	-Wno-c++98-compat-extra-semi -Wno-return-std-move-in-c++11

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

