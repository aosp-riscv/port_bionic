PRJPATH = .

include $(PRJPATH)/build/common_bionic_libc.mk

#// ========================================================
#// libc_nomalloc.a
#// ========================================================
#//
#// This is a version of the static C library that does not
#// include malloc. It's useful in situations when the user wants
#// to provide their own malloc implementation, or wants to
#// explicitly disallow the use of malloc, such as in the
#// dynamic linker.

#################################################################
# Module:  libc_nomalloc
# Variant: android_x86_core_static
# Type:    cc_library_static
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: bionic/libc/Android.bp:1458:1

ALL_MODULES = \
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
	libstdcpp

MODULES_1 = $(addprefix build/,${ALL_MODULES})
MODULES = $(addsuffix .mk,${MODULES_1})

.DEFAULT_GOAL := all
all : clean
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/static ]; then mkdir -p $(LIB_DIR)/static; fi
	@for m in $(MODULES); do $(MAKE) --no-print-directory -f $$m dumpobjs PATH_DUMPOBJS=$(LIB_DIR)/static/libc_nomalloc.a.rsp || exit "$$?"; done
	llvm-ar crsD -format=gnu $(LIB_DIR)/static/libc_nomalloc.a @${LIB_DIR}/static/libc_nomalloc.a.rsp

.PHONY : clean
clean:
	$(RM) $(LIB_DIR)/static/libc_nomalloc.a
	$(RM) ${LIB_DIR}/static/libc_nomalloc.a.rsp
