PRJPATH = .

include $(PRJPATH)/build/common.mk

##########################################################
# libc_common_shared.a

ALL_MODULES = \
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
	@for m in $(MODULES); do $(MAKE) --no-print-directory -f $$m dumpobjs PATH_DUMPOBJS=$(LIB_DIR)/static/libc_common_shared.a.rsp || exit "$$?"; done
	llvm-ar crsD -format=gnu $(LIB_DIR)/static/libc_common_shared.a @${LIB_DIR}/static/libc_common_shared.a.rsp

.PHONY : clean
clean:
	$(RM) $(LIB_DIR)/static/libc_common_shared.a
	$(RM) ${LIB_DIR}/static/libc_common_shared.a.rsp

