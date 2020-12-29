OUTPUT_DIR = out

crt: crtbegin_static crtend

crtbrand :
	@echo "Building $@ ..."
	make -f build/crtbrand.mk
	@echo "Building $@ DONE!"

crtbegin_static: crtbrand
	@echo "Building $@ ..."
	make -f build/crtbegin_static.mk
	@echo "Building $@ DONE!"

crtbegin_dynamic: crtbrand
	@echo "Building $@ ..."
	make -f build/crtbegin_dynamic.mk
	@echo "Building $@ DONE!"

crtend:
	@echo "Building $@ ..."
	make -f build/crtend.mk
	@echo "Building $@ DONE!"

libc_bionic:
	@echo "Building $@ ..."
	make -f build/libc_bionic.mk
	@echo "Building $@ DONE!"fi

libpropertyinfoparser:
	@echo "Building $@ ..."
	make -f build/libpropertyinfoparser.mk
	@echo "Building $@ DONE!"fi

libsystemproperties: libpropertyinfoparser
	@echo "Building $@ ..."
	make -f build/libsystemproperties.mk
	@echo "Building $@ DONE!"fi

libc_bionic_ndk: libsystemproperties
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

libstdcpp_static:
	@echo "Building $@ ..."
	make -f build/libstdcpp.mk VARIANT=static
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
        libstdcpp_static
	@echo "Building $@ ..."
	make -f build/libc_nopthread.mk
	@echo "Building $@ DONE!"

libc_pthread:
	@echo "Building $@ ..."
	make -f build/libc_pthread.mk
	@echo "Building $@ DONE!"

libc_common: libc_nopthread libc_pthread

# read bionic/libc/Android.bp
# libc_common_static/libc_common_shared looks like an encapsulation
# for libc_common, just adding some extra handler for 32bit x86/arm
libc_common_static: libc_common

libc_common_shared: libc_common
	@echo "Building $@ ..."
	make -f build/libc_common_shared.mk
	@echo "Building $@ DONE!"

libc_init_static:
	@echo "Building $@ ..."
	make -f build/libc_init_static.mk
	@echo "Building $@ DONE!"

libc_init_dynamic:
	@echo "Building $@ ..."
	make -f build/libc_init_dynamic.mk
	@echo "Building $@ DONE!"

# libc_sources_static/libc_sources_shared may better merged into
# libc_static/libc_shared, but now, just keep it here, we will move to
# AOSP/Soong soon later
libc_sources_static:
	@echo "Building $@ ..."
	make -f build/libc_sources_static.mk
	@echo "Building $@ DONE!"

libc_sources_shared:
	@echo "Building $@ ..."
	make -f build/libc_sources_shared.mk
	@echo "Building $@ DONE!"

libjemalloc5:
	@echo "Building $@ ..."
	make -f build/libjemalloc5.mk
	@echo "Building $@ DONE!"

libdl_android_static:
	@echo "Building $@ ..."
	make -f build/libdl_android.mk
	@echo "Building $@ DONE!"

ld_android_shared:
	@echo "Building $@ ..."
	make -f build/ld_android.mk
	@echo "Building $@ DONE!"

libdl_static:
	@echo "Building $@ ..."
	make -f build/libdl_static.mk
	@echo "Building $@ DONE!"

libdl_shared: libdl_static ld_android_shared
	@echo "Building $@ ..."
	make -f build/libdl.mk
	@echo "Building $@ DONE!"

# TBD: libc_static.mk and libc_shared.mk better to merge into one
libc_static: \
		libc_sources_static \
		libc_init_static \
		libc_common_static \
		libjemalloc5
	@echo "Building $@ ..."
	make -f build/libc_static.mk
	@echo "Building $@ DONE!"

libc_shared: \
		libc_sources_shared \
		libc_init_dynamic \
		libc_common_shared \
		libjemalloc5 \
		libdl_android_static \
		ld_android_shared \
		libdl_shared
	@echo "Building $@ ..."
	make -f build/libc_shared.mk
	@echo "Building $@ DONE!"

