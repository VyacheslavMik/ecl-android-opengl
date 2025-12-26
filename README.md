Build an ecl for android.

```
export NDK_PATH=/home/vyacheslav/Android/Sdk/ndk/25.1.8937393/ && \
export TOOLCHAIN_PATH=${NDK_PATH}/toolchains/llvm/prebuilt/linux-x86_64 && \
export PATH=${TOOLCHAIN_PATH}/bin:$PATH && \
export CC="aarch64-linux-android29-clang -D__BIONIC_VERSIONER=TRUE" && \
./configure --host=aarch64-linux-android --prefix=`pwd`/ecl-android --disable-c99complex --with-cross-config=`pwd`/src/util/android-arm64.cross_config && \
make -j9 && \
make install
```
