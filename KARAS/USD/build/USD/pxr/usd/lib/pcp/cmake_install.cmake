# Install script for directory: /Users/sumioka_air/USD/pxr/usd/lib/pcp

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/usd/lib/pcp/libpcp.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/sdf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/ar"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/vt"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/plug"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/work"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tracelite"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/js"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/gf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcp.dylib")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pxr/usd/pcp" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/api.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/arc.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/cache.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/changes.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/composeSite.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/dependency.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/errors.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/instanceKey.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/iterator.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/layerPrefetchRequest.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/layerStack.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/layerStackIdentifier.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/mapExpression.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/mapFunction.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/namespaceEdits.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/node.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/pathTranslation.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/payloadContext.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/payloadDecorator.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/primIndex.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/propertyIndex.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/pyUtils.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/site.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/strengthOrdering.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/targetIndex.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/types.h"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/usd/lib/pcp/__init__.py"
    "/opt/local/USD/build/USD/pxr/usd/lib/pcp/__init__.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/usd/lib/pcp/_pcp.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/pcp"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/sdf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/ar"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/vt"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/gf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/plug"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/work"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tracelite"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/js"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Pcp/_pcp.so")
    endif()
  endif()
endif()

