20200610
slua的去掉了luajit的支持，反馈是在arm64上不稳定。找到了openresty维护的分支。用这个吧
https://github.com/openresty/luajit2/releases
v2.1-20200102

windows 编译中遇到的问题：
1、mingw 报错
/usr/bin/sh: del: command not found
https://stackoverflow.com/questions/47874932/why-does-make-exe-try-to-run-usr-bin-sh-on-windows

2、luasocket报错  error: unknown type name ‘luaL_reg’   
修改luajit源代码  增加 #define luaL_reg     luaL_Reg

3、sproto编译不过
修改sproto编译不过的。 一个注释掉自定义lua_tointegerx，另外LUAMOD_API改成LUALIB_API

4、LPEG来自tolua库的buid
https://github.com/topameng/tolua_runtime

编译windows：
mingw_make_slua_win_x64.bat
mingw_make_slua_win_x86.bat


--------------------------------------------------------------------------------------------------------------------------------------
编译各种环境的jit代码，采用luajit2.1-beta3

实在没法在IOS的bundle里面使用luajit.在OSX64位模式下，只能用GC64

为了支持远程调试，集成了luasocket，仅包含socket库，扩展的ftp,smtp等库没有集成

1、编译windows版本，在MinGW环境下编译。用git上传gubmodule的文件夹总算报错。手动执行git submodule add https://github.com/noeticwxb/MinGW.git MinGW来添加一个Moudle。 
2、android、mac、ios都在mac环境下编译




