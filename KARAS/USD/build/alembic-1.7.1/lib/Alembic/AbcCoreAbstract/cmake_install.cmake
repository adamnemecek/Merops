# Install script for directory: /opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Alembic/AbcCoreAbstract" TYPE FILE FILES
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/All.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/ForwardDeclarations.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/ArraySample.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/ArraySampleKey.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/ReadArraySampleCache.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/ScalarSample.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/DataType.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/Foundation.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/MetaData.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/ObjectHeader.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/PropertyHeader.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/TimeSampling.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/TimeSamplingType.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/BasePropertyWriter.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/ScalarPropertyWriter.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/ArrayPropertyWriter.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/CompoundPropertyWriter.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/ObjectWriter.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/ArchiveWriter.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/BasePropertyReader.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/ScalarPropertyReader.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/ArrayPropertyReader.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/CompoundPropertyReader.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/ObjectReader.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcCoreAbstract/ArchiveReader.h"
    )
endif()

