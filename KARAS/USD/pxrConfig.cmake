# - Configuration file for the pxr project
# Defines the following variables:
# PXR_INCLUDE_DIRS  - Root include directory for the installed project.
# PXR_LIBRARIES     - List of all libraries, by target name.
# PXR_foo_LIBRARY   - Absolute path to individual libraries.

set(PXR_CMAKE_DIR "/opt/local/USD")
include("${PXR_CMAKE_DIR}/cmake/pxrTargets.cmake")
set(libs "arch;tf;gf;js;tracelite;work;plug;vt;ar;kind;sdf;pcp;usd;usdGeom;usdLux;usdShade;usdHydra;usdRi;usdSkel;usdUI;usdUtils;usdAbc")
set(PXR_LIBRARIES "")
set(PXR_INCLUDE_DIRS "${PXR_CMAKE_DIR}/include")
string(REPLACE " " ";" libs "${libs}")
foreach(lib ${libs})
    get_target_property(location ${lib} LOCATION)
    set(PXR_${lib}_LIBRARY ${location})
    list(APPEND PXR_LIBRARIES ${lib})
endforeach()
