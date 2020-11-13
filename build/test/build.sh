#!/bin/bash

rm -f install/lib/crtbegin_static.o && cp ../aosp/port_bionic/out/lib/crtbegin_static.o ./install/lib
rm -f install/lib/libc.a && cp ../aosp/port_bionic/out/lib/static/libc.a  ./install/lib/
rm -f install/lib/crtend.o && cp ../aosp/port_bionic/out/lib/crtend.o ./install/lib
rm -f ./a.out *.o ./build.log
./install/bin/musl-gcc -c -v -g hello.c -o hello.o > build.log 2>&1
/opt/riscv64/bin/riscv64-unknown-linux-gnu-ld -nostdlib -static /home/u/ws/test-musl/install/lib/crtbegin_static.o -L/home/u/ws/test-musl/install/lib ./hello.o --start-group /opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc.a /opt/riscv64/lib/gcc/riscv64-unknown-linux-gnu/10.1.0/libgcc_eh.a -lc --end-group /home/u/ws/test-musl/install/lib/crtend.o >> build.log 2>&1
cp ./build.log /media/sf_d/

