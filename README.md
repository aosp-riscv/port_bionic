Use this repo to archive all work staff about porting android bionic for RISC-V.

Usage:

- `make`: this will create sh(mksh), toybox and `libc.a` under `out`, for example:
```
$ tree ./out/bin
./out/bin
├── sh
├── toybox
└── unstripped
    ├── sh
    └── toybox
$ tree ./out/lib/
./out/lib/
├── crtbegin_static.o
├── crtend.o
├── shared
│   └── linker
└── static
    ├── libasync_safe.a
    ├── ......
    ├── libc.a
    ├── ......
    └── libziparchive.a.rsp

```

- `make linker`: this will create dynamic-linker under `out/lib/shared`.
- `sudo ./mkrootfs.sh`: this will create rootfs image file. Note `sudo` is required.
- `./run.sh`: this will launch QEMU and test the rootfs.
- `./gitee.sh`: this command is used to switch from github to gitee. Note this command will init and update submodules automatically after switching to gitee.
