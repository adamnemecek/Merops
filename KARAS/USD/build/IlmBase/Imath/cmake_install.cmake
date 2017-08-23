# Install script for directory: /opt/local/USD/src/openexr-2.2.0/IlmBase/Imath

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
    set(CMAKE_INSTALL_CONFIG_NAME "")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/opt/local/USD/build/IlmBase/Imath/libImath.12.0.0.dylib"
    "/opt/local/USD/build/IlmBase/Imath/libImath.12.dylib"
    "/opt/local/USD/build/IlmBase/Imath/libImath.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libImath.12.0.0.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libImath.12.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libImath.dylib"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/opt/local/USD/build/IlmBase/Iex"
        "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OpenEXR" TYPE FILE FILES
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathBoxAlgo.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathBox.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathColorAlgo.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathColor.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathEuler.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathExc.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathExport.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathForward.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathFrame.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathFrustum.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathFrustumTest.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathFun.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathGL.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathGLU.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathHalfLimits.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathInt64.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathInterval.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathLimits.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathLineAlgo.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathLine.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathMath.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathMatrixAlgo.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathMatrix.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathNamespace.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathPlane.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathPlatform.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathQuat.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathRandom.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathRoots.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathShear.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathSphere.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathVecAlgo.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Imath/ImathVec.h"
    )
endif()

