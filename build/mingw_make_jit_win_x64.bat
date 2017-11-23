@echo off

PATH=%CD%\MinGW\x64\bin;%PATH%

set USE_LUA_PATH=luajit-2.1.0-beta3

cd %USE_LUA_PATH%

rem git revert
git clean -f
rem remove host
cd src
cd host
rm *.exe *.o
cd ..
cd ..
mingw32-make clean
mingw32-make BUILDMODE=dynamic CC="gcc -m64"

copy /Y src\lua51.dll ..\..\jit\win\x64\lua51.dll
copy /Y src\luajit.exe ..\..\jit\win\x64\luajit.exe


rem git revert
git clean -f
rem remove host
cd src
cd host
rm *.exe *.o
cd ..
cd ..
mingw32-make clean
mingw32-make BUILDMODE=dynamic CC="gcc -m64" CFLAGS=-DLUAJIT_ENABLE_GC64

copy /Y src\lua51.dll ..\..\jit\win\gc64\lua51.dll
copy /Y src\luajit.exe ..\..\jit\win\gc64\luajit.exe

git clean -f

pause
