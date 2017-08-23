# Install script for directory: /Users/sumioka_air/USD/pxr/base/lib/arch

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/opt/local/USD")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/base/lib/arch/libarch.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libarch.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libarch.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libarch.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libarch.dylib")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pxr/base/arch" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/base/lib/arch/align.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/api.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/buildMode.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/defines.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/export.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/functionLite.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/hints.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/inttypes.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/math.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/pragmas.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/attributes.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/daemon.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/debugger.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/demangle.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/env.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/error.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/errno.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/fileSystem.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/function.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/hash.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/library.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/mallocHook.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/regex.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/stackTrace.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/symbols.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/systemInfo.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/threads.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/timing.h"
    "/Users/sumioka_air/USD/pxr/base/lib/arch/vsnprintf.h"
    )
endif()

