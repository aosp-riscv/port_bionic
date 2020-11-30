PRJPATH = .

include $(PRJPATH)/build/common.mk

########################################
# mksh
# Defined: external/mksh/Android.bp:120:1

m.sh_android_riscv64_core.cflags = \
	-Wall -Werror -Wno-deprecated-declarations -fno-asynchronous-unwind-tables \
	-fno-strict-aliasing -fwrapv -DDEBUG_LEAKS -DMKSH_ASSUME_UTF8 \
	-DMKSH_DONT_EMIT_IDSTRING \
	'-DKSH_VERSIONNAME_VENDOR_EXT=" Android"' \
	-DMKSH_BUILDSH -D_GNU_SOURCE -DSETUID_CAN_FAIL_WITH_EAGAIN \
	-DHAVE_STRING_POOLING=1 -DHAVE_ATTRIBUTE_BOUNDED=1 -DHAVE_ATTRIBUTE_FORMAT=1 \
	-DHAVE_ATTRIBUTE_NORETURN=1 -DHAVE_ATTRIBUTE_PURE=1 -DHAVE_ATTRIBUTE_UNUSED=1 \
	-DHAVE_ATTRIBUTE_USED=1 -DHAVE_SYS_TIME_H=1 -DHAVE_TIME_H=1 \
	-DHAVE_BOTH_TIME_H=1 -DHAVE_SYS_BSDTYPES_H=0 -DHAVE_SYS_FILE_H=1 \
	-DHAVE_SYS_MKDEV_H=0 -DHAVE_SYS_MMAN_H=1 -DHAVE_SYS_PARAM_H=1 \
	-DHAVE_SYS_RESOURCE_H=1 -DHAVE_SYS_SELECT_H=1 -DHAVE_SYS_SYSMACROS_H=1 \
	-DHAVE_BSTRING_H=0 -DHAVE_GRP_H=1 -DHAVE_IO_H=0 -DHAVE_LIBGEN_H=1 \
	-DHAVE_LIBUTIL_H=0 -DHAVE_PATHS_H=1 -DHAVE_STDINT_H=1 -DHAVE_STRINGS_H=1 \
	-DHAVE_TERMIOS_H=1 -DHAVE_ULIMIT_H=0 -DHAVE_VALUES_H=0 -DHAVE_CAN_INTTYPES=1 \
	-DHAVE_CAN_UCBINTS=1 -DHAVE_CAN_INT8TYPE=1 -DHAVE_CAN_UCBINT8=1 \
	-DHAVE_RLIM_T=1 -DHAVE_SIG_T=1 -DHAVE_SYS_ERRLIST=0 -DHAVE_SYS_SIGNAME=1 \
	-DHAVE_SYS_SIGLIST=1 -DHAVE_FLOCK=1 -DHAVE_LOCK_FCNTL=1 -DHAVE_GETRUSAGE=1 \
	-DHAVE_GETSID=1 -DHAVE_GETTIMEOFDAY=1 -DHAVE_KILLPG=1 -DHAVE_MEMMOVE=1 \
	-DHAVE_MKNOD=0 -DHAVE_MMAP=1 -DHAVE_FTRUNCATE=1 -DHAVE_NICE=1 \
	-DHAVE_REVOKE=0 -DHAVE_SETLOCALE_CTYPE=1 -DHAVE_LANGINFO_CODESET=1 \
	-DHAVE_SELECT=1 -DHAVE_SETRESUGID=1 -DHAVE_SETGROUPS=1 -DHAVE_STRERROR=1 \
	-DHAVE_STRSIGNAL=0 -DHAVE_STRLCPY=1 -DHAVE_FLOCK_DECL=1 -DHAVE_REVOKE_DECL=1 \
	-DHAVE_SYS_ERRLIST_DECL=0 -DHAVE_SYS_SIGLIST_DECL=1 -DHAVE_PERSISTENT_HISTORY=0 \
	-DMKSH_BUILD_R=571 '-DMKSH_DEFAULT_PROFILEDIR="/system/etc"' \
	'-DMKSHRC_PATH="/system/etc/mkshrc"' '-DMKSH_DEFAULT_EXECSHELL="/system/bin/sh"' \
	'-DMKSH_DEFAULT_TMPDIR="/data/local"' \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-fPIE -D_USING_LIBCXX

CFLAGS += \
	    ${g.android.soong.cc.config.ClangExternalCflags} \
		-Iexternal/mksh/src -Iexternal/mksh  \
		${g.android.soong.cc.config.RISCV64ClangCflags} \
		${g.android.soong.cc.config.CommonClangGlobalCflags} \
		${g.android.soong.cc.config.DeviceClangGlobalCflags} \
		${g.android.soong.cc.config.RISCV64ToolchainCflags} \
		${g.android.soong.cc.config.RISCV64VariantClangCflags} \
		-Iexternal/libcxx/include -Iexternal/libcxxabi/include \
		-Ibionic/libc/include -D__LIBC_API__=10000 \
		-D__LIBM_API__=10000 -D__LIBDL_API__=10000 \
		${g.android.soong.cc.config.CommonGlobalIncludes} \
		${g.android.soong.cc.config.RISCV64IncludeFlags} \
		${g.android.soong.cc.config.CommonNativehelperInclude} \
		${m.sh_android_riscv64_core.cflags} \
		-std=gnu99 \
		${g.android.soong.cc.config.CommonGlobalConlyflags} \
		${g.android.soong.cc.config.NoOverrideClangGlobalCflags}


# TBD: I removed this option, I wonder why we need this
#    -D_USING_LIBCXX


SRCS_C = \
	external/mksh/src/lalloc.c \
	external/mksh/src/edit.c \
	external/mksh/src/eval.c \
	external/mksh/src/exec.c \
	external/mksh/src/expr.c \
	external/mksh/src/funcs.c \
	external/mksh/src/histrap.c \
	external/mksh/src/jobs.c \
	external/mksh/src/lex.c \
	external/mksh/src/main.c \
	external/mksh/src/misc.c \
	external/mksh/src/shf.c \
	external/mksh/src/syn.c \
	external/mksh/src/tree.c \
	external/mksh/src/var.c

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@rm -f $(BIN_DIR)/unstripped/sh
	@rm -f $(BIN_DIR)/sh
	@if [ ! -e $(BIN_DIR) ]; then mkdir -p $(BIN_DIR)/unstripped; fi
	${LD} \
		-nostdlib -static \
		${LIB_DIR}/crtbegin_static.o \
		-L${LIB_DIR}/static \
		$(OBJ_DIR)/external/mksh/src/*.o \
		--start-group \
		/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc.a \
		/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc_eh.a \
		-lc \
		--end-group \
		${LIB_DIR}/crtend.o \
		-o $(BIN_DIR)/unstripped/sh
	${STRIP} $(BIN_DIR)/unstripped/sh -o $(BIN_DIR)/sh
	@echo DONE!

