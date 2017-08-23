# Install script for directory: /Users/sumioka_air/USD/pxr/usd/lib/usd

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/usd/lib/usd/libusd.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/kind"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/pcp"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/sdf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/ar"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/plug"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/vt"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/work"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/js"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/gf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tracelite"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusd.dylib")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pxr/usd/usd" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/api.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/attribute.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/clipsAPI.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/attributeQuery.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/common.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/crateInfo.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/debugCodes.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/editContext.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/editTarget.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/inherits.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/interpolation.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/modelAPI.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/notice.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/object.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/prim.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/primData.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/primDataHandle.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/primFlags.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/primRange.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/property.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/pyEditContext.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/pyConversions.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/references.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/relationship.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/resolveInfo.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/resolver.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/schemaBase.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/schemaRegistry.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/specializes.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/stage.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/stageCache.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/stageCacheContext.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/stagePopulationMask.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/timeCode.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/tokens.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/typed.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/usdFileFormat.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/usdaFileFormat.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/usdcFileFormat.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/variantSets.h"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/usd/plugins/usd/resources" TYPE FILE FILES "/opt/local/USD/build/USD/pxr/usd/lib/usd/plugInfo.json")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/usd/plugins/usd/resources" TYPE FILE FILES "/Users/sumioka_air/USD/pxr/usd/lib/usd/generatedSchema.usda")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/usd/lib/usd/__init__.py"
    "/opt/local/USD/build/USD/pxr/usd/lib/usd/__init__.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/usd/lib/usd/_usd.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/usd"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/kind"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/pcp"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/sdf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/ar"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/plug"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/js"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/vt"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/gf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/work"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tracelite"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Usd/_usd.so")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM RENAME "usdGenSchema" FILES "/opt/local/USD/build/USD/pxr/usd/lib/usd/usdGenSchema")
endif()

