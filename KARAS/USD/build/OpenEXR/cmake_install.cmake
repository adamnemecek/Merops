# Install script for directory: /opt/local/USD/src/openexr-2.2.0/OpenEXR

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
   "/opt/local/USD/include/OpenEXR/OpenEXRConfig.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/opt/local/USD/include/OpenEXR" TYPE FILE FILES "/opt/local/USD/build/OpenEXR/config/OpenEXRConfig.h")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/opt/local/USD/share/doc/OpenEXR-2.2.0/TechnicalIntroduction.pdf;/opt/local/USD/share/doc/OpenEXR-2.2.0/ReadingAndWritingImageFiles.pdf;/opt/local/USD/share/doc/OpenEXR-2.2.0/OpenEXRFileLayout.pdf;/opt/local/USD/share/doc/OpenEXR-2.2.0/MultiViewOpenEXR.pdf;/opt/local/USD/share/doc/OpenEXR-2.2.0/InterpretingDeepPixels.pdf;/opt/local/USD/share/doc/OpenEXR-2.2.0/TheoryDeepPixels.pdf")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/opt/local/USD/share/doc/OpenEXR-2.2.0" TYPE FILE FILES
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/doc/TechnicalIntroduction.pdf"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/doc/ReadingAndWritingImageFiles.pdf"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/doc/OpenEXRFileLayout.pdf"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/doc/MultiViewOpenEXR.pdf"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/doc/InterpretingDeepPixels.pdf"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/doc/TheoryDeepPixels.pdf"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/opt/local/USD/share/doc/OpenEXR-2.2.0/examples/main.cpp;/opt/local/USD/share/doc/OpenEXR-2.2.0/examples/drawImage.cpp;/opt/local/USD/share/doc/OpenEXR-2.2.0/examples/rgbaInterfaceExamples.cpp;/opt/local/USD/share/doc/OpenEXR-2.2.0/examples/rgbaInterfaceTiledExamples.cpp;/opt/local/USD/share/doc/OpenEXR-2.2.0/examples/generalInterfaceExamples.cpp;/opt/local/USD/share/doc/OpenEXR-2.2.0/examples/lowLevelIoExamples.cpp;/opt/local/USD/share/doc/OpenEXR-2.2.0/examples/previewImageExamples.cpp;/opt/local/USD/share/doc/OpenEXR-2.2.0/examples/generalInterfaceTiledExamples.cpp;/opt/local/USD/share/doc/OpenEXR-2.2.0/examples/generalInterfaceTiledExamples.h;/opt/local/USD/share/doc/OpenEXR-2.2.0/examples/drawImage.h;/opt/local/USD/share/doc/OpenEXR-2.2.0/examples/rgbaInterfaceExamples.h;/opt/local/USD/share/doc/OpenEXR-2.2.0/examples/generalInterfaceExamples.h;/opt/local/USD/share/doc/OpenEXR-2.2.0/examples/rgbaInterfaceTiledExamples.h;/opt/local/USD/share/doc/OpenEXR-2.2.0/examples/lowLevelIoExamples.h;/opt/local/USD/share/doc/OpenEXR-2.2.0/examples/previewImageExamples.h;/opt/local/USD/share/doc/OpenEXR-2.2.0/examples/namespaceAlias.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/opt/local/USD/share/doc/OpenEXR-2.2.0/examples" TYPE FILE FILES
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfExamples/main.cpp"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfExamples/drawImage.cpp"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfExamples/rgbaInterfaceExamples.cpp"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfExamples/rgbaInterfaceTiledExamples.cpp"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfExamples/generalInterfaceExamples.cpp"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfExamples/lowLevelIoExamples.cpp"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfExamples/previewImageExamples.cpp"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfExamples/generalInterfaceTiledExamples.cpp"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfExamples/generalInterfaceTiledExamples.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfExamples/drawImage.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfExamples/rgbaInterfaceExamples.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfExamples/generalInterfaceExamples.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfExamples/rgbaInterfaceTiledExamples.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfExamples/lowLevelIoExamples.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfExamples/previewImageExamples.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImfExamples/namespaceAlias.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/opt/local/USD/build/OpenEXR/IlmImf/cmake_install.cmake")
  include("/opt/local/USD/build/OpenEXR/IlmImfUtil/cmake_install.cmake")
  include("/opt/local/USD/build/OpenEXR/IlmImfExamples/cmake_install.cmake")
  include("/opt/local/USD/build/OpenEXR/IlmImfTest/cmake_install.cmake")
  include("/opt/local/USD/build/OpenEXR/IlmImfUtilTest/cmake_install.cmake")
  include("/opt/local/USD/build/OpenEXR/IlmImfFuzzTest/cmake_install.cmake")
  include("/opt/local/USD/build/OpenEXR/exrheader/cmake_install.cmake")
  include("/opt/local/USD/build/OpenEXR/exrmaketiled/cmake_install.cmake")
  include("/opt/local/USD/build/OpenEXR/exrstdattr/cmake_install.cmake")
  include("/opt/local/USD/build/OpenEXR/exrmakepreview/cmake_install.cmake")
  include("/opt/local/USD/build/OpenEXR/exrenvmap/cmake_install.cmake")
  include("/opt/local/USD/build/OpenEXR/exrmultiview/cmake_install.cmake")
  include("/opt/local/USD/build/OpenEXR/exrmultipart/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/opt/local/USD/build/OpenEXR/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
