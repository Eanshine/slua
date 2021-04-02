#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
cd luajit-2.1.0-beta3
export PATH=/usr/bin:/bin:/usr/sbin:/sbin

git clean -f
make clean MACOSX_DEPLOYMENT_TARGET="10.12"
make CC="gcc -m32" MACOSX_DEPLOYMENT_TARGET="10.12"
cp src/luajit ../../jit/mac/x86/luajit

git clean -f
make clean MACOSX_DEPLOYMENT_TARGET="10.12"
make CC="gcc" MACOSX_DEPLOYMENT_TARGET="10.12"
cp src/luajit ../../jit/mac/x64/luajit

git clean -f
make clean MACOSX_DEPLOYMENT_TARGET="10.12"
make CC="gcc" MACOSX_DEPLOYMENT_TARGET="10.12" CFLAGS=-DLUAJIT_ENABLE_GC64
cp src/luajit ../../jit/mac/gc64/luajit

git clean -f
make clean MACOSX_DEPLOYMENT_TARGET="10.12"
make CC="gcc" MACOSX_DEPLOYMENT_TARGET="10.12" BUILDMODE=static CFLAGS=-DLUAJIT_ENABLE_GC64
cp src/libluajit.a ../luajit-osx/libluajit_x86_64.a

make clean MACOSX_DEPLOYMENT_TARGET="10.12"

cd ../luajit-osx/
xcodebuild -configuration=Release
cp -r Build/Release/slua.bundle ../../Assets/Plugins/
