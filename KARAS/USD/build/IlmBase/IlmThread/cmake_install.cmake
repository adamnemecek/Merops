# Install script for directory: /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread

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
    "/opt/local/USD/build/IlmBase/IlmThread/libIlmThread.12.0.0.dylib"
    "/opt/local/USD/build/IlmBase/IlmThread/libIlmThread.12.dylib"
    "/opt/local/USD/build/IlmBase/IlmThread/libIlmThread.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libIlmThread.12.0.0.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libIlmThread.12.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libIlmThread.dylib"
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
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadPool.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThread.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadSemaphore.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadMutex.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadNamespace.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadExport.h"
    "/opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadForward.h"
    )
endif()

