PRJPATH = .

include $(PRJPATH)/build/common.mk

CFLAGS += \
	-Wno-enum-compare -Wno-enum-compare-switch -Wno-null-pointer-arithmetic \
	-Wno-null-dereference \
	-Iexternal/mksh/src -Iexternal/mksh \
	-DANDROID -fmessage-length=0 -W -Wall -Wno-unused -Winit-self \
	-Wpointer-arith -no-canonical-prefixes \
	-DNDEBUG -UDEBUG -fno-exceptions -Wno-multichar -O2 -g -fno-strict-aliasing \
	-fdebug-prefix-map=/proc/self/cwd= \
	-D__compiler_offsetof=__builtin_offsetof -faddrsig -Wimplicit-fallthrough \
	-Werror=int-conversion -Wno-reserved-id-macro -Wno-format-pedantic \
	-Wno-unused-command-line-argument -fcolor-diagnostics \
	-Wno-zero-as-null-pointer-constant -Wno-sign-compare \
	-Wno-defaulted-function-deleted -Wno-inconsistent-missing-override \
	-ffunction-sections -fdata-sections -fno-short-enums -funwind-tables \
	-fstack-protector-strong -Wa,--noexecstack -D_FORTIFY_SOURCE=2 \
	-Wstrict-aliasing=2 -Werror=return-type -Werror=non-virtual-dtor \
	-Werror=address -Werror=sequence-point -Werror=date-time -Werror=format-security \
	-nostdlibinc \
	-Iexternal/libcxx/include -Iexternal/libcxxabi/include -Ibionic/libc/include \
	-D__LIBC_API__=10000 -D__LIBM_API__=10000 -D__LIBDL_API__=10000 \
	-Isystem/core/include -Isystem/media/audio/include -Ihardware/libhardware/include \
	-Ihardware/libhardware_legacy/include -Ihardware/ril/include \
	-Iframeworks/native/include -Iframeworks/native/opengl/include -Iframeworks/av/include \
	-isystem bionic/libc/include -isystem bionic/libc/kernel/uapi \
	-isystem bionic/libc/kernel/uapi/asm-riscv \
	-isystem bionic/libc/kernel/android/scsi -isystem bionic/libc/kernel/android/uapi \
	-Ilibnativehelper/include_jni \
	-Wall -Werror -Wno-deprecated-declarations -fno-asynchronous-unwind-tables \
	-fno-strict-aliasing -fwrapv -DDEBUG_LEAKS -DMKSH_ASSUME_UTF8 \
	-DMKSH_DONT_EMIT_IDSTRING '-DKSH_VERSIONNAME_VENDOR_EXT=" Android"' \
	-DMKSH_BUILDSH -D_GNU_SOURCE -DSETUID_CAN_FAIL_WITH_EAGAIN \
	-DHAVE_STRING_POOLING=1 -DHAVE_ATTRIBUTE_BOUNDED=1 -DHAVE_ATTRIBUTE_FORMAT=1 \
	-DHAVE_ATTRIBUTE_NORETURN=1 -DHAVE_ATTRIBUTE_PURE=1 -DHAVE_ATTRIBUTE_UNUSED=1 \
	-DHAVE_ATTRIBUTE_USED=1 -DHAVE_SYS_TIME_H=1 -DHAVE_TIME_H=1 -DHAVE_BOTH_TIME_H=1 \
	-DHAVE_SYS_BSDTYPES_H=0 -DHAVE_SYS_FILE_H=1 -DHAVE_SYS_MKDEV_H=0 -DHAVE_SYS_MMAN_H=1 \
	-DHAVE_SYS_PARAM_H=1 -DHAVE_SYS_RESOURCE_H=1 -DHAVE_SYS_SELECT_H=1 \
	-DHAVE_SYS_SYSMACROS_H=1 -DHAVE_BSTRING_H=0 -DHAVE_GRP_H=1 -DHAVE_IO_H=0 \
	-DHAVE_LIBGEN_H=1 -DHAVE_LIBUTIL_H=0 -DHAVE_PATHS_H=1 -DHAVE_STDINT_H=1 \
	-DHAVE_STRINGS_H=1 -DHAVE_TERMIOS_H=1 -DHAVE_ULIMIT_H=0 -DHAVE_VALUES_H=0 \
	-DHAVE_CAN_INTTYPES=1 -DHAVE_CAN_UCBINTS=1 -DHAVE_CAN_INT8TYPE=1 \
	-DHAVE_CAN_UCBINT8=1 -DHAVE_RLIM_T=1 -DHAVE_SIG_T=1 -DHAVE_SYS_ERRLIST=0 \
	-DHAVE_SYS_SIGNAME=1 -DHAVE_SYS_SIGLIST=1 -DHAVE_FLOCK=1 -DHAVE_LOCK_FCNTL=1 \
	-DHAVE_GETRUSAGE=1 -DHAVE_GETSID=1 -DHAVE_GETTIMEOFDAY=1 -DHAVE_KILLPG=1 \
	-DHAVE_MEMMOVE=1 -DHAVE_MKNOD=0 -DHAVE_MMAP=1 -DHAVE_FTRUNCATE=1 -DHAVE_NICE=1 \
	-DHAVE_REVOKE=0 -DHAVE_SETLOCALE_CTYPE=1 -DHAVE_LANGINFO_CODESET=1 \
	-DHAVE_SELECT=1 -DHAVE_SETRESUGID=1 -DHAVE_SETGROUPS=1 -DHAVE_STRERROR=1 \
	-DHAVE_STRSIGNAL=0 -DHAVE_STRLCPY=1 -DHAVE_FLOCK_DECL=1 -DHAVE_REVOKE_DECL=1 \
	-DHAVE_SYS_ERRLIST_DECL=0 -DHAVE_SYS_SIGLIST_DECL=1 -DHAVE_PERSISTENT_HISTORY=0 \
	-DMKSH_BUILD_R=571 '-DMKSH_DEFAULT_PROFILEDIR="/system/etc"' \
	'-DMKSHRC_PATH="/system/etc/mkshrc"' \
	'-DMKSH_DEFAULT_EXECSHELL="/system/bin/sh"' \
	'-DMKSH_DEFAULT_TMPDIR="/data/local"' \
	-target riscv64-unknown-linux-gnu \
	-B/opt/riscv64/bin \
	-fPIE \
	-std=gnu99 \
	-Werror=int-to-pointer-cast -Werror=pointer-to-int-cast -Werror=address-of-temporary -Werror=return-type -Wno-tautological-constant-compare -Wno-tautological-type-limit-compare -Wno-tautological-unsigned-enum-zero-compare -Wno-tautological-unsigned-zero-compare -Wno-c++98-compat-extra-semi -Wno-return-std-move-in-c++11 

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

OBJS = $(SRCS_C:.c=.o)

DEPS = $(OBJS:.o=.o.d)

%.o : %.c
	$(RELPWD) $(CC) $(CFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/$(OBJ_DIR)/
	mv $@.d $(PRJPATH)/$(OBJ_DIR)/

all : $(OBJS)
	rm -f $(BIN_DIR)/unstripped/sh
	rm -f $(BIN_DIR)/sh
	/opt/riscv64/bin/riscv64-unknown-linux-gnu-ld \
		-nostdlib -static \
		./out/lib/crtbegin_static.o \
		-L./out/lib/static \
		$(OBJ_DIR)/*.o \
		--start-group \
		/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc.a \
		/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc_eh.a \
		-lc \
		--end-group \
		./out/lib/crtend.o \
		-o $(BIN_DIR)/unstripped/sh
	/opt/riscv64/bin/riscv64-unknown-linux-gnu-strip $(BIN_DIR)/unstripped/sh -o $(BIN_DIR)/sh
	@echo DONE!

.PHONY : clean
clean:
	$(RM) $(OBJS)
	$(RM) $(DEPS)
