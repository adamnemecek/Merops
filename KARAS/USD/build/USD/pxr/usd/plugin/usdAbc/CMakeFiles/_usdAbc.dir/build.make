# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.9.0/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.9.0/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/sumioka_air/USD

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /opt/local/USD/build/USD

# Include any dependencies generated for this target.
include pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/depend.make

# Include the progress variables for this target.
include pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/progress.make

# Include the compile flags for this target's objects.
include pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/flags.make

pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/module.cpp.o: pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/flags.make
pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/module.cpp.o: /Users/sumioka_air/USD/pxr/usd/plugin/usdAbc/module.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/local/USD/build/USD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/module.cpp.o"
	cd /opt/local/USD/build/USD/pxr/usd/plugin/usdAbc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/_usdAbc.dir/module.cpp.o -c /Users/sumioka_air/USD/pxr/usd/plugin/usdAbc/module.cpp

pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/module.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/_usdAbc.dir/module.cpp.i"
	cd /opt/local/USD/build/USD/pxr/usd/plugin/usdAbc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/sumioka_air/USD/pxr/usd/plugin/usdAbc/module.cpp > CMakeFiles/_usdAbc.dir/module.cpp.i

pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/module.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/_usdAbc.dir/module.cpp.s"
	cd /opt/local/USD/build/USD/pxr/usd/plugin/usdAbc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/sumioka_air/USD/pxr/usd/plugin/usdAbc/module.cpp -o CMakeFiles/_usdAbc.dir/module.cpp.s

pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/module.cpp.o.requires:

.PHONY : pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/module.cpp.o.requires

pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/module.cpp.o.provides: pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/module.cpp.o.requires
	$(MAKE) -f pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/build.make pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/module.cpp.o.provides.build
.PHONY : pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/module.cpp.o.provides

pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/module.cpp.o.provides.build: pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/module.cpp.o


pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.o: pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/flags.make
pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.o: /Users/sumioka_air/USD/pxr/usd/plugin/usdAbc/wrapAlembicTest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/local/USD/build/USD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.o"
	cd /opt/local/USD/build/USD/pxr/usd/plugin/usdAbc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.o -c /Users/sumioka_air/USD/pxr/usd/plugin/usdAbc/wrapAlembicTest.cpp

pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.i"
	cd /opt/local/USD/build/USD/pxr/usd/plugin/usdAbc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/sumioka_air/USD/pxr/usd/plugin/usdAbc/wrapAlembicTest.cpp > CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.i

pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.s"
	cd /opt/local/USD/build/USD/pxr/usd/plugin/usdAbc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/sumioka_air/USD/pxr/usd/plugin/usdAbc/wrapAlembicTest.cpp -o CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.s

pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.o.requires:

.PHONY : pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.o.requires

pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.o.provides: pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.o.requires
	$(MAKE) -f pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/build.make pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.o.provides.build
.PHONY : pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.o.provides

pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.o.provides.build: pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.o


# Object files for target _usdAbc
_usdAbc_OBJECTS = \
"CMakeFiles/_usdAbc.dir/module.cpp.o" \
"CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.o"

# External object files for target _usdAbc
_usdAbc_EXTERNAL_OBJECTS =

pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/module.cpp.o
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.o
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/build.make
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/usd/plugin/usdAbc/usdAbc.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/usd/lib/usdGeom/libusdGeom.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/usd/lib/usd/libusd.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/usd/lib/kind/libkind.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/usd/lib/pcp/libpcp.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/usd/lib/sdf/libsdf.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: /opt/local/USD/lib/libboost_regex.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/usd/lib/ar/libar.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/base/lib/vt/libvt.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/base/lib/gf/libgf.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/base/lib/plug/libplug.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/base/lib/work/libwork.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/base/lib/tracelite/libtracelite.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/base/lib/js/libjs.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/base/lib/tf/libtf.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/base/lib/arch/libarch.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: /usr/lib/libm.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: /Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/lib/libpython2.7.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: /opt/local/USD/lib/libboost_python.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: /opt/local/USD/lib/libboost_date_time.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: /opt/local/USD/lib/libtbb.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: /opt/local/USD/lib/libAlembic.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: /opt/local/USD/lib/libIex.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: /opt/local/USD/lib/libHalf.dylib
pxr/usd/plugin/usdAbc/_usdAbc.so: pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/opt/local/USD/build/USD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library _usdAbc.so"
	cd /opt/local/USD/build/USD/pxr/usd/plugin/usdAbc && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/_usdAbc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/build: pxr/usd/plugin/usdAbc/_usdAbc.so

.PHONY : pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/build

pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/requires: pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/module.cpp.o.requires
pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/requires: pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/wrapAlembicTest.cpp.o.requires

.PHONY : pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/requires

pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/clean:
	cd /opt/local/USD/build/USD/pxr/usd/plugin/usdAbc && $(CMAKE_COMMAND) -P CMakeFiles/_usdAbc.dir/cmake_clean.cmake
.PHONY : pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/clean

pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/depend:
	cd /opt/local/USD/build/USD && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/sumioka_air/USD /Users/sumioka_air/USD/pxr/usd/plugin/usdAbc /opt/local/USD/build/USD /opt/local/USD/build/USD/pxr/usd/plugin/usdAbc /opt/local/USD/build/USD/pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pxr/usd/plugin/usdAbc/CMakeFiles/_usdAbc.dir/depend

