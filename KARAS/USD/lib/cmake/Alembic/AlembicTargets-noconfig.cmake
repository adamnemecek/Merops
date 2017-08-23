#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Alembic::Alembic" for configuration ""
set_property(TARGET Alembic::Alembic APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(Alembic::Alembic PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_NOCONFIG "/opt/local/USD/lib/libImath.dylib;/opt/local/USD/lib/libIlmThread.dylib;/opt/local/USD/lib/libIex.dylib;/opt/local/USD/lib/libIexMath.dylib;/opt/local/USD/lib/libHalf.dylib;/opt/local/USD/lib/libImath.dylib;/opt/local/USD/lib/libIlmThread.dylib;/opt/local/USD/lib/libIex.dylib;/opt/local/USD/lib/libIexMath.dylib;/opt/local/USD/lib/libHalf.dylib;-lm"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libAlembic.dylib"
  IMPORTED_SONAME_NOCONFIG "@rpath/libAlembic.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS Alembic::Alembic )
list(APPEND _IMPORT_CHECK_FILES_FOR_Alembic::Alembic "${_IMPORT_PREFIX}/lib/libAlembic.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
