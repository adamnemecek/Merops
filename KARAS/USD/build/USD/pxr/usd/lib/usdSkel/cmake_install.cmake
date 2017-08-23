# Install script for directory: /Users/sumioka_air/USD/pxr/usd/lib/usdSkel

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/usd/lib/usdSkel/libusdSkel.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/usdGeom"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/usd"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/kind"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/pcp"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/sdf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/ar"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/vt"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/gf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/plug"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/work"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tracelite"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/js"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdSkel.dylib")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pxr/usd/usdSkel" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/usd/lib/usdSkel/api.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdSkel/joint.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdSkel/skeleton.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdSkel/packedJointAnimation.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdSkel/bindingAPI.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdSkel/tokens.h"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/usd/plugins/usdSkel/resources" TYPE FILE FILES "/Users/sumioka_air/USD/pxr/usd/lib/usdSkel/generatedSchema.usda")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/usd/plugins/usdSkel/resources" TYPE FILE FILES "/opt/local/USD/build/USD/pxr/usd/lib/usdSkel/plugInfo.json")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/usd/lib/usdSkel/__init__.py"
    "/opt/local/USD/build/USD/pxr/usd/lib/usdSkel/__init__.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/usd/lib/usdSkel/_usdSkel.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/usdSkel"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/usdGeom"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/usd"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/kind"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/pcp"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/sdf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/ar"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/vt"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/gf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/plug"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/work"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tracelite"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/js"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdSkel/_usdSkel.so")
    endif()
  endif()
endif()

