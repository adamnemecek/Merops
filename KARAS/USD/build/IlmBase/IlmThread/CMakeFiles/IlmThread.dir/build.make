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
CMAKE_SOURCE_DIR = /opt/local/USD/src/openexr-2.2.0/IlmBase

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /opt/local/USD/build/IlmBase

# Include any dependencies generated for this target.
include IlmThread/CMakeFiles/IlmThread.dir/depend.make

# Include the progress variables for this target.
include IlmThread/CMakeFiles/IlmThread.dir/progress.make

# Include the compile flags for this target's objects.
include IlmThread/CMakeFiles/IlmThread.dir/flags.make

IlmThread/CMakeFiles/IlmThread.dir/IlmThread.cpp.o: IlmThread/CMakeFiles/IlmThread.dir/flags.make
IlmThread/CMakeFiles/IlmThread.dir/IlmThread.cpp.o: /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/local/USD/build/IlmBase/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object IlmThread/CMakeFiles/IlmThread.dir/IlmThread.cpp.o"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IlmThread.dir/IlmThread.cpp.o -c /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThread.cpp

IlmThread/CMakeFiles/IlmThread.dir/IlmThread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IlmThread.dir/IlmThread.cpp.i"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThread.cpp > CMakeFiles/IlmThread.dir/IlmThread.cpp.i

IlmThread/CMakeFiles/IlmThread.dir/IlmThread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IlmThread.dir/IlmThread.cpp.s"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThread.cpp -o CMakeFiles/IlmThread.dir/IlmThread.cpp.s

IlmThread/CMakeFiles/IlmThread.dir/IlmThread.cpp.o.requires:

.PHONY : IlmThread/CMakeFiles/IlmThread.dir/IlmThread.cpp.o.requires

IlmThread/CMakeFiles/IlmThread.dir/IlmThread.cpp.o.provides: IlmThread/CMakeFiles/IlmThread.dir/IlmThread.cpp.o.requires
	$(MAKE) -f IlmThread/CMakeFiles/IlmThread.dir/build.make IlmThread/CMakeFiles/IlmThread.dir/IlmThread.cpp.o.provides.build
.PHONY : IlmThread/CMakeFiles/IlmThread.dir/IlmThread.cpp.o.provides

IlmThread/CMakeFiles/IlmThread.dir/IlmThread.cpp.o.provides.build: IlmThread/CMakeFiles/IlmThread.dir/IlmThread.cpp.o


IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.o: IlmThread/CMakeFiles/IlmThread.dir/flags.make
IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.o: /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadMutex.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/local/USD/build/IlmBase/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.o"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.o -c /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadMutex.cpp

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.i"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadMutex.cpp > CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.i

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.s"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadMutex.cpp -o CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.s

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.o.requires:

.PHONY : IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.o.requires

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.o.provides: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.o.requires
	$(MAKE) -f IlmThread/CMakeFiles/IlmThread.dir/build.make IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.o.provides.build
.PHONY : IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.o.provides

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.o.provides.build: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.o


IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.o: IlmThread/CMakeFiles/IlmThread.dir/flags.make
IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.o: /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadMutexPosix.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/local/USD/build/IlmBase/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.o"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.o -c /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadMutexPosix.cpp

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.i"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadMutexPosix.cpp > CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.i

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.s"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadMutexPosix.cpp -o CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.s

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.o.requires:

.PHONY : IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.o.requires

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.o.provides: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.o.requires
	$(MAKE) -f IlmThread/CMakeFiles/IlmThread.dir/build.make IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.o.provides.build
.PHONY : IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.o.provides

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.o.provides.build: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.o


IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.o: IlmThread/CMakeFiles/IlmThread.dir/flags.make
IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.o: /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadPool.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/local/USD/build/IlmBase/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.o"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.o -c /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadPool.cpp

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.i"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadPool.cpp > CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.i

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.s"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadPool.cpp -o CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.s

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.o.requires:

.PHONY : IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.o.requires

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.o.provides: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.o.requires
	$(MAKE) -f IlmThread/CMakeFiles/IlmThread.dir/build.make IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.o.provides.build
.PHONY : IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.o.provides

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.o.provides.build: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.o


IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.o: IlmThread/CMakeFiles/IlmThread.dir/flags.make
IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.o: /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadPosix.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/local/USD/build/IlmBase/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.o"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.o -c /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadPosix.cpp

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.i"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadPosix.cpp > CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.i

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.s"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadPosix.cpp -o CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.s

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.o.requires:

.PHONY : IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.o.requires

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.o.provides: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.o.requires
	$(MAKE) -f IlmThread/CMakeFiles/IlmThread.dir/build.make IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.o.provides.build
.PHONY : IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.o.provides

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.o.provides.build: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.o


IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.o: IlmThread/CMakeFiles/IlmThread.dir/flags.make
IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.o: /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadSemaphore.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/local/USD/build/IlmBase/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.o"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.o -c /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadSemaphore.cpp

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.i"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadSemaphore.cpp > CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.i

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.s"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadSemaphore.cpp -o CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.s

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.o.requires:

.PHONY : IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.o.requires

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.o.provides: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.o.requires
	$(MAKE) -f IlmThread/CMakeFiles/IlmThread.dir/build.make IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.o.provides.build
.PHONY : IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.o.provides

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.o.provides.build: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.o


IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.o: IlmThread/CMakeFiles/IlmThread.dir/flags.make
IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.o: /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadSemaphorePosixCompat.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/local/USD/build/IlmBase/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.o"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.o -c /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadSemaphorePosixCompat.cpp

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.i"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadSemaphorePosixCompat.cpp > CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.i

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.s"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadSemaphorePosixCompat.cpp -o CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.s

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.o.requires:

.PHONY : IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.o.requires

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.o.provides: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.o.requires
	$(MAKE) -f IlmThread/CMakeFiles/IlmThread.dir/build.make IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.o.provides.build
.PHONY : IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.o.provides

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.o.provides.build: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.o


IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.o: IlmThread/CMakeFiles/IlmThread.dir/flags.make
IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.o: /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadSemaphorePosix.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/local/USD/build/IlmBase/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.o"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.o -c /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadSemaphorePosix.cpp

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.i"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadSemaphorePosix.cpp > CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.i

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.s"
	cd /opt/local/USD/build/IlmBase/IlmThread && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread/IlmThreadSemaphorePosix.cpp -o CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.s

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.o.requires:

.PHONY : IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.o.requires

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.o.provides: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.o.requires
	$(MAKE) -f IlmThread/CMakeFiles/IlmThread.dir/build.make IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.o.provides.build
.PHONY : IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.o.provides

IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.o.provides.build: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.o


# Object files for target IlmThread
IlmThread_OBJECTS = \
"CMakeFiles/IlmThread.dir/IlmThread.cpp.o" \
"CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.o" \
"CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.o" \
"CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.o" \
"CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.o" \
"CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.o" \
"CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.o" \
"CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.o"

# External object files for target IlmThread
IlmThread_EXTERNAL_OBJECTS =

IlmThread/libIlmThread.12.0.0.dylib: IlmThread/CMakeFiles/IlmThread.dir/IlmThread.cpp.o
IlmThread/libIlmThread.12.0.0.dylib: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.o
IlmThread/libIlmThread.12.0.0.dylib: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.o
IlmThread/libIlmThread.12.0.0.dylib: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.o
IlmThread/libIlmThread.12.0.0.dylib: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.o
IlmThread/libIlmThread.12.0.0.dylib: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.o
IlmThread/libIlmThread.12.0.0.dylib: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.o
IlmThread/libIlmThread.12.0.0.dylib: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.o
IlmThread/libIlmThread.12.0.0.dylib: IlmThread/CMakeFiles/IlmThread.dir/build.make
IlmThread/libIlmThread.12.0.0.dylib: Iex/libIex.12.0.0.dylib
IlmThread/libIlmThread.12.0.0.dylib: IlmThread/CMakeFiles/IlmThread.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/opt/local/USD/build/IlmBase/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX shared library libIlmThread.dylib"
	cd /opt/local/USD/build/IlmBase/IlmThread && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/IlmThread.dir/link.txt --verbose=$(VERBOSE)
	cd /opt/local/USD/build/IlmBase/IlmThread && $(CMAKE_COMMAND) -E cmake_symlink_library libIlmThread.12.0.0.dylib libIlmThread.12.dylib libIlmThread.dylib

IlmThread/libIlmThread.12.dylib: IlmThread/libIlmThread.12.0.0.dylib
	@$(CMAKE_COMMAND) -E touch_nocreate IlmThread/libIlmThread.12.dylib

IlmThread/libIlmThread.dylib: IlmThread/libIlmThread.12.0.0.dylib
	@$(CMAKE_COMMAND) -E touch_nocreate IlmThread/libIlmThread.dylib

# Rule to build all files generated by this target.
IlmThread/CMakeFiles/IlmThread.dir/build: IlmThread/libIlmThread.dylib

.PHONY : IlmThread/CMakeFiles/IlmThread.dir/build

IlmThread/CMakeFiles/IlmThread.dir/requires: IlmThread/CMakeFiles/IlmThread.dir/IlmThread.cpp.o.requires
IlmThread/CMakeFiles/IlmThread.dir/requires: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutex.cpp.o.requires
IlmThread/CMakeFiles/IlmThread.dir/requires: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadMutexPosix.cpp.o.requires
IlmThread/CMakeFiles/IlmThread.dir/requires: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPool.cpp.o.requires
IlmThread/CMakeFiles/IlmThread.dir/requires: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadPosix.cpp.o.requires
IlmThread/CMakeFiles/IlmThread.dir/requires: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphore.cpp.o.requires
IlmThread/CMakeFiles/IlmThread.dir/requires: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosixCompat.cpp.o.requires
IlmThread/CMakeFiles/IlmThread.dir/requires: IlmThread/CMakeFiles/IlmThread.dir/IlmThreadSemaphorePosix.cpp.o.requires

.PHONY : IlmThread/CMakeFiles/IlmThread.dir/requires

IlmThread/CMakeFiles/IlmThread.dir/clean:
	cd /opt/local/USD/build/IlmBase/IlmThread && $(CMAKE_COMMAND) -P CMakeFiles/IlmThread.dir/cmake_clean.cmake
.PHONY : IlmThread/CMakeFiles/IlmThread.dir/clean

IlmThread/CMakeFiles/IlmThread.dir/depend:
	cd /opt/local/USD/build/IlmBase && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /opt/local/USD/src/openexr-2.2.0/IlmBase /opt/local/USD/src/openexr-2.2.0/IlmBase/IlmThread /opt/local/USD/build/IlmBase /opt/local/USD/build/IlmBase/IlmThread /opt/local/USD/build/IlmBase/IlmThread/CMakeFiles/IlmThread.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : IlmThread/CMakeFiles/IlmThread.dir/depend

