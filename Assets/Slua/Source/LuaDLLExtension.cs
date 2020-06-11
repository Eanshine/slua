using System;
using System.Runtime.InteropServices;

namespace SLua
{

    public class LuaDLLExtension
    {
        public static int LUA_MULTRET = -1;
#if UNITY_IPHONE && !UNITY_EDITOR
		const string LUADLL = "__Internal";
#else
        const string LUADLL = "slua";
#endif
        //pdc
        [Lua3rdDLL.LualibReg("protobuf.c")]
        [DllImport(LUADLL, CallingConvention = CallingConvention.Cdecl)]
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        public static extern int luaopen_protobuf_c(IntPtr luaState);

        //lpeg
        //[Lua3rdDLL.LualibReg("lpeg")]
        //[DllImport(LUADLL, CallingConvention = CallingConvention.Cdecl)]
        //[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        //public static extern int luaopen_lpeg(IntPtr luaState);

        //cjson
        [Lua3rdDLL.LualibReg("cjson")]
        [DllImport(LUADLL, CallingConvention = CallingConvention.Cdecl)]
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        public static extern int luaopen_cjson(IntPtr luaState);

        //lua socket
        //[DllImport(LUADLL, CallingConvention = CallingConvention.Cdecl)]
        //[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        //public static extern int luaopen_socket_core(IntPtr luaState);

        //lua socket mime
        [Lua3rdDLL.LualibReg("mime.core")]
        [DllImport(LUADLL, CallingConvention = CallingConvention.Cdecl)]
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        public static extern int luaopen_mime_core(IntPtr luaState);

        //sproto
        [Lua3rdDLL.LualibReg("sproto.core")]
        [DllImport(LUADLL, CallingConvention = CallingConvention.Cdecl)]
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        public static extern int luaopen_sproto_core(IntPtr luaState);


        //lpeg
        [Lua3rdDLL.LualibReg("lpeg")]
        [DllImport(LUADLL, CallingConvention = CallingConvention.Cdecl)]
        [MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        public static extern int luaopen_lpeg(IntPtr luaState);

        //sqlite
        //[DllImport(LUADLL, CallingConvention = CallingConvention.Cdecl)]
        //[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
        //public static extern int luaopen_lsqlite3(IntPtr luaState);


    }
}
