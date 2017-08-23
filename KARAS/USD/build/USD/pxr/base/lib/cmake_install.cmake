# Install script for directory: /Users/sumioka_air/USD/pxr/base/lib

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
  include("/opt/local/USD/build/USD/pxr/base/lib/arch/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/base/lib/tf/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/base/lib/gf/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/base/lib/js/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/base/lib/tracelite/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/base/lib/work/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/base/lib/plug/cmake_install.cmake")
  include("/opt/local/USD/build/USD/pxr/base/lib/vt/cmake_install.cmake")

endif()

