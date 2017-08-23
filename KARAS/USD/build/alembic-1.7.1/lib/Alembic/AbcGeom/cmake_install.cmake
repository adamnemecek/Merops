# Install script for directory: /opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/Alembic/AbcGeom" TYPE FILE FILES
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/All.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/Foundation.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/ArchiveBounds.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/IGeomBase.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/OGeomBase.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/GeometryScope.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/SchemaInfoDeclarations.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/OLight.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/ILight.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/FilmBackXformOp.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/CameraSample.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/ICamera.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/OCamera.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/Basis.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/CurveType.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/ICurves.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/OCurves.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/FaceSetExclusivity.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/OFaceSet.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/IFaceSet.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/ONuPatch.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/INuPatch.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/OGeomParam.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/IGeomParam.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/OPoints.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/IPoints.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/OPolyMesh.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/IPolyMesh.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/OSubD.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/ISubD.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/Visibility.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/XformOp.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/XformSample.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/IXform.h"
    "/opt/local/USD/src/alembic-1.7.1/lib/Alembic/AbcGeom/OXform.h"
    )
endif()

