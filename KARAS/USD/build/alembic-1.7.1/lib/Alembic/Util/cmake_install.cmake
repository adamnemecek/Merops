# Install script for directory: /opt/local/USD/src/alembic-1.7.1/lib/Alembic/Util

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Alembic/Util" TYPE FILE FILES
    "/opt/local/USD/build/alembic-1.7.1/lib/Alembic/Util/Config.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Util/Digest.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Util/Dimensions.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Util/Exception.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Util/Export.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Util/Foundation.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Util/Murmur3.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Util/Naming.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Util/OperatorBool.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Util/PlainOldDataType.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Util/SpookyV2.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Util/TokenMap.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/Util/All.h"
    )
endif()

