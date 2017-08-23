#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "arch" for configuration "Release"
set_property(TARGET arch APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(arch PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "/usr/lib/libm.dylib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libarch.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libarch.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS arch )
list(APPEND _IMPORT_CHECK_FILES_FOR_arch "${_IMPORT_PREFIX}/lib/libarch.dylib" )

# Import target "tf" for configuration "Release"
set_property(TARGET tf APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(tf PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "arch;/Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib/libpython2.7.dylib;/opt/local/USD/lib/libboost_python.dylib;/opt/local/USD/lib/libboost_date_time.dylib;/opt/local/USD/lib/libtbb.dylib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libtf.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libtf.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS tf )
list(APPEND _IMPORT_CHECK_FILES_FOR_tf "${_IMPORT_PREFIX}/lib/libtf.dylib" )

# Import target "gf" for configuration "Release"
set_property(TARGET gf APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(gf PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "arch;tf"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libgf.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libgf.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS gf )
list(APPEND _IMPORT_CHECK_FILES_FOR_gf "${_IMPORT_PREFIX}/lib/libgf.dylib" )

# Import target "js" for configuration "Release"
set_property(TARGET js APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(js PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tf"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libjs.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libjs.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS js )
list(APPEND _IMPORT_CHECK_FILES_FOR_js "${_IMPORT_PREFIX}/lib/libjs.dylib" )

# Import target "tracelite" for configuration "Release"
set_property(TARGET tracelite APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(tracelite PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "arch"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libtracelite.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libtracelite.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS tracelite )
list(APPEND _IMPORT_CHECK_FILES_FOR_tracelite "${_IMPORT_PREFIX}/lib/libtracelite.dylib" )

# Import target "work" for configuration "Release"
set_property(TARGET work APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(work PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tf;tracelite;/opt/local/USD/lib/libtbb.dylib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libwork.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libwork.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS work )
list(APPEND _IMPORT_CHECK_FILES_FOR_work "${_IMPORT_PREFIX}/lib/libwork.dylib" )

# Import target "plug" for configuration "Release"
set_property(TARGET plug APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(plug PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "arch;tf;js;tracelite;work;/opt/local/USD/lib/libboost_python.dylib;/opt/local/USD/lib/libtbb.dylib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libplug.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libplug.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS plug )
list(APPEND _IMPORT_CHECK_FILES_FOR_plug "${_IMPORT_PREFIX}/lib/libplug.dylib" )

# Import target "vt" for configuration "Release"
set_property(TARGET vt APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(vt PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "arch;tf;gf;tracelite;/opt/local/USD/lib/libboost_python.dylib;/opt/local/USD/lib/libtbb.dylib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libvt.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libvt.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS vt )
list(APPEND _IMPORT_CHECK_FILES_FOR_vt "${_IMPORT_PREFIX}/lib/libvt.dylib" )

# Import target "ar" for configuration "Release"
set_property(TARGET ar APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ar PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "arch;tf;plug;vt;/opt/local/USD/lib/libboost_python.dylib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libar.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libar.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS ar )
list(APPEND _IMPORT_CHECK_FILES_FOR_ar "${_IMPORT_PREFIX}/lib/libar.dylib" )

# Import target "kind" for configuration "Release"
set_property(TARGET kind APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(kind PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tf;plug"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libkind.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libkind.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS kind )
list(APPEND _IMPORT_CHECK_FILES_FOR_kind "${_IMPORT_PREFIX}/lib/libkind.dylib" )

# Import target "sdf" for configuration "Release"
set_property(TARGET sdf APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(sdf PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "arch;tf;gf;tracelite;vt;work;ar;/opt/local/USD/lib/libboost_python.dylib;/opt/local/USD/lib/libboost_regex.dylib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libsdf.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libsdf.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS sdf )
list(APPEND _IMPORT_CHECK_FILES_FOR_sdf "${_IMPORT_PREFIX}/lib/libsdf.dylib" )

# Import target "pcp" for configuration "Release"
set_property(TARGET pcp APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(pcp PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tf;tracelite;vt;sdf;work;ar;/opt/local/USD/lib/libboost_python.dylib;/opt/local/USD/lib/libtbb.dylib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libpcp.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libpcp.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS pcp )
list(APPEND _IMPORT_CHECK_FILES_FOR_pcp "${_IMPORT_PREFIX}/lib/libpcp.dylib" )

# Import target "usd" for configuration "Release"
set_property(TARGET usd APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(usd PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "arch;kind;pcp;sdf;ar;plug;tf;tracelite;vt;work;/opt/local/USD/lib/libboost_python.dylib;/opt/local/USD/lib/libtbb.dylib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libusd.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libusd.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS usd )
list(APPEND _IMPORT_CHECK_FILES_FOR_usd "${_IMPORT_PREFIX}/lib/libusd.dylib" )

# Import target "usdGeom" for configuration "Release"
set_property(TARGET usdGeom APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(usdGeom PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "js;tf;plug;vt;sdf;tracelite;usd;work;/opt/local/USD/lib/libboost_python.dylib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libusdGeom.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libusdGeom.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS usdGeom )
list(APPEND _IMPORT_CHECK_FILES_FOR_usdGeom "${_IMPORT_PREFIX}/lib/libusdGeom.dylib" )

# Import target "usdLux" for configuration "Release"
set_property(TARGET usdLux APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(usdLux PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tf;vt;sdf;usd;usdGeom"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libusdLux.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libusdLux.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS usdLux )
list(APPEND _IMPORT_CHECK_FILES_FOR_usdLux "${_IMPORT_PREFIX}/lib/libusdLux.dylib" )

# Import target "usdShade" for configuration "Release"
set_property(TARGET usdShade APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(usdShade PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tf;vt;sdf;usd;usdGeom"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libusdShade.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libusdShade.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS usdShade )
list(APPEND _IMPORT_CHECK_FILES_FOR_usdShade "${_IMPORT_PREFIX}/lib/libusdShade.dylib" )

# Import target "usdHydra" for configuration "Release"
set_property(TARGET usdHydra APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(usdHydra PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tf;usd;usdShade"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libusdHydra.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libusdHydra.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS usdHydra )
list(APPEND _IMPORT_CHECK_FILES_FOR_usdHydra "${_IMPORT_PREFIX}/lib/libusdHydra.dylib" )

# Import target "usdRi" for configuration "Release"
set_property(TARGET usdRi APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(usdRi PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tf;vt;sdf;usd;usdShade;usdGeom;usdLux;/opt/local/USD/lib/libboost_python.dylib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libusdRi.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libusdRi.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS usdRi )
list(APPEND _IMPORT_CHECK_FILES_FOR_usdRi "${_IMPORT_PREFIX}/lib/libusdRi.dylib" )

# Import target "usdSkel" for configuration "Release"
set_property(TARGET usdSkel APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(usdSkel PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tf;vt;sdf;usd;usdGeom"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libusdSkel.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libusdSkel.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS usdSkel )
list(APPEND _IMPORT_CHECK_FILES_FOR_usdSkel "${_IMPORT_PREFIX}/lib/libusdSkel.dylib" )

# Import target "usdUI" for configuration "Release"
set_property(TARGET usdUI APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(usdUI PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tf;vt;sdf;usd"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libusdUI.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libusdUI.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS usdUI )
list(APPEND _IMPORT_CHECK_FILES_FOR_usdUI "${_IMPORT_PREFIX}/lib/libusdUI.dylib" )

# Import target "usdUtils" for configuration "Release"
set_property(TARGET usdUtils APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(usdUtils PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "arch;tf;gf;sdf;usd;usdGeom;/opt/local/USD/lib/libboost_python.dylib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libusdUtils.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libusdUtils.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS usdUtils )
list(APPEND _IMPORT_CHECK_FILES_FOR_usdUtils "${_IMPORT_PREFIX}/lib/libusdUtils.dylib" )

# Import target "usdAbc" for configuration "Release"
set_property(TARGET usdAbc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(usdAbc PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tf;work;sdf;usd;usdGeom;/opt/local/USD/lib/libAlembic.dylib;/opt/local/USD/lib/libIex.dylib;/opt/local/USD/lib/libHalf.dylib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/plugin/usd/usdAbc.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/usdAbc.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS usdAbc )
list(APPEND _IMPORT_CHECK_FILES_FOR_usdAbc "${_IMPORT_PREFIX}/plugin/usd/usdAbc.dylib" )

# Import target "usdObj" for configuration "Release"
set_property(TARGET usdObj APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(usdObj PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tf;gf;sdf;usd;usdGeom"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/share/usd/examples/plugin/usdObj.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/usdObj.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS usdObj )
list(APPEND _IMPORT_CHECK_FILES_FOR_usdObj "${_IMPORT_PREFIX}/share/usd/examples/plugin/usdObj.dylib" )

# Import target "usdSchemaExamples" for configuration "Release"
set_property(TARGET usdSchemaExamples APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(usdSchemaExamples PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "tf;sdf;usd;vt"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/share/usd/examples/plugin/usdSchemaExamples.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/usdSchemaExamples.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS usdSchemaExamples )
list(APPEND _IMPORT_CHECK_FILES_FOR_usdSchemaExamples "${_IMPORT_PREFIX}/share/usd/examples/plugin/usdSchemaExamples.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
