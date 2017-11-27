#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
cd luajit-2.1.0-beta3

git clean -f
make clean
make CC="gcc -m32"
cp src/luajit ../../jit/mac/x86/luajit

git clean -f
make clean
make CC="gcc"
cp src/luajit ../../jit/mac/x64/luajit

git clean -f
make clean
make CC="gcc" CFLAGS=-DLUAJIT_ENABLE_GC64
cp src/luajit ../../jit/mac/gc64/luajit

git clean -f
make clean
make CC="gcc -m32" BUILDMODE=static
cp src/libluajit.a ../luajit-osx/libluajit_x86.a

git clean -f
make clean
make CC="gcc" BUILDMODE=static CFLAGS=-DLUAJIT_ENABLE_GC64
cp src/libluajit.a ../luajit-osx/libluajit_x86_64.a

make clean
make clean -f


cd ../luajit-osx/
xcodebuild -configuration=Release
cp -r Build/Release/slua.bundle ../../Assets/Plugins/
