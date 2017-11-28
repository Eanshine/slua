编译各种环境的jit代码，采用luajit2.1-beta3

实在没法在IOS的bundle里面使用luajit.在OSX64位模式下，只能用GC64

为了支持远程调试，集成了luasocket，仅包含socket库，扩展的ftp,smtp等库没有集成

1、编译windows版本，在MinGW环境下编译。用git上传gubmodule的文件夹总算报错。手动执行git submodule add https://github.com/noeticwxb/MinGW.git MinGW来添加一个Moudle。 
2、android、mac、ios都在mac环境下编译


