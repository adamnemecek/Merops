# Install script for directory: /opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf

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
   "/opt/local/USD/lib/libIlmImf.22.0.0.dylib;/opt/local/USD/lib/libIlmImf.22.dylib;/opt/local/USD/lib/libIlmImf.dylib")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/opt/local/USD/lib" TYPE SHARED_LIBRARY FILES
    "/opt/local/USD/build/OpenEXR/IlmImf/libIlmImf.22.0.0.dylib"
    "/opt/local/USD/build/OpenEXR/IlmImf/libIlmImf.22.dylib"
    "/opt/local/USD/build/OpenEXR/IlmImf/libIlmImf.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}/opt/local/USD/lib/libIlmImf.22.0.0.dylib"
      "$ENV{DESTDIR}/opt/local/USD/lib/libIlmImf.22.dylib"
      "$ENV{DESTDIR}/opt/local/USD/lib/libIlmImf.dylib"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/opt/local/USD/lib"
        "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/opt/local/USD/include/OpenEXR/ImfForward.h;/opt/local/USD/include/OpenEXR/ImfExport.h;/opt/local/USD/include/OpenEXR/ImfAttribute.h;/opt/local/USD/include/OpenEXR/ImfBoxAttribute.h;/opt/local/USD/include/OpenEXR/ImfCRgbaFile.h;/opt/local/USD/include/OpenEXR/ImfChannelList.h;/opt/local/USD/include/OpenEXR/ImfChannelListAttribute.h;/opt/local/USD/include/OpenEXR/ImfCompressionAttribute.h;/opt/local/USD/include/OpenEXR/ImfDoubleAttribute.h;/opt/local/USD/include/OpenEXR/ImfFloatAttribute.h;/opt/local/USD/include/OpenEXR/ImfFrameBuffer.h;/opt/local/USD/include/OpenEXR/ImfHeader.h;/opt/local/USD/include/OpenEXR/ImfIO.h;/opt/local/USD/include/OpenEXR/ImfInputFile.h;/opt/local/USD/include/OpenEXR/ImfIntAttribute.h;/opt/local/USD/include/OpenEXR/ImfLineOrderAttribute.h;/opt/local/USD/include/OpenEXR/ImfMatrixAttribute.h;/opt/local/USD/include/OpenEXR/ImfOpaqueAttribute.h;/opt/local/USD/include/OpenEXR/ImfOutputFile.h;/opt/local/USD/include/OpenEXR/ImfRgbaFile.h;/opt/local/USD/include/OpenEXR/ImfStringAttribute.h;/opt/local/USD/include/OpenEXR/ImfVecAttribute.h;/opt/local/USD/include/OpenEXR/ImfHuf.h;/opt/local/USD/include/OpenEXR/ImfWav.h;/opt/local/USD/include/OpenEXR/ImfLut.h;/opt/local/USD/include/OpenEXR/ImfArray.h;/opt/local/USD/include/OpenEXR/ImfCompression.h;/opt/local/USD/include/OpenEXR/ImfLineOrder.h;/opt/local/USD/include/OpenEXR/ImfName.h;/opt/local/USD/include/OpenEXR/ImfPixelType.h;/opt/local/USD/include/OpenEXR/ImfVersion.h;/opt/local/USD/include/OpenEXR/ImfXdr.h;/opt/local/USD/include/OpenEXR/ImfConvert.h;/opt/local/USD/include/OpenEXR/ImfPreviewImage.h;/opt/local/USD/include/OpenEXR/ImfPreviewImageAttribute.h;/opt/local/USD/include/OpenEXR/ImfChromaticities.h;/opt/local/USD/include/OpenEXR/ImfChromaticitiesAttribute.h;/opt/local/USD/include/OpenEXR/ImfKeyCode.h;/opt/local/USD/include/OpenEXR/ImfKeyCodeAttribute.h;/opt/local/USD/include/OpenEXR/ImfTimeCode.h;/opt/local/USD/include/OpenEXR/ImfTimeCodeAttribute.h;/opt/local/USD/include/OpenEXR/ImfRational.h;/opt/local/USD/include/OpenEXR/ImfRationalAttribute.h;/opt/local/USD/include/OpenEXR/ImfFramesPerSecond.h;/opt/local/USD/include/OpenEXR/ImfStandardAttributes.h;/opt/local/USD/include/OpenEXR/ImfEnvmap.h;/opt/local/USD/include/OpenEXR/ImfEnvmapAttribute.h;/opt/local/USD/include/OpenEXR/ImfInt64.h;/opt/local/USD/include/OpenEXR/ImfRgba.h;/opt/local/USD/include/OpenEXR/ImfTileDescription.h;/opt/local/USD/include/OpenEXR/ImfTileDescriptionAttribute.h;/opt/local/USD/include/OpenEXR/ImfTiledInputFile.h;/opt/local/USD/include/OpenEXR/ImfTiledOutputFile.h;/opt/local/USD/include/OpenEXR/ImfTiledRgbaFile.h;/opt/local/USD/include/OpenEXR/ImfRgbaYca.h;/opt/local/USD/include/OpenEXR/ImfTestFile.h;/opt/local/USD/include/OpenEXR/ImfThreading.h;/opt/local/USD/include/OpenEXR/ImfB44Compressor.h;/opt/local/USD/include/OpenEXR/ImfStringVectorAttribute.h;/opt/local/USD/include/OpenEXR/ImfMultiView.h;/opt/local/USD/include/OpenEXR/ImfAcesFile.h;/opt/local/USD/include/OpenEXR/ImfMultiPartOutputFile.h;/opt/local/USD/include/OpenEXR/ImfGenericOutputFile.h;/opt/local/USD/include/OpenEXR/ImfMultiPartInputFile.h;/opt/local/USD/include/OpenEXR/ImfGenericInputFile.h;/opt/local/USD/include/OpenEXR/ImfPartType.h;/opt/local/USD/include/OpenEXR/ImfPartHelper.h;/opt/local/USD/include/OpenEXR/ImfOutputPart.h;/opt/local/USD/include/OpenEXR/ImfTiledOutputPart.h;/opt/local/USD/include/OpenEXR/ImfInputPart.h;/opt/local/USD/include/OpenEXR/ImfTiledInputPart.h;/opt/local/USD/include/OpenEXR/ImfDeepScanLineOutputFile.h;/opt/local/USD/include/OpenEXR/ImfDeepScanLineOutputPart.h;/opt/local/USD/include/OpenEXR/ImfDeepScanLineInputFile.h;/opt/local/USD/include/OpenEXR/ImfDeepScanLineInputPart.h;/opt/local/USD/include/OpenEXR/ImfDeepTiledInputFile.h;/opt/local/USD/include/OpenEXR/ImfDeepTiledInputPart.h;/opt/local/USD/include/OpenEXR/ImfDeepTiledOutputFile.h;/opt/local/USD/include/OpenEXR/ImfDeepTiledOutputPart.h;/opt/local/USD/include/OpenEXR/ImfDeepFrameBuffer.h;/opt/local/USD/include/OpenEXR/ImfDeepCompositing.h;/opt/local/USD/include/OpenEXR/ImfCompositeDeepScanLine.h;/opt/local/USD/include/OpenEXR/ImfNamespace.h;/opt/local/USD/include/OpenEXR/ImfMisc.h;/opt/local/USD/include/OpenEXR/ImfDeepImageState.h;/opt/local/USD/include/OpenEXR/ImfDeepImageStateAttribute.h;/opt/local/USD/include/OpenEXR/ImfFloatVectorAttribute.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/opt/local/USD/include/OpenEXR" TYPE FILE FILES
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfForward.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfExport.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfBoxAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfCRgbaFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfChannelList.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfChannelListAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfCompressionAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfDoubleAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfFloatAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfFrameBuffer.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfHeader.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfIO.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfInputFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfIntAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfLineOrderAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfMatrixAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfOpaqueAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfOutputFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfRgbaFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfStringAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfVecAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfHuf.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfWav.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfLut.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfArray.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfCompression.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfLineOrder.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfName.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfPixelType.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfVersion.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfXdr.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfConvert.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfPreviewImage.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfPreviewImageAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfChromaticities.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfChromaticitiesAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfKeyCode.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfKeyCodeAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfTimeCode.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfTimeCodeAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfRational.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfRationalAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfFramesPerSecond.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfStandardAttributes.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfEnvmap.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfEnvmapAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfInt64.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfRgba.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfTileDescription.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfTileDescriptionAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfTiledInputFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfTiledOutputFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfTiledRgbaFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfRgbaYca.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfTestFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfThreading.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfB44Compressor.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfStringVectorAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfMultiView.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfAcesFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfMultiPartOutputFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfGenericOutputFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfMultiPartInputFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfGenericInputFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfPartType.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfPartHelper.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfOutputPart.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfTiledOutputPart.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfInputPart.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfTiledInputPart.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfDeepScanLineOutputFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfDeepScanLineOutputPart.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfDeepScanLineInputFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfDeepScanLineInputPart.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfDeepTiledInputFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfDeepTiledInputPart.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfDeepTiledOutputFile.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfDeepTiledOutputPart.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfDeepFrameBuffer.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfDeepCompositing.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfCompositeDeepScanLine.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfNamespace.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfMisc.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfDeepImageState.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfDeepImageStateAttribute.h"
    "/opt/local/USD/src/openexr-2.2.0/OpenEXR/IlmImf/ImfFloatVectorAttribute.h"
    )
endif()

