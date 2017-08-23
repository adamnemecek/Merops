# Install script for directory: /Users/sumioka_air/USD/pxr/usd/lib/sdf

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/usd/lib/sdf/libsdf.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsdf.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsdf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/ar"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsdf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsdf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/vt"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsdf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/gf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsdf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/plug"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsdf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/work"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsdf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tracelite"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsdf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/js"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsdf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsdf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsdf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsdf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsdf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsdf.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libsdf.dylib")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pxr/usd/sdf" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/api.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/accessorHelpers.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/declareSpec.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/schemaTypeRegistration.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/abstractData.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/allowed.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/assetPath.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/attributeSpec.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/changeBlock.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/changeList.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/children.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/childrenPolicies.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/childrenProxy.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/childrenUtils.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/childrenView.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/cleanupEnabler.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/data.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/declareHandles.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/fileFormat.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/identity.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/layer.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/layerBase.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/layerOffset.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/layerStateDelegate.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/layerTree.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/layerUtils.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/listProxy.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/listEditor.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/listEditorProxy.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/listOp.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/mapperArgSpec.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/mapperSpec.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/mapEditProxy.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/mapEditor.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/namespaceEdit.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/notice.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/path.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/pathNode.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/pathTable.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/payload.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/primSpec.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/propertySpec.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/proxyPolicies.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/proxyTypes.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/pseudoRootSpec.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/pyChildrenProxy.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/pyChildrenView.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/pyListEditorProxy.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/pyListOp.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/pyListProxy.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/pyMapEditProxy.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/pyMarkerProxy.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/pySpec.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/pyUtils.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/reference.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/relationshipSpec.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/schema.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/site.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/siteUtils.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/spec.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/specType.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/textFileFormat.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/textReferenceParser.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/tokens.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/types.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/valueTypeName.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/variantSetSpec.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/variantSpec.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/layerIdentifier.tab.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/path.tab.h"
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/textFileFormat.tab.h"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/usd/plugins/sdf/resources" TYPE FILE FILES "/opt/local/USD/build/USD/pxr/usd/lib/sdf/plugInfo.json")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/usd/lib/sdf/__init__.py"
    "/opt/local/USD/build/USD/pxr/usd/lib/sdf/__init__.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/usd/lib/sdf/_sdf.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/sdf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/usd/lib/ar"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/vt"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/gf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/plug"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/work"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tracelite"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/js"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Sdf/_sdf.so")
    endif()
  endif()
endif()

