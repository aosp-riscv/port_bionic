# generated_android_ids.h

This file is generated during build of AOSP by following command:
```
rm -rf out/soong/.intermediates/bionic/libc/generated_android_ids/gen && out/soong/host/linux-x86/bin/sbox --sandbox-path out/soong/.temp --output-root out/soong/.intermediates/bionic/libc/generated_android_ids/gen -c 'bionic/libc/fs_config_generator.py aidarray system/core/include/private/android_filesystem_config.h > __SBOX_OUT_FILES__'  __SBOX_OUT_DIR__/generated_android_ids.h
```
Till now, to quick pass build of bionic by self, I just copy one here. You should see this file under `out/soong/.intermediates/bionic/libc/generated_android_ids/gen`.

