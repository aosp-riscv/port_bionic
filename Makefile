RELPWD = PWD=/proc/self/cwd
CC = ../../llvm-project/install/bin/clang
CPP = ../../llvm-project/install/bin/clang++

################################
# common global
################################

# default
CFLAGS_COMMON_GLOBAL = -DANDROID -fmessage-length=0 -W -Wall -Wno-unused -Winit-self -Wpointer-arith -no-canonical-prefixes -DNDEBUG -UDEBUG -fno-exceptions -Wno-multichar -O2 -g -fno-strict-aliasing

# if we build on linux
CFLAGS_COMMON_GLOBAL += -fdebug-prefix-map=/proc/self/cwd=

# compile flags for clang extra (ClangExtraCflags)
CFLAGS_COMMON_GLOBAL += -D__compiler_offsetof=__builtin_offsetof -faddrsig -Wimplicit-fallthrough -Werror=int-conversion -Wno-reserved-id-macro -Wno-format-pedantic -Wno-unused-command-line-argument -fcolor-diagnostics -Wno-zero-as-null-pointer-constant -Wno-sign-compare -Wno-defaulted-function-deleted -Wno-inconsistent-missing-override

# for device (deviceGlobalCflags)
CFLAGS_COMMON_GLOBAL += -ffunction-sections -fdata-sections -fno-short-enums -funwind-tables -fstack-protector-strong -Wa,--noexecstack -D_FORTIFY_SOURCE=2 -Wstrict-aliasing=2 -Werror=return-type -Werror=non-virtual-dtor -Werror=address -Werror=sequence-point -Werror=date-time -Werror=format-security

# for clang extra on target (ClangExtraTargetCflags)
CFLAGS_COMMON_GLOBAL += -nostdlibinc


CPPFLAGS_COMMON_GLOBAL = $(CFLAGS_COMMON_GLOBAL) \
			-Wsign-promo \
			-D_LIBCPP_ENABLE_THREAD_SAFETY_ANNOTATIONS -Wno-thread-safety-negative -Wno-gnu-include-next \
			-fvisibility-inlines-hidden

# include dirs
INC_COMMON_GLOBAL = -Isystem/core/include -Isystem/media/audio/include -Ihardware/libhardware/include -Ihardware/libhardware_legacy/include -Ihardware/ril/include -Iframeworks/native/include -Iframeworks/native/opengl/include -Iframeworks/av/include

################################
# libc level
################################
# default for libc
CFLAGS_LIBC = -D_LIBC=1 -D__BIONIC_LP32_USE_STAT64 -Wall -Wextra -Wunused -Wno-char-subscripts -Wno-deprecated-declarations -Wno-gcc-compat -Wframe-larger-than=2048 -Wimplicit-fallthrough -Werror=pointer-to-int-cast -Werror=int-to-pointer-cast -Werror=type-limits -Werror -Wexit-time-destructors

# target arch
CFLAGS_LIBC += -isystem bionic/libc/include -isystem bionic/libc/kernel/uapi -isystem bionic/libc/kernel/uapi/asm-x86 -isystem bionic/libc/kernel/android/scsi -isystem bionic/libc/kernel/android/uapi

# CommonNativehelperInclude
CFLAGS_LIBC += -Ilibnativehelper/include_jni

# default include dirs
INC_LIBC = -Ibionic/libc/async_safe/include -Iexternal/jemalloc_new/include 
INC_LIBC += -Ibionic/libc


###################################
# Compiler related
# target, Should be changed for RISC-V
CFLAGS_COMPILER = -target riscv64-unknown-linux-gnu
# gcc prefix, Should be changed for RISC-V
CFLAGS_COMPILER += -B/opt/riscv64/bin

CFLAGS_COMPILER += -DANDROID_STRICT 
CFLAGS_COMPILER += -fPIC

# target level, Should be changed for RISC-V
#CFLAGS_COMPILER += -msse3 -mstackrealign
#CFLAGS_COMPILER += -m32 -march=prescott

# NoOverrideClangGlobalCflags
CFLAGS_COMPILER += -Werror=int-to-pointer-cast -Werror=pointer-to-int-cast
CFLAGS_COMPILER += -Werror=address-of-temporary -Werror=return-type -Wno-tautological-constant-compare -Wno-tautological-type-limit-compare -Wno-tautological-unsigned-enum-zero-compare -Wno-tautological-unsigned-zero-compare -Wno-c++98-compat-extra-semi -Wno-return-std-move-in-c++11


CPPFLAGS_COMPILER = $(CFLAGS_COMPILER)

CFLAGS_COMPILER += -std=gnu99

CPPFLAGS_COMPILER += -std=gnu++17 -fno-rtti

#########################################
# constrct cflags for libc_gdtoa

# gotoa level cflags
CFLAGS_LIBC_GDTOA = -Wno-sign-compare -include openbsd-compat.h

INC_LIBC_GDTOA = -Ibionic/libc/private -Ibionic/libc/upstream-openbsd/android/include -Ibionic/libc/upstream-openbsd/lib/libc/include
INC_LIBC_GDTOA += $(CFLAGS_INC_LIBC_DEFAULT)

CFLAGS = -c
CFLAGS += $(CFLAGS_COMMON_GLOBAL) $(INC_COMMON_GLOBAL) \
          $(CFLAGS_LIBC) $(INC_LIBC) \
          $(CFLAGS_LIBC_GDTOA) $(INC_LIBC_GDTOA) \
          $(CFLAGS_COMPILER)

CPPFLAGS = -c
CPPFLAGS += $(CPPFLAGS_COMMON_GLOBAL) $(INC_COMMON_GLOBAL) \
            $(CFLAGS_LIBC) $(INC_LIBC) \
            $(CFLAGS_LIBC_GDTOA) $(INC_LIBC_GDTOA) \
            $(CPPFLAGS_COMPILER)

OUT_C = dmisc.o
IN_C = bionic/libc/upstream-openbsd/lib/libc/gdtoa/dmisc.c

OUT_CPP = gdtoa_support.o
IN_CPP = bionic/libc/upstream-openbsd/android/gdtoa_support.cpp

all : 
	echo "Build begin ..."
	
	$(RELPWD) $(CC) $(CFLAGS) -MD -MF $(OUT_C).d -o $(OUT_C) $(IN_C)
	$(RELPWD) $(CPP) $(CPPFLAGS) -MD -MF $(OUT_CPP).d -o $(OUT_CPP) $(IN_CPP)
	
	echo "Build end."

.PHONY : clean
clean :
	@echo "Begin clean ......................."
	$(RM) *.d *.o
	@echo "Done, clean ALL successfully!"



