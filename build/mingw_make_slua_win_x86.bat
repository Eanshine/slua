@echo off

PATH=%CD%\MinGW\x86\bin;%PATH%

set USE_LUA_PATH=luajit-2.1.0-beta3
mkdir window\x86


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
mingw32-make BUILDMODE=static CC="gcc -m32"

copy src\libluajit.a ..\window\x86\libluajit.a /y
cd ..

del /Q window\x86\slua.dll

gcc slua.c ^
	lua-cjson-2.1.0\strbuf.c ^
	lua-cjson-2.1.0\lua_cjson.c ^
	lua-cjson-2.1.0\fpconv.c ^
	luasocket-2.0.2\src\auxiliar.c ^
	luasocket-2.0.2\src\buffer.c ^
	luasocket-2.0.2\src\except.c ^
	luasocket-2.0.2\src\inet.c ^
	luasocket-2.0.2\src\io.c ^
	luasocket-2.0.2\src\luasocket.c ^
	luasocket-2.0.2\src\options.c ^
	luasocket-2.0.2\src\select.c ^
	luasocket-2.0.2\src\tcp.c ^
	luasocket-2.0.2\src\timeout.c ^
	luasocket-2.0.2\src\udp.c ^
	luasocket-2.0.2\src\wsocket.c ^
	-o window\x86\slua.dll -m32 -shared ^
	-I.\ ^
	-Ilua-cjson-2.1.0 ^
	-Iluasocket-2.0.2\src ^
	-I%USE_LUA_PATH%\src ^
	-Wl,--whole-archive window\x86\libluajit.a ^
	-Wl,--no-whole-archive -lwsock32 -static-libgcc -static-libstdc++

copy /Y window\x86\slua.dll ..\Assets\Plugins\x86\slua.dll

cd %USE_LUA_PATH%
git clean -f

pause


