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

# Utility rule file for usdGenSchema.

# Include the progress variables for this target.
include pxr/usd/lib/usd/CMakeFiles/usdGenSchema.dir/progress.make

pxr/usd/lib/usd/CMakeFiles/usdGenSchema: pxr/usd/lib/usd/usdGenSchema
pxr/usd/lib/usd/CMakeFiles/usdGenSchema: pxr/base/lib/tf/libtf.dylib
pxr/usd/lib/usd/CMakeFiles/usdGenSchema: pxr/usd/lib/sdf/libsdf.dylib
pxr/usd/lib/usd/CMakeFiles/usdGenSchema: pxr/usd/lib/usd/libusd.dylib


pxr/usd/lib/usd/usdGenSchema: /Users/sumioka_air/USD/pxr/usd/lib/usd/usdGenSchema.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/opt/local/USD/build/USD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Substituting Python shebang"
	cd /opt/local/USD/build/USD/pxr/usd/lib/usd && /Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/bin/python2.7 /Users/sumioka_air/USD/cmake/macros/shebang.py /Users/sumioka_air/.pyenv/versions/anaconda3-4.3.1/envs/py2/bin/python2.7 /Users/sumioka_air/USD/pxr/usd/lib/usd/usdGenSchema.py /opt/local/USD/build/USD/pxr/usd/lib/usd/usdGenSchema

usdGenSchema: pxr/usd/lib/usd/CMakeFiles/usdGenSchema
usdGenSchema: pxr/usd/lib/usd/usdGenSchema
usdGenSchema: pxr/usd/lib/usd/CMakeFiles/usdGenSchema.dir/build.make

.PHONY : usdGenSchema

# Rule to build all files generated by this target.
pxr/usd/lib/usd/CMakeFiles/usdGenSchema.dir/build: usdGenSchema

.PHONY : pxr/usd/lib/usd/CMakeFiles/usdGenSchema.dir/build

pxr/usd/lib/usd/CMakeFiles/usdGenSchema.dir/clean:
	cd /opt/local/USD/build/USD/pxr/usd/lib/usd && $(CMAKE_COMMAND) -P CMakeFiles/usdGenSchema.dir/cmake_clean.cmake
.PHONY : pxr/usd/lib/usd/CMakeFiles/usdGenSchema.dir/clean

pxr/usd/lib/usd/CMakeFiles/usdGenSchema.dir/depend:
	cd /opt/local/USD/build/USD && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/sumioka_air/USD /Users/sumioka_air/USD/pxr/usd/lib/usd /opt/local/USD/build/USD /opt/local/USD/build/USD/pxr/usd/lib/usd /opt/local/USD/build/USD/pxr/usd/lib/usd/CMakeFiles/usdGenSchema.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pxr/usd/lib/usd/CMakeFiles/usdGenSchema.dir/depend

