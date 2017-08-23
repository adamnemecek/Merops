# Install script for directory: /Users/sumioka_air/USD/pxr/usd/lib

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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/opt/local/USD/build/USD/pxr/usd/lib/ar/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/usd/lib/kind/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/usd/lib/sdf/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/usd/lib/pcp/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/usd/lib/usd/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/usd/lib/usdGeom/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/usd/lib/usdLux/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/usd/lib/usdShade/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/usd/lib/usdHydra/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/usd/lib/usdRi/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/usd/lib/usdSkel/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/usd/lib/usdUI/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/usd/lib/usdUtils/cmake_install.cmake")

endif()

