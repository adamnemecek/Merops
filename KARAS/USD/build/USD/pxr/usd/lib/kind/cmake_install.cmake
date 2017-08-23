# Install script for directory: /Users/sumioka_air/USD/pxr/usd/lib/kind

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/usd/lib/kind/libkind.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkind.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkind.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/plug"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkind.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/js"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkind.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/work"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkind.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkind.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkind.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkind.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tracelite"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkind.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkind.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkind.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkind.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkind.dylib")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pxr/usd/kind" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/usd/lib/kind/api.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/kind/registry.h"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Kind" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/usd/lib/kind/__init__.py"
    "/opt/local/USD/build/USD/pxr/usd/lib/kind/__init__.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Kind" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/usd/lib/kind/_kind.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Kind/_kind.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Kind/_kind.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/kind"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Kind/_kind.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/plug"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Kind/_kind.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/js"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Kind/_kind.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/work"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Kind/_kind.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Kind/_kind.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Kind/_kind.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Kind/_kind.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tracelite"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Kind/_kind.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Kind/_kind.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Kind/_kind.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Kind/_kind.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Kind/_kind.so")
    endif()
  endif()
endif()

