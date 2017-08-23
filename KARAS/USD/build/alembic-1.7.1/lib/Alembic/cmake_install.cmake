# Install script for directory: /opt/local/USD/src/alembic-1.7.1/lib/Alembic

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/opt/local/USD/build/alembic-1.7.1/lib/Alembic/libAlembic.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libAlembic.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libAlembic.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/opt/local/USD/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libAlembic.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libAlembic.dylib")
    endif()
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Alembic" TYPE FILE FILES
    "/opt/local/USD/build/alembic-1.7.1/lib/Alembic/AlembicConfig.cmake"
    "/opt/local/USD/build/alembic-1.7.1/lib/Alembic/AlembicConfigVersion.cmake"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Alembic/AlembicTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Alembic/AlembicTargets.cmake"
         "/opt/local/USD/build/alembic-1.7.1/lib/Alembic/CMakeFiles/Export/lib/cmake/Alembic/AlembicTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Alembic/AlembicTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/Alembic/AlembicTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Alembic" TYPE FILE FILES "/opt/local/USD/build/alembic-1.7.1/lib/Alembic/CMakeFiles/Export/lib/cmake/Alembic/AlembicTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/Alembic" TYPE FILE FILES "/opt/local/USD/build/alembic-1.7.1/lib/Alembic/CMakeFiles/Export/lib/cmake/Alembic/AlembicTargets-noconfig.cmake")
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/opt/local/USD/build/alembic-1.7.1/lib/Alembic/Util/cmake_install.cmake")
  include("/opt/local/USD/build/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/cmake_install.cmake")
  include("/opt/local/USD/build/alembic-1.7.1/lib/Alembic/AbcCoreOgawa/cmake_install.cmake")
  include("/opt/local/USD/build/alembic-1.7.1/lib/Alembic/Abc/cmake_install.cmake")
  include("/opt/local/USD/build/alembic-1.7.1/lib/Alembic/AbcCoreFactory/cmake_install.cmake")
  include("/opt/local/USD/build/alembic-1.7.1/lib/Alembic/AbcCoreLayer/cmake_install.cmake")
  include("/opt/local/USD/build/alembic-1.7.1/lib/Alembic/AbcGeom/cmake_install.cmake")
  include("/opt/local/USD/build/alembic-1.7.1/lib/Alembic/AbcCollection/cmake_install.cmake")
  include("/opt/local/USD/build/alembic-1.7.1/lib/Alembic/AbcMaterial/cmake_install.cmake")
  include("/opt/local/USD/build/alembic-1.7.1/lib/Alembic/Ogawa/cmake_install.cmake")

endif()

