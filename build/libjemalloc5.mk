PRJPATH = .

include $(PRJPATH)/build/common.mk

m.libjemalloc5_android_riscv64_core_static.cflags = \
	-Wall -Werror -D_GNU_SOURCE -D_REENTRANT -Wall -Wshorten-64-to-32 \
	-Wsign-compare -Wundef -Wno-format-zero-length -pipe -g3 -fvisibility=hidden \
	-O3 -funroll-loops -Wno-unused-parameter -Wno-unused-function \
	-Wno-missing-field-initializers -U_FORTIFY_SOURCE \
	-DANDROID_NUM_ARENAS=1 \
	-DANDROID_TCACHE_NSLOTS_SMALL_MAX=2 \
	-DANDROID_TCACHE_NSLOTS_LARGE=1 \
	-DANDROID_ENABLE_TCACHE \
	-DANDROID_LG_TCACHE_MAXCLASS_DEFAULT=16 \
	-UANDROID_NUM_ARENAS \
	-DANDROID_NUM_ARENAS=2 \
	-UANDROID_TCACHE_NSLOTS_SMALL_MAX \
	-DANDROID_TCACHE_NSLOTS_SMALL_MAX=8 \
	-UANDROID_TCACHE_NSLOTS_LARGE \
	-DANDROID_TCACHE_NSLOTS_LARGE=16 \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-fPIC

CFLAGS += \
	${g.android.soong.cc.config.ClangExternalCflags} \
	-Iexternal/jemalloc_new/src -Iexternal/jemalloc_new/include -Iexternal/jemalloc_new \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libjemalloc5_android_riscv64_core_static.cflags} \
	-std=gnu99 \
	${g.android.soong.cc.config.CommonGlobalConlyflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_C_1 = \
	src/jemalloc.c \
	src/arena.c \
	src/background_thread.c \
	src/base.c \
	src/bin.c \
	src/bitmap.c \
	src/ckh.c \
	src/ctl.c \
	src/div.c \
	src/extent.c \
	src/extent_dss.c \
	src/extent_mmap.c \
	src/hash.c \
	src/hooks.c \
	src/large.c \
	src/log.c \
	src/malloc_io.c \
	src/mutex.c \
	src/mutex_pool.c \
	src/nstime.c \
	src/pages.c \
	src/prng.c \
	src/prof.c \
	src/rtree.c \
	src/stats.c \
	src/sz.c \
	src/tcache.c \
	src/ticker.c \
	src/tsd.c \
	src/witness.c
SRCS_C = $(addprefix external/jemalloc_new/,${SRCS_C_1})

SRCS_CPP =

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@echo DONE!