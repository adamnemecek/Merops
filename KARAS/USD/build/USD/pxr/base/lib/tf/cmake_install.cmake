# Install script for directory: /Users/sumioka_air/USD/pxr/base/lib/tf

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/base/lib/tf/libtf.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtf.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtf.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtf.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libtf.dylib")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pxr/base/tf" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/base/lib/tf/api.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/callContext.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/cxxCast.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/declarePtrs.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/diagnosticLite.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/hashmap.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/hashset.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/instantiateSingleton.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/instantiateStacked.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/instantiateType.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/preprocessorUtils.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyStaticTokens.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/preprocessorUtilsLite.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/safeTypeCompare.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/staticData.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/staticTokens.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/typeInfoMap.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/type_Impl.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/anyWeakPtr.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/atomicOfstreamWrapper.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/bitUtils.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/copyOnWritePtr.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/debug.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/debugNotice.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/denseHashMap.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/denseHashSet.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/diagnostic.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/diagnosticBase.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/diagnosticHelper.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/diagnosticMgr.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/diagnosticNotice.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/dl.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/enum.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/envSetting.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/error.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/errorMark.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/errorTransport.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/expiryNotifier.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/fileUtils.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/flyweight.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/getenv.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/hash.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/iterator.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/makePyConstructor.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/mallocTag.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/move.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/notice.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/nullPtr.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/ostreamMethods.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pathUtils.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/patternMatcher.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pointerAndBits.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/poolAllocator.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyAnnotatedBoolResult.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyArg.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyCall.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyCallContext.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyClassMethod.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyContainerConversions.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyEnum.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyError.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyExceptionState.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyFunction.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyIdentity.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyInterpreter.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyLock.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyModule.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyModuleNotice.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyNoticeWrapper.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyObjectFinder.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyObjWrapper.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyOptional.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyOverride.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyPolymorphic.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyPtrHelpers.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyResultConversions.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pySingleton.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyTracing.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyUtils.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyWeakObject.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/pyWrapContext.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/refBase.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/refCount.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/refPtr.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/refPtrTracker.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/regTest.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/registryManager.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/scoped.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/scopeDescription.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/scriptModuleLoader.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/setenv.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/singleton.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/stackTrace.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/stacked.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/status.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/stl.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/stopwatch.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/stringUtils.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/templateString.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/tf.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/timeStamp.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/token.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/traits.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/type.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/typeFunctions.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/typeNotice.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/warning.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/weakBase.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/weakPtr.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/weakPtrFacade.h"
    "/Users/sumioka_air/USD/pxr/base/lib/tf/wrapTypeHelpers.h"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/base/lib/tf/__init__.py"
    "/opt/local/USD/build/USD/pxr/base/lib/tf/__init__.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/testenv" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/base/lib/tf/testenv/__init__.py"
    "/opt/local/USD/build/USD/pxr/base/lib/tf/testenv/__init__.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/testenv" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/base/lib/tf/testenv/testTfScriptModuleLoader_AAA_RaisesError.py"
    "/opt/local/USD/build/USD/pxr/base/lib/tf/testenv/testTfScriptModuleLoader_AAA_RaisesError.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/testenv" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/base/lib/tf/testenv/testTfScriptModuleLoader_DepLoadsAll.py"
    "/opt/local/USD/build/USD/pxr/base/lib/tf/testenv/testTfScriptModuleLoader_DepLoadsAll.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/testenv" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/base/lib/tf/testenv/testTfScriptModuleLoader_LoadsAll.py"
    "/opt/local/USD/build/USD/pxr/base/lib/tf/testenv/testTfScriptModuleLoader_LoadsAll.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/testenv" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/base/lib/tf/testenv/testTfScriptModuleLoader_LoadsUnknown.py"
    "/opt/local/USD/build/USD/pxr/base/lib/tf/testenv/testTfScriptModuleLoader_LoadsUnknown.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/testenv" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/base/lib/tf/testenv/testTfScriptModuleLoader_Other.py"
    "/opt/local/USD/build/USD/pxr/base/lib/tf/testenv/testTfScriptModuleLoader_Other.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/testenv" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/base/lib/tf/testenv/testTfScriptModuleLoader_Test.py"
    "/opt/local/USD/build/USD/pxr/base/lib/tf/testenv/testTfScriptModuleLoader_Test.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/testenv" TYPE FILE FILES
    "/Users/sumioka_air/USD/pxr/base/lib/tf/testenv/testTfScriptModuleLoader_Unknown.py"
    "/opt/local/USD/build/USD/pxr/base/lib/tf/testenv/testTfScriptModuleLoader_Unknown.pyc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/USD/pxr/base/lib/tf/_tf.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/_tf.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/_tf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/tf"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/_tf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/build/USD/pxr/base/lib/arch"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/_tf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/_tf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/_tf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/_tf.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/_tf.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/python/pxr/Tf/_tf.so")
    endif()
  endif()
endif()

