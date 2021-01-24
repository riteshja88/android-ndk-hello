NDK_PATH=~/android-ndk-r21d
HOST_TAG=linux-x86_64
TOOLCHAIN=$(NDK_PATH)/toolchains/llvm/prebuilt/$(HOST_TAG)
CC=$(TOOLCHAIN)/bin/clang
API=30 #Set this to your minSdkVersion
TARGET_ARCH=armv7a-linux-androideabi$(API)
BIN=bin
TARGET_BIN_PATH=/data/bin
ADB_TARGET_IP=192.168.1.74
all: run_on_target

build:
	mkdir -p $(BIN)
	$(CC) -target $(TARGET_ARCH) hello.c -o ./$(BIN)/hello

clean: clean_target
	rm -f $(BIN)/hello

clobber: clobber_target
	rm -rf $(BIN)

adb_root:
	adb root

adb_connect: adb_root
	adb connect $(ADB_TARGET_IP)

upload_to_target: build adb_connect
	adb shell mkdir -p $(TARGET_BIN_PATH)
	adb push $(BIN)/hello $(TARGET_BIN_PATH)

run_on_target: upload_to_target
	adb shell $(TARGET_BIN_PATH)/hello

clean_target:
	adb shell rm -f $(TARGET_BIN_PATH)/hello

clobber_target:
	adb shell rm -rf $(TARGET_BIN_PATH)
