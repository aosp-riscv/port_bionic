OUTPUT_DIR = out

all : env_setup \
	libc_static

libc_bionic:
	@echo "Building $@ ..."
	make -f build/libc_bionic.mk
	@echo "Building $@ DONE!"

libc_bionic_ndk:
	@echo "Building $@ ..."
	make -f build/libc_bionic_ndk.mk
	@echo "Building $@ DONE!"

libc_openbsd:
	@echo "Building $@ ..."
	make -f build/libc_openbsd.mk
	@echo "Building $@ DONE!"

libc_dns:
	@echo "Building $@ ..."
	make -f build/libc_dns.mk
	@echo "Building $@ DONE!"

libc_freebsd:
	@echo "Building $@ ..."
	make -f build/libc_freebsd.mk
	@echo "Building $@ DONE!"

libc_gdtoa:
	@echo "Building $@ ..."
	make -f build/libc_gdtoa.mk
	@echo "Building $@ DONE!"

libc_netbsd:
	@echo "Building $@ ..."
	make -f build/libc_netbsd.mk
	@echo "Building $@ DONE!"


libc_openbsd_ndk:
	@echo "Building $@ ..."
	make -f build/libc_openbsd_ndk.mk
	@echo "Building $@ DONE!"

libc_freebsd_large_stack:
	@echo "Building $@ ..."
	make -f build/libc_freebsd_large_stack.mk
	@echo "Building $@ DONE!"

libc_openbsd_large_stack:
	@echo "Building $@ ..."
	make -f build/libc_openbsd_large_stack.mk
	@echo "Building $@ DONE!"

libc_stack_protector:
	@echo "Building $@ ..."
	make -f build/libc_stack_protector.mk
	@echo "Building $@ DONE!"

libc_tzcode:
	@echo "Building $@ ..."
	make -f build/libc_tzcode.mk
	@echo "Building $@ DONE!"

libc_fortify:
	@echo "Building $@ ..."
	make -f build/libc_fortify.mk
	@echo "Building $@ DONE!"

libc_malloc:
	@echo "Building $@ ..."
	make -f build/libc_malloc.mk
	@echo "Building $@ DONE!"

#$(RELPWD) $(CC) $(AFLAGS_LIBC_SYSCALLS) -MD -MF $(OUTPUT_DIR)/writev.o.d -o $(OUTPUT_DIR)/writev.o $(SRCPATH_LIBC)/arch-riscv64/syscalls/writev.S
# syscall ASM files failed to pass build:
# bionic/libc/arch-riscv64/syscalls/writev.S:5:31: error: expected absolute expression in directive
# .text; .globl writev; .balign __bionic_asm_align; .type writev, @function; writev: ; .cfi_startproc
libc_syscalls:
	@echo "Building $@ ..."
	make -f build/libc_syscalls.mk
	@echo "Building $@ DONE!"

libstdcpp:
	@echo "Building $@ ..."
	make -f build/libstdcpp.mk
	@echo "Building $@ DONE!"

# TBD:
# libc_bionic_ndk has depenedency on libsystemproperties
libc_nopthread: \
		libc_bionic \
		libc_bionic_ndk \
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
	@echo "Building $@ ..."
	make -f build/libc_nopthread.mk
	@echo "Building $@ DONE!"

libc_pthread:
	@echo "Building $@ ..."
	make -f build/libc_pthread.mk
	@echo "Building $@ DONE!"

libc_common: libc_nopthread libc_pthread

libc_common_static: libc_common

libc_init_static:
	@echo "Building $@ ..."
	make -f build/libc_init_static.mk
	@echo "Building $@ DONE!"

libc_static: libc_init_static libc_common_static
	@echo "Building $@ ..."
	make -f build/libc_static.mk
	@echo "Building $@ DONE!"

crtbegin_static:
	@echo "Building $@ ..."
	make -f build/crtbegin_static.mk
	@echo "Building $@ DONE!"

crtend:
	@echo "Building $@ ..."
	make -f build/crtend.mk
	@echo "Building $@ DONE!"

.PHONY : clean
clean :
	@echo "Begin clean ......................."
	$(RM) -rf $(OUTPUT_DIR)
	@echo "Done, clean ALL successfully!"

.PHONY : env_setup
env_setup: clean
	@mkdir -p $(OUTPUT_DIR)
	@echo "Created output dir."


