#!/bin/bash

set -e -x

flags=()

#change these to your XCode install path and the SDK version
xcodepath=/Applications/Xcode.app
sdkversion=10.7

sdk=$xcodepath/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX$sdkversion.sdk/
if [[ -e $sdk ]]; then
    flags+=(-mmacosx-version-min=10.4 -isysroot "$sdk")
fi

g++ -arch i386 -arch x86_64 "${flags[@]}" -o ldid ldid.cpp -I. -x c lookup2.c sha1.c
