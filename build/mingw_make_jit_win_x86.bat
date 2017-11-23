@echo off

PATH=%CD%\MinGW\x86\bin;%PATH%

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
mingw32-make BUILDMODE=dynamic CC="gcc"

copy /Y src\lua51.dll ..\..\jit\win\x86\lua51.dll
copy /Y src\luajit.exe ..\..\jit\win\x86\luajit.exe

git clean -f

pause
