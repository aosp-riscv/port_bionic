Basicly, we should use the original AOSP repo https://android.googlesource.com/platform/system/core.git. 
And there is a mirror on github: https://github.com/aosp-mirror/platform_system_core.git

But the problem is when I tried to import the github repo into aosp-riscv, system reported failure. Then I tried to clone a repo from the original android goolesource and push it to aosp-riscv, still failed and github reported there are files too big (> 200MB).

So my methold is just copy some files I realy need to pass build bionic here. 

I marked the commit id here for system/core folder so you can use the same id to pick up the correct core repo if you would like.

base on android-10.0.0_r39
```
commit 41f8654b7210971d617de9846482fd893069b41b (HEAD, tag: android-10.0.0_r39, tag: android-10.0.0_r38, tag: android-10.0.0_r37, tag: m/android-10.0.0_r39, aosp/android10-qpr3-s1-release, aosp/android10-qpr3-release)
```
