LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libluajit

$(info $(TARGET_ARCH_ABI))

LOCAL_SRC_FILES := ../$(TARGET_ARCH_ABI)/libluajit.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE := slua
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../luajit-2.1.0-beta3/src 
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../pbc-master
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../lua-cjson-2.1.0
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../luasocket-2.0.2/src
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../sproto-master
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../lpeg
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../

LOCAL_CPPFLAGS := -03 -ffast-math
LOCAL_SRC_FILES := ../../slua.c \
				   ../../pbc-master/alloc.c \
				   ../../pbc-master/array.c \
				   ../../pbc-master/bootstrap.c \
				   ../../pbc-master/context.c \
				   ../../pbc-master/decode.c \
				   ../../pbc-master/map.c \
				   ../../pbc-master/pattern.c \
				   ../../pbc-master/proto.c \
				   ../../pbc-master/register.c \
				   ../../pbc-master/rmessage.c \
				   ../../pbc-master/stringpool.c \
				   ../../pbc-master/varint.c \
				   ../../pbc-master/wmessage.c \
				   ../../pbc-master/pbc-lua.c \
				   ../../lua-cjson-2.1.0/fpconv.c \
				   ../../lua-cjson-2.1.0/strbuf.c \
				   ../../lua-cjson-2.1.0/lua_cjson.c \
				   ../../luasocket-2.0.2/src/auxiliar.c \
				   ../../luasocket-2.0.2/src/buffer.c \
				   ../../luasocket-2.0.2/src/except.c \
				   ../../luasocket-2.0.2/src/inet.c \
				   ../../luasocket-2.0.2/src/io.c \
				   ../../luasocket-2.0.2/src/luasocket.c \
				   ../../luasocket-2.0.2/src/mime.c \
				   ../../luasocket-2.0.2/src/options.c \
				   ../../luasocket-2.0.2/src/select.c \
				   ../../luasocket-2.0.2/src/tcp.c \
				   ../../luasocket-2.0.2/src/timeout.c \
				   ../../luasocket-2.0.2/src/udp.c \
				   ../../luasocket-2.0.2/src/unix.c \
				   ../../luasocket-2.0.2/src/usocket.c \
				   ../../sproto-master/sproto.c \
				   ../../sproto-master/lsproto.c \
				   ../../lpeg/lpeg.c \
				   

LOCAL_WHOLE_STATIC_LIBRARIES += libluajit
include $(BUILD_SHARED_LIBRARY)

