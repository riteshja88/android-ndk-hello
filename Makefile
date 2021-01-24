#https://developer.android.com/ndk/guides/other_build_systems
#https://developer.android.com/ndk/downloads
NDK_PATH=~/android-ndk-r21d/
HOST_TAG=linux-x86_64
MIN_SDK_VERSION=30
TARGET_ARCH=armv7a-linux-androideabi$(MIN_SDK_VERSION)
CC=clang
BIN=bin
TARGET_BIN_PATH=/data/bin
all: run_on_target

build:
	mkdir -p $(BIN)
	$(NDK_PATH)/toolchains/llvm/prebuilt/$(HOST_TAG)/bin/$(CC) -target $(TARGET_ARCH) hello.c -o ./$(BIN)/hello

clean: clean_target
	rm -f $(BIN)/hello

clobber: clobber_target
	rm -rf $(BIN)

upload_to_target: build
	adb shell mkdir -p $(TARGET_BIN_PATH)
	adb push $(BIN)/hello $(TARGET_BIN_PATH)

run_on_target: upload_to_target
	adb shell $(TARGET_BIN_PATH)/hello

clean_target:
	adb shell rm -f $(TARGET_BIN_PATH)/hello

clobber_target:
	adb shell rm -rf $(TARGET_BIN_PATH)
