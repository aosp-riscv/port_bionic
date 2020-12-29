PRJPATH = .

include $(PRJPATH)/build/common.mk

######################################
# Module:  libc
# Variant: android_x86_core_shared
# Type:    cc_library
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: bionic/libc/Android.bp:1528:1
#
# libc_sources_shared part defined in libc_sources_shared.mk

# Following flags are not included till now
# 	-Wl,--version-script,out/soong/.intermediates/bionic/libc/libc.x86.map/gen/libc.x86.map \
# 	-Wl,--symbol-ordering-file,bionic/libc/symbol_ordering
LDFLAGS = \
	-nostdlib \
	-Wl,--gc-sections \
	-shared \
	-Wl,-soname,libc.so \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	${g.android.soong.cc.config.DeviceGlobalLldflags} \
	-Wl,--pack-dyn-relocs=none \
	-Wl,--no-undefined \
	${g.android.soong.cc.config.RISCV64Lldflags} \
	-Wl,-z,muldefs \
	-Wl,--hash-style=both \
	${g.android.soong.cc.config.RISCV64ToolchainLdflags}

# notice the creation of libc.so is totally different against that for libc.a
# libc.a is a simple archivement for all obj files, but for libc.so, it will
# include every object file in the archives (.a), which are embraced by 
# --whole-archive and --no-whole-archive), plus some other (.a) files which 
# will be extracted only those obj files required.
# Following archives are fully included:
# - libc_sources_shared, which is included as separated obj files
# - libjemalloc5.a
# - libc_init_dynamic.a
# - libc_common_shared.a, which is the major part of libc
#
# Following libs are not included!
# libclang_rt.builtins-i686-android.a
# libatomic.a
# libgcc_stripped.a: replaced with libgcc.a & libgcc_eh.a
LIBFLAGS = \
	-Wl,--whole-archive \
	$(LIB_DIR)/static/libjemalloc5.a \
	$(LIB_DIR)/static/libc_init_dynamic.a \
	$(LIB_DIR)/static/libc_common_shared.a \
	-Wl,--no-whole-archive \
	$(LIB_DIR)/static/libdl_android.a \
	/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc.a \
	/opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc_eh.a \
	$(LIB_DIR)/shared/ld-android.so \
	$(LIB_DIR)/shared/libdl.so \

.DEFAULT_GOAL := all
all : clean
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/shared ]; then mkdir -p $(LIB_DIR)/shared; fi
	@$(MAKE) --no-print-directory -f build/libc_sources_shared.mk dumpobjs PATH_DUMPOBJS=$(LIB_DIR)/shared/libc.so.rsp
	${CPP} \
		@${LIB_DIR}/shared/libc.so.rsp \
		${LIBFLAGS} \
		-o $(LIB_DIR)/shared/libc.so \
		${LDFLAGS}

.PHONY : clean
clean:
	$(RM) $(LIB_DIR)/shared/libc.so
	$(RM) ${LIB_DIR}/shared/libc.so.rsp

