# Install script for directory: /opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfUtil

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
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/opt/local/USD/lib/libIlmImfUtil.22.0.0.dylib;/opt/local/USD/lib/libIlmImfUtil.22.dylib;/opt/local/USD/lib/libIlmImfUtil.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/opt/local/USD/lib" TYPE SHARED_LIBRARY FILES
    "/opt/local/USD/build/OpenEXR/IlmImfUtil/libIlmImfUtil.22.0.0.dylib"
    "/opt/local/USD/build/OpenEXR/IlmImfUtil/libIlmImfUtil.22.dylib"
    "/opt/local/USD/build/OpenEXR/IlmImfUtil/libIlmImfUtil.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}/opt/local/USD/lib/libIlmImfUtil.22.0.0.dylib"
      "$ENV{DESTDIR}/opt/local/USD/lib/libIlmImfUtil.22.dylib"
      "$ENV{DESTDIR}/opt/local/USD/lib/libIlmImfUtil.dylib"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/opt/local/USD/lib"
        "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/opt/local/USD/build/OpenEXR/IlmImfUtil/../IlmImf"
        "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/opt/local/USD/build/OpenEXR/IlmImf"
        "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/opt/local/USD/include/OpenEXR/ImfImageChannel.h;/opt/local/USD/include/OpenEXR/ImfFlatImageChannel.h;/opt/local/USD/include/OpenEXR/ImfDeepImageChannel.h;/opt/local/USD/include/OpenEXR/ImfSampleCountChannel.h;/opt/local/USD/include/OpenEXR/ImfImageLevel.h;/opt/local/USD/include/OpenEXR/ImfFlatImageLevel.h;/opt/local/USD/include/OpenEXR/ImfDeepImageLevel.h;/opt/local/USD/include/OpenEXR/ImfImage.h;/opt/local/USD/include/OpenEXR/ImfFlatImage.h;/opt/local/USD/include/OpenEXR/ImfDeepImage.h;/opt/local/USD/include/OpenEXR/ImfImageIO.h;/opt/local/USD/include/OpenEXR/ImfFlatImageIO.h;/opt/local/USD/include/OpenEXR/ImfDeepImageIO.h;/opt/local/USD/include/OpenEXR/ImfImageDataWindow.h;/opt/local/USD/include/OpenEXR/ImfImageChannelRenaming.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/opt/local/USD/include/OpenEXR" TYPE FILE FILES
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfUtil/ImfImageChannel.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfUtil/ImfFlatImageChannel.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfUtil/ImfDeepImageChannel.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfUtil/ImfSampleCountChannel.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfUtil/ImfImageLevel.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfUtil/ImfFlatImageLevel.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfUtil/ImfDeepImageLevel.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfUtil/ImfImage.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfUtil/ImfFlatImage.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfUtil/ImfDeepImage.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfUtil/ImfImageIO.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfUtil/ImfFlatImageIO.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfUtil/ImfDeepImageIO.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfUtil/ImfImageDataWindow.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfUtil/ImfImageChannelRenaming.h"
    )
endif()

