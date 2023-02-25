This is a basic seL4 Core Platform system with the purpose of setting a timeout and reading the time on the Odroid-C2 platform.

**It is not intended to be used by anyone**. It is merely a proof-of-concept that shows
the Odroid-C2 timer driver from the [seL4 util_libs repository](https://github.com/seL4/util_libs/blob/master/libplatsupport/src/plat/odroidc2/meson_timer.c) working on the seL4 Core Platform.

To build the image yourself:
```sh
make SEL4CP_SDK=/path/to/sdk BUILD_DIR=build SEL4CP_CONFIG=debug
```

