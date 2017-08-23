# Install script for directory: /Users/sumioka_air/USD/pxr/usd/lib/usdGeom

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/usd/lib/usdGeom/libusdGeom.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/usd"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/kind"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/pcp"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/sdf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/ar"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/plug"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/js"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/work"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/vt"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tracelite"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/gf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libusdGeom.dylib")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pxr/usd/usdGeom" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/api.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/debugCodes.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/tokens.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/bboxCache.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/constraintTarget.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/primvar.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/xformCache.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/basisCurves.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/boundable.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/boundableComputeExtent.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/camera.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/capsule.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/cone.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/cube.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/curves.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/cylinder.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/collectionAPI.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/faceSetAPI.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/imageable.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/gprim.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/mesh.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/metrics.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/modelAPI.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/nurbsCurves.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/nurbsPatch.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/pointBased.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/pointInstancer.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/points.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/scope.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/sphere.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/xform.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/xformable.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/xformOp.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/xformCommonAPI.h"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/usd/plugins/usdGeom/resources" TYPE FILE FILES "/opt/local/USD/build/USD/pxr/usd/lib/usdGeom/plugInfo.json")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/usd/plugins/usdGeom/resources" TYPE FILE FILES "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/generatedSchema.usda")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/usd/lib/usdGeom/__init__.py"
    "/opt/local/USD/build/USD/pxr/usd/lib/usdGeom/__init__.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/usd/lib/usdGeom/_usdGeom.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/usdGeom"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/usd"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/kind"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/pcp"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/sdf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/ar"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/plug"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/js"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/vt"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/gf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/work"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tracelite"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/UsdGeom/_usdGeom.so")
    endif()
  endif()
endif()

