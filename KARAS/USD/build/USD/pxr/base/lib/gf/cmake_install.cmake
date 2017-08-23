# Install script for directory: /Users/sumioka_air/USD/pxr/base/lib/gf

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/base/lib/gf/libgf.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgf.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgf.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgf.dylib")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pxr/base/gf" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/base/lib/gf/api.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/declare.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/limits.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/traits.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/bbox3d.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/camera.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/frustum.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/gamma.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/half.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/homogeneous.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/ilmbase_half.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/interval.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/line.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/line2d.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/lineSeg.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/lineSeg2d.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/math.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/matrixData.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/matrix2d.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/matrix2f.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/matrix3f.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/matrix3d.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/matrix4f.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/matrix4d.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/multiInterval.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/plane.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/pyBufferUtils.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/quatd.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/quatf.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/quath.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/quaternion.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/range1d.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/range1f.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/range2d.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/range2f.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/range3d.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/range3f.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/ray.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/rect2i.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/rotation.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/size2.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/size3.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/transform.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/vec2d.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/vec2f.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/vec2h.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/vec2i.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/vec3d.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/vec3f.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/vec3h.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/vec3i.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/vec4d.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/vec4f.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/vec4h.h"
    "/Users/sumioka_air/USD/pxr/base/lib/gf/vec4i.h"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Gf" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/base/lib/gf/__init__.py"
    "/opt/local/USD/build/USD/pxr/base/lib/gf/__init__.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Gf" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/base/lib/gf/_gf.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Gf/_gf.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Gf/_gf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/gf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Gf/_gf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Gf/_gf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Gf/_gf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Gf/_gf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Gf/_gf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Gf/_gf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Gf/_gf.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Gf/_gf.so")
    endif()
  endif()
endif()

