PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

ALL_MODULES = \
	libc_sources_static \
	libc_init_static \
	libc_nopthread \
	libc_pthread \
	libc_bionic \
	libc_bionic_ndk \
	libsystemproperties \
	libpropertyinfoparser \
	libc_dns \
	libc_fortify \
	libc_freebsd \
	libc_freebsd_large_stack \
	libc_gdtoa \
	libc_malloc \
	libc_netbsd \
	libc_openbsd \
	libc_openbsd_large_stack \
	libc_openbsd_ndk \
	libc_stack_protector \
	libc_syscalls \
	libc_tzcode \
	libstdcpp \
	libjemalloc5

MODULES_1 = $(addprefix build/,${ALL_MODULES})
MODULES = $(addsuffix .mk,${MODULES_1})

# Reference:build command from log:
# prebuilts/clang/host/linux-x86/clang-r353983c1/bin/llvm-ar crsD -format=gnu out/soong/.intermediates/bionic/libc/libc/android_x86_core_static/libc.a @out/soong/.intermediates/bionic/libc/libc/android_x86_core_static/libc.a.rsp

.DEFAULT_GOAL := all
all : clean
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/static ]; then mkdir -p $(LIB_DIR)/static; fi
	@for m in $(MODULES); do $(MAKE) --no-print-directory -f $$m dumpobjs PATH_DUMPOBJS=$(LIB_DIR)/static/libc.a.rsp || exit "$$?"; done
	llvm-ar crsD -format=gnu $(LIB_DIR)/static/libc.a @${LIB_DIR}/static/libc.a.rsp

.PHONY : clean
clean:
	$(RM) $(LIB_DIR)/static/libc.a
	$(RM) ${LIB_DIR}/static/libc.a.rsp
