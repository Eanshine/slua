#!/usr/bin/env bash
cd "$( dirname "${BASH_SOURCE[0]}" )"

cd luajit-2.1.0-beta3
export PATH=/usr/bin:/bin:/usr/sbin:/sbin

git clean -f


LIPO="xcrun -sdk iphoneos lipo"
STRIP="xcrun -sdk iphoneos strip"


IXCODE=`xcode-select -print-path`
ISDK=$IXCODE/Platforms/iPhoneOS.platform/Developer
ISDKVER=iPhoneOS.sdk
# set development target to 8.0
DEVTAR=8.0
ISDKP=$IXCODE/usr/bin/

if [ ! -e $ISDKP/ar ]; then
  sudo cp /usr/bin/ar $ISDKP
fi

if [ ! -e $ISDKP/ranlib ]; then
  sudo cp /usr/bin/ranlib $ISDKP
fi

if [ ! -e $ISDKP/strip ]; then
  sudo cp /usr/bin/strip $ISDKP
fi

make clean MACOSX_DEPLOYMENT_TARGET="10.12"
git clean -f
ISDKF="-arch armv7 -isysroot $ISDK/SDKs/$ISDKVER -miphoneos-version-min=$DEVTAR"
make HOST_CC="gcc -m32 -std=c99" MACOSX_DEPLOYMENT_TARGET="10.12" CROSS="$ISDKP" TARGET_FLAGS="$ISDKF" TARGET=armv7 TARGET_SYS=iOS LUAJIT_A=libsluav7.a
cp -f src/libsluav7.a ./../luajit-ios

make clean MACOSX_DEPLOYMENT_TARGET="10.12"
git clean -f
ISDKF="-arch armv7s -isysroot $ISDK/SDKs/$ISDKVER -miphoneos-version-min=$DEVTAR"
make HOST_CC="gcc -m32 -std=c99" MACOSX_DEPLOYMENT_TARGET="10.12" CROSS="$ISDKP" TARGET_FLAGS="$ISDKF" TARGET=armv7s TARGET_SYS=iOS LUAJIT_A=libsluav7s.a
cp -f src/libsluav7s.a ./../luajit-ios

make clean MACOSX_DEPLOYMENT_TARGET="10.12"
git clean -f
ISDKF="-arch arm64 -isysroot $ISDK/SDKs/$ISDKVER -miphoneos-version-min=$DEVTAR"
make HOST_CC="gcc -std=c99" MACOSX_DEPLOYMENT_TARGET="10.12" CROSS="$ISDKP" TARGET_FLAGS="$ISDKF" TARGET=arm64 TARGET_SYS=iOS LUAJIT_A=libslua64.a
cp -f src/libslua64.a ./../luajit-ios

# add simulator support
#ISDK=$IXCODE/Platforms/iPhoneSimulator.platform/Developer
#ISDKVER=iPhoneSimulator.sdk
#set development target to 9.0
#DEVTAR=9.0
#ISDKP=/usr/bin/

#make clean MACOSX_DEPLOYMENT_TARGET="10.12"
#git clean -f
#ISDKF="-arch i386 -isysroot $ISDK/SDKs/$ISDKVER -mios-simulator-version-min=$DEVTAR"
#make HOST_CC="gcc -m32 -arch i386" MACOSX_DEPLOYMENT_TARGET="10.12" CROSS=$ISDKP TARGET_FLAGS="$ISDKF" TARGET=i386 TARGET_SYS=iOS  LUAJIT_A=libluajit-i386.a
#cp -f src/libluajit-i386.a ./../luajit-ios


#make clean MACOSX_DEPLOYMENT_TARGET="10.12"
#git clean -f
#ISDKF="-arch x86_64 -isysroot $ISDK/SDKs/$ISDKVER -mios-simulator-version-min=$DEVTAR"
#make HOST_CC="gcc -m64 -arch x86_64" MACOSX_DEPLOYMENT_TARGET="10.12" CROSS=$ISDKP TARGET_FLAGS="$ISDKF" TARGET=x86_64 TARGET_SYS=iOS  LUAJIT_A=libluajit-x86_64.a CFLAGS=-DLUAJIT_ENABLE_GC64
#cp -f src/libluajit-x86_64.a ./../luajit-ios

make clean MACOSX_DEPLOYMENT_TARGET="10.12"
git clean -f

cd ..
cd luajit-ios
rm libluajit.a
#lipo -output libluajit.a  -create libsluav7.a libsluav7s.a libslua64.a libluajit-i386.a libluajit-x86_64.a
#rm libsluav7.a libsluav7s.a libslua64.a libluajit-i386.a libluajit-x86_64.a

lipo -output libluajit.a  -create libsluav7.a libsluav7s.a libslua64.a
rm libsluav7.a libsluav7s.a libslua64.a

#cd luajit-ios
#xcodebuild clean
#xcodebuild -configuration=Release -sdk iphonesimulator -arch i386
#cp build/Release-iphonesimulator/libslua.a ./libslua_i386.a

#xcodebuild clean
#xcodebuild -configuration=Release -sdk iphonesimulator -arch x86_64
#cp build/Release-iphonesimulator/libslua.a ./libslua_x86_64.a

xcodebuild clean
xcodebuild -configuration=Release

#cp build/Release-iphoneos/libslua.a ./libslua_arm.a
cp build/Release-iphoneos/libslua.a ./libslua.a

#lipo -output libslua.a -create libslua_i386.a libslua_x86_64.a libslua_arm.a
#rm libslua_i386.a libslua_x86_64.a libslua_arm.a

cp -f libslua.a ../../Assets/Plugins/iOS/

cd ..