libc_nomalloc: \
		libc_init_static \
		libc_common_static
	@echo "Building $@ ..."
	make -f build/libc_nomalloc.mk
	@echo "Building $@ DONE!"

libziparchive:
	@echo "Building $@ ..."
	make -f build/libziparchive.mk
	@echo "Building $@ DONE!"

libutils:
	@echo "Building $@ ..."
	make -f build/libutils.mk
	@echo "Building $@ DONE!"

libz:
	@echo "Building $@ ..."
	make -f build/libz.mk
	@echo "Building $@ DONE!"

liblinker_malloc:
	@echo "Building $@ ..."
	make -f build/liblinker_malloc.mk
	@echo "Building $@ DONE!"

libasync_safe:
	@echo "Building $@ ..."
	make -f build/libasync_safe.mk
	@echo "Building $@ DONE!"

libbase:
	@echo "Building $@ ..."
	make -f build/libbase.mk
	@echo "Building $@ DONE!"

liblog:
	@echo "Building $@ ..."
	make -f build/liblog.mk
	@echo "Building $@ DONE!"

libc++_static:
	@echo "Building $@ ..."
	make -f build/libcxx_static.mk
	@echo "Building $@ DONE!"

libc++abi:
	@echo "Building $@ ..."
	make -f build/libcxxabi.mk
	@echo "Building $@ DONE!"

linker: libm \
		libziparchive \
		libutils \
		libz \
		liblinker_malloc \
		libasync_safe \
		libbase \
		liblog \
		libc++_static \
		libc++abi \
		libc_nomalloc
	@echo "Building $@ ..."
	make -f build/linker.mk
	@echo "Building $@ DONE!"

libm:
	@echo "Building $@ ..."
	make -f build/libm.mk
	@echo "Building $@ DONE!"

libtest:
	@echo "Building $@ ..."
	make -f build/libtest.mk
	@echo "Building $@ DONE!"

test-e: env_setup libtest
	@echo "Building $@ ..."
	make -f build/test.mk EXPLICIT=yes
	@echo "Building $@ DONE!"

test-i: env_setup libtest
	@echo "Building $@ ..."
	make -f build/test.mk
	@echo "Building $@ DONE!"

hello: env_setup crtbegin_dynamic crtend libc_shared linker
	@echo "Building $@ ..."
	make -f build/libtest.mk
	make -f build/test.mk EXPLICIT=yes
	@echo "Building $@ DONE!"


toybox: env_setup crtbegin_static crtend libc_static
	@echo "Building $@ ..."
	make -f build/toybox.mk
	@echo "Building $@ DONE!"

mksh: env_setup crtbegin_static crtend libc_static
	@echo "Building $@ ..."
	make -f build/mksh.mk
	@echo "Building $@ DONE!"

.PHONY : clean
clean :
	@echo "Begin clean ......................."
	$(RM) -rf $(OUTPUT_DIR)
	@echo "Done, clean ALL successfully!"

# env_setup will only clean-up the obj folder, but not impact other output folders
# so it should be safe
.PHONY : env_setup
env_setup:
	rm -rf $(OUTPUT_DIR)/obj
	mkdir -p $(OUTPUT_DIR)/obj
	mkdir -p $(OUTPUT_DIR)/lib/static
	mkdir -p $(OUTPUT_DIR)/lib/shared
	mkdir -p $(OUTPUT_DIR)/bin/unstripped
	@echo "Enviroment is ready."


.PHONY : debug
debug:
	rm -f log
	qemu-riscv64 -L ./out -E LD_DEBUG=3 -g 1234 ./out/bin/unstripped/hello > log

# to see log on stdout, set LINKER_DEBUG_TO_LOG to zero in bionic/linker/linker_debug.h
# set LD_DEBUG=2 to open all print/info/trace
# set LD_DEBUG=3 to open all debug log
#	qemu-riscv64 -L ./out -E LD_DEBUG=3 ./out/bin/unstripped/hello
.PHONY : run
run:
	qemu-riscv64 -L ./out -E LD_LIBRARY_PATH=./out/lib/shared ./out/bin/unstripped/hello

.DEFAULT_GOAL := all
all : toybox mksh hello
