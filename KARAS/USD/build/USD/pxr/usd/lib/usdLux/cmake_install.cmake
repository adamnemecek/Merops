# Install script for directory: /Users/sumioka_air/USD/pxr/usd/lib/usdLux

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/usd/lib/usdLux/libusdLux.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/usdGeom"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/usd"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/kind"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/pcp"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/sdf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/ar"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/vt"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/gf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/plug"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/work"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tracelite"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/js"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdLux.dylib")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pxr/usd/usdLux" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/api.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/blackbody.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/diskLight.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/distantLight.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/domeLight.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/geometryLight.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/light.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/listAPI.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/linkingAPI.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/shapingAPI.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/shadowAPI.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/lightFilter.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/lightPortal.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/rectLight.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/sphereLight.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/tokens.h"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/usd/plugins/usdLux/resources" TYPE FILE FILES "/opt/local/USD/build/USD/pxr/usd/lib/usdLux/plugInfo.json")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/usd/plugins/usdLux/resources" TYPE FILE FILES "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/generatedSchema.usda")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/usd/lib/usdLux/__init__.py"
    "/opt/local/USD/build/USD/pxr/usd/lib/usdLux/__init__.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/usd/lib/usdLux/_usdLux.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/usdLux"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/usdGeom"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/usd"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/kind"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/pcp"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/sdf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/ar"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/vt"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/gf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/plug"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/work"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tracelite"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/js"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdLux/_usdLux.so")
    endif()
  endif()
endif()

