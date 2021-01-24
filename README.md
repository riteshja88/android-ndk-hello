# android-ndk-hello
```
ritesh@ritesh-lappi:~/android-ndk-hello$ make clean
adb shell rm -f /data/bin/hello
rm -f bin/hello

ritesh@ritesh-lappi:~/android-ndk-hello$ make
mkdir -p bin
~/android-ndk-r21d//toolchains/llvm/prebuilt/linux-x86_64/bin/clang -target armv7a-linux-androideabi30 hello.c -o ./bin/hello
adb shell mkdir -p /data/bin
adb push bin/hello /data/bin
bin/hello: 1 file pushed. 0.7 MB/s (6660 bytes in 0.009s)
adb shell /data/bin/hello
Hello World

ritesh@ritesh-lappi:~/android-ndk-hello$make clobber
adb shell rm -rf /data/bin
rm -rf bin

ritesh@ritesh-lappi:~/android-ndk-hello$adb devices
List of devices attached
192.168.1.74:5555       device
```

# Download NDK from here
https://developer.android.com/ndk/downloads

# How to use NDK with ./configure and make
https://developer.android.com/ndk/guides/other_build_systems
