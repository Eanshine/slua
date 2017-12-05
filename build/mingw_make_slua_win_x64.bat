@echo off

PATH=%CD%\MinGW\x64\bin;%PATH%

set USE_LUA_PATH=luajit-2.1.0-beta3
mkdir window\x86_64

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
mingw32-make BUILDMODE=static CC="gcc -m64" CFLAGS=-DLUAJIT_ENABLE_GC64
copy src\libluajit.a ..\window\x86_64\libluajit.a /y

cd ..

del /Q window\x86_64\slua.dll

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
	luasocket-2.0.2\src\mime.c ^
	luasocket-2.0.2\src\wsocket.c ^
	pbc-win\alloc.c ^
	pbc-win\array.c ^
	pbc-win\bootstrap.c ^
	pbc-win\context.c ^
	pbc-win\decode.c ^
	pbc-win\map.c ^
	pbc-win\pattern.c ^
	pbc-win\proto.c ^
	pbc-win\register.c ^
	pbc-win\rmessage.c ^
	pbc-win\stringpool.c ^
	pbc-win\varint.c ^
	pbc-win\wmessage.c ^
	pbc-win\pbc-lua.c ^
	-o window\x86_64\slua.dll -m64 -g -O0 -shared -funwind-tables ^
	-I.\ ^
	-Ilua-cjson-2.1.0 ^
	-Iluasocket-2.0.2\src ^
	-Ipbc-win ^
	-I%USE_LUA_PATH%\src ^
	-Wl,--whole-archive window\x86_64\libluajit.a ^
	-Wl,--no-whole-archive -lwsock32 -static-libgcc -static-libstdc++ 

copy /Y window\x86_64\slua.dll ..\Assets\Plugins\x64\slua.dll

cd %USE_LUA_PATH%
git clean -f

pause


