PRJPATH = .

include $(PRJPATH)/build/common.mk

INC_LOCAL = \
	-Iexternal/jemalloc_new/src \
	-Iexternal/jemalloc_new/include \
	-Iexternal/jemalloc_new

# refer to external/jemalloc_new/Android.bp
# common_cflags
CFLAGS_LOCAL_COMMON = \
	-D_GNU_SOURCE -D_REENTRANT -Wall -Wshorten-64-to-32 \
	-Wsign-compare -Wundef -Wno-format-zero-length -pipe -g3 \
	-fvisibility=hidden -O3 -funroll-loops \
	-Wno-unused-parameter -Wno-unused-function -Wno-missing-field-initializers \
	-U_FORTIFY_SOURCE
# android_common_cflags
CFLAGS_LOCAL_ANDROID_COMMON = \
	-DANDROID_NUM_ARENAS=1 \
	-DANDROID_TCACHE_NSLOTS_SMALL_MAX=2 \
	-DANDROID_TCACHE_NSLOTS_LARGE=1
CFLAGS_LOCAL_MALLOC_NOT_SVELTE = \
	-DANDROID_ENABLE_TCACHE \
	-DANDROID_LG_TCACHE_MAXCLASS_DEFAULT=16 \
	-UANDROID_NUM_ARENAS \
	-DANDROID_NUM_ARENAS=2 \
	-UANDROID_TCACHE_NSLOTS_SMALL_MAX \
	-DANDROID_TCACHE_NSLOTS_SMALL_MAX=8 \
	-UANDROID_TCACHE_NSLOTS_LARGE \
	-DANDROID_TCACHE_NSLOTS_LARGE=16
CFLAGS_LOCAL = \
	-Wno-enum-compare \
	-Wno-enum-compare-switch \
	-Wno-null-pointer-arithmetic \
	-Wno-null-dereference \
	-Wall -Werror
CFLAGS_LOCAL += $(CFLAGS_LOCAL_COMMON)
CFLAGS_LOCAL += $(CFLAGS_LOCAL_ANDROID_COMMON)
CFLAGS_LOCAL += $(CFLAGS_LOCAL_MALLOC_NOT_SVELTE)

CFLAGS_COMPILER = $(CFLAGS_COMPILER_COMMON)
CFLAGS_COMPILER += -fPIC
CFLAGS_COMPILER += -std=gnu99

CFLAGS += \
	$(INC_LOCAL) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LOCAL) \
	$(CFLAGS_COMPILER) \
	$(CFLAGS_NOOVERRIDECLANGGLOBAL)

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

OBJS = $(SRCS_C:.c=.o)
OBJS += $(SRCS_CPP:.cpp=.o)
DEPS = $(OBJS:.o=.o.d)

%.o : %.cpp
	$(RELPWD) $(CPP) $(CPPFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/$(OBJ_DIR)/
	mv $@.d $(PRJPATH)/$(OBJ_DIR)/

%.o : %.c
	$(RELPWD) $(CC) $(CFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/$(OBJ_DIR)/
	mv $@.d $(PRJPATH)/$(OBJ_DIR)/

all : $(OBJS)
	@echo DONE!

.PHONY : clean
clean:
	$(RM) $(OBJS)
	$(RM) $(DEPS)
