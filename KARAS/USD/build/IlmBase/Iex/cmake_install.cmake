# Install script for directory: /opt/local/USD/src/openexr-2.2.0/IlmBase/Iex

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
    "/opt/local/USD/build/IlmBase/Iex/libIex.12.0.0.dylib"
    "/opt/local/USD/build/IlmBase/Iex/libIex.12.dylib"
    "/opt/local/USD/build/IlmBase/Iex/libIex.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libIex.12.0.0.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libIex.12.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libIex.dylib"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OpenEXR" TYPE FILE FILES
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Iex/IexBaseExc.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Iex/IexMathExc.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Iex/IexThrowErrnoExc.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Iex/IexErrnoExc.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Iex/IexMacros.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Iex/Iex.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Iex/IexNamespace.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Iex/IexExport.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/Iex/IexForward.h"
    )
endif()

