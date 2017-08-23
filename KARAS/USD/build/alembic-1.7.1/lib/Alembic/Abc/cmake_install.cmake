# Install script for directory: /opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Alembic/Abc" TYPE FILE FILES
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/All.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/Base.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/ErrorHandler.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/Foundation.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/Argument.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/ArchiveInfo.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/IArchive.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/IArrayProperty.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/IBaseProperty.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/ICompoundProperty.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/IObject.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/ISampleSelector.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/IScalarProperty.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/ISchema.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/ISchemaObject.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/ITypedArrayProperty.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/ITypedScalarProperty.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/OArchive.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/OArrayProperty.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/OBaseProperty.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/OCompoundProperty.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/OObject.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/OScalarProperty.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/OSchema.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/OSchemaObject.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/OTypedArrayProperty.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/OTypedScalarProperty.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/Reference.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/SourceName.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/TypedArraySample.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Abc/TypedPropertyTraits.h"
    )
endif()

