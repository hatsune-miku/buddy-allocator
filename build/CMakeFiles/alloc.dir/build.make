# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.25.2/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.25.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/miku/CLionProjects/buddy-allocator

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/miku/CLionProjects/buddy-allocator/build

# Include any dependencies generated for this target.
include CMakeFiles/alloc.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/alloc.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/alloc.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/alloc.dir/flags.make

CMakeFiles/alloc.dir/rtos-alloc.c.o: CMakeFiles/alloc.dir/flags.make
CMakeFiles/alloc.dir/rtos-alloc.c.o: /Users/miku/CLionProjects/buddy-allocator/rtos-alloc.c
CMakeFiles/alloc.dir/rtos-alloc.c.o: CMakeFiles/alloc.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/miku/CLionProjects/buddy-allocator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/alloc.dir/rtos-alloc.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/alloc.dir/rtos-alloc.c.o -MF CMakeFiles/alloc.dir/rtos-alloc.c.o.d -o CMakeFiles/alloc.dir/rtos-alloc.c.o -c /Users/miku/CLionProjects/buddy-allocator/rtos-alloc.c

CMakeFiles/alloc.dir/rtos-alloc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/alloc.dir/rtos-alloc.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/miku/CLionProjects/buddy-allocator/rtos-alloc.c > CMakeFiles/alloc.dir/rtos-alloc.c.i

CMakeFiles/alloc.dir/rtos-alloc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/alloc.dir/rtos-alloc.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/miku/CLionProjects/buddy-allocator/rtos-alloc.c -o CMakeFiles/alloc.dir/rtos-alloc.c.s

CMakeFiles/alloc.dir/buddy.c.o: CMakeFiles/alloc.dir/flags.make
CMakeFiles/alloc.dir/buddy.c.o: /Users/miku/CLionProjects/buddy-allocator/buddy.c
CMakeFiles/alloc.dir/buddy.c.o: CMakeFiles/alloc.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/miku/CLionProjects/buddy-allocator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/alloc.dir/buddy.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/alloc.dir/buddy.c.o -MF CMakeFiles/alloc.dir/buddy.c.o.d -o CMakeFiles/alloc.dir/buddy.c.o -c /Users/miku/CLionProjects/buddy-allocator/buddy.c

CMakeFiles/alloc.dir/buddy.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/alloc.dir/buddy.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/miku/CLionProjects/buddy-allocator/buddy.c > CMakeFiles/alloc.dir/buddy.c.i

CMakeFiles/alloc.dir/buddy.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/alloc.dir/buddy.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/miku/CLionProjects/buddy-allocator/buddy.c -o CMakeFiles/alloc.dir/buddy.c.s

CMakeFiles/alloc.dir/memcpy.c.o: CMakeFiles/alloc.dir/flags.make
CMakeFiles/alloc.dir/memcpy.c.o: /Users/miku/CLionProjects/buddy-allocator/memcpy.c
CMakeFiles/alloc.dir/memcpy.c.o: CMakeFiles/alloc.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/miku/CLionProjects/buddy-allocator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/alloc.dir/memcpy.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/alloc.dir/memcpy.c.o -MF CMakeFiles/alloc.dir/memcpy.c.o.d -o CMakeFiles/alloc.dir/memcpy.c.o -c /Users/miku/CLionProjects/buddy-allocator/memcpy.c

CMakeFiles/alloc.dir/memcpy.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/alloc.dir/memcpy.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/miku/CLionProjects/buddy-allocator/memcpy.c > CMakeFiles/alloc.dir/memcpy.c.i

CMakeFiles/alloc.dir/memcpy.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/alloc.dir/memcpy.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/miku/CLionProjects/buddy-allocator/memcpy.c -o CMakeFiles/alloc.dir/memcpy.c.s

CMakeFiles/alloc.dir/supertest.c.o: CMakeFiles/alloc.dir/flags.make
CMakeFiles/alloc.dir/supertest.c.o: /Users/miku/CLionProjects/buddy-allocator/supertest.c
CMakeFiles/alloc.dir/supertest.c.o: CMakeFiles/alloc.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/miku/CLionProjects/buddy-allocator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/alloc.dir/supertest.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/alloc.dir/supertest.c.o -MF CMakeFiles/alloc.dir/supertest.c.o.d -o CMakeFiles/alloc.dir/supertest.c.o -c /Users/miku/CLionProjects/buddy-allocator/supertest.c

CMakeFiles/alloc.dir/supertest.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/alloc.dir/supertest.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/miku/CLionProjects/buddy-allocator/supertest.c > CMakeFiles/alloc.dir/supertest.c.i

CMakeFiles/alloc.dir/supertest.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/alloc.dir/supertest.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/miku/CLionProjects/buddy-allocator/supertest.c -o CMakeFiles/alloc.dir/supertest.c.s

CMakeFiles/alloc.dir/test.cpp.o: CMakeFiles/alloc.dir/flags.make
CMakeFiles/alloc.dir/test.cpp.o: /Users/miku/CLionProjects/buddy-allocator/test.cpp
CMakeFiles/alloc.dir/test.cpp.o: CMakeFiles/alloc.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/miku/CLionProjects/buddy-allocator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/alloc.dir/test.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/alloc.dir/test.cpp.o -MF CMakeFiles/alloc.dir/test.cpp.o.d -o CMakeFiles/alloc.dir/test.cpp.o -c /Users/miku/CLionProjects/buddy-allocator/test.cpp

CMakeFiles/alloc.dir/test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/alloc.dir/test.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/miku/CLionProjects/buddy-allocator/test.cpp > CMakeFiles/alloc.dir/test.cpp.i

CMakeFiles/alloc.dir/test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/alloc.dir/test.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/miku/CLionProjects/buddy-allocator/test.cpp -o CMakeFiles/alloc.dir/test.cpp.s

# Object files for target alloc
alloc_OBJECTS = \
"CMakeFiles/alloc.dir/rtos-alloc.c.o" \
"CMakeFiles/alloc.dir/buddy.c.o" \
"CMakeFiles/alloc.dir/memcpy.c.o" \
"CMakeFiles/alloc.dir/supertest.c.o" \
"CMakeFiles/alloc.dir/test.cpp.o"

# External object files for target alloc
alloc_EXTERNAL_OBJECTS =

alloc: CMakeFiles/alloc.dir/rtos-alloc.c.o
alloc: CMakeFiles/alloc.dir/buddy.c.o
alloc: CMakeFiles/alloc.dir/memcpy.c.o
alloc: CMakeFiles/alloc.dir/supertest.c.o
alloc: CMakeFiles/alloc.dir/test.cpp.o
alloc: CMakeFiles/alloc.dir/build.make
alloc: CMakeFiles/alloc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/miku/CLionProjects/buddy-allocator/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX executable alloc"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/alloc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/alloc.dir/build: alloc
.PHONY : CMakeFiles/alloc.dir/build

CMakeFiles/alloc.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/alloc.dir/cmake_clean.cmake
.PHONY : CMakeFiles/alloc.dir/clean

CMakeFiles/alloc.dir/depend:
	cd /Users/miku/CLionProjects/buddy-allocator/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/miku/CLionProjects/buddy-allocator /Users/miku/CLionProjects/buddy-allocator /Users/miku/CLionProjects/buddy-allocator/build /Users/miku/CLionProjects/buddy-allocator/build /Users/miku/CLionProjects/buddy-allocator/build/CMakeFiles/alloc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/alloc.dir/depend

