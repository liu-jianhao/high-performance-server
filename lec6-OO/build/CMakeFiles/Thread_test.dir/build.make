# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/liu/Desktop/high-performance-server/lec6-OO

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/liu/Desktop/high-performance-server/lec6-OO/build

# Include any dependencies generated for this target.
include CMakeFiles/Thread_test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Thread_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Thread_test.dir/flags.make

CMakeFiles/Thread_test.dir/Thread_test.o: CMakeFiles/Thread_test.dir/flags.make
CMakeFiles/Thread_test.dir/Thread_test.o: ../Thread_test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liu/Desktop/high-performance-server/lec6-OO/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Thread_test.dir/Thread_test.o"
	g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Thread_test.dir/Thread_test.o -c /home/liu/Desktop/high-performance-server/lec6-OO/Thread_test.cpp

CMakeFiles/Thread_test.dir/Thread_test.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Thread_test.dir/Thread_test.i"
	g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liu/Desktop/high-performance-server/lec6-OO/Thread_test.cpp > CMakeFiles/Thread_test.dir/Thread_test.i

CMakeFiles/Thread_test.dir/Thread_test.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Thread_test.dir/Thread_test.s"
	g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liu/Desktop/high-performance-server/lec6-OO/Thread_test.cpp -o CMakeFiles/Thread_test.dir/Thread_test.s

CMakeFiles/Thread_test.dir/Thread.o: CMakeFiles/Thread_test.dir/flags.make
CMakeFiles/Thread_test.dir/Thread.o: ../Thread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liu/Desktop/high-performance-server/lec6-OO/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Thread_test.dir/Thread.o"
	g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Thread_test.dir/Thread.o -c /home/liu/Desktop/high-performance-server/lec6-OO/Thread.cpp

CMakeFiles/Thread_test.dir/Thread.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Thread_test.dir/Thread.i"
	g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liu/Desktop/high-performance-server/lec6-OO/Thread.cpp > CMakeFiles/Thread_test.dir/Thread.i

CMakeFiles/Thread_test.dir/Thread.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Thread_test.dir/Thread.s"
	g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liu/Desktop/high-performance-server/lec6-OO/Thread.cpp -o CMakeFiles/Thread_test.dir/Thread.s

# Object files for target Thread_test
Thread_test_OBJECTS = \
"CMakeFiles/Thread_test.dir/Thread_test.o" \
"CMakeFiles/Thread_test.dir/Thread.o"

# External object files for target Thread_test
Thread_test_EXTERNAL_OBJECTS =

bin/Thread_test: CMakeFiles/Thread_test.dir/Thread_test.o
bin/Thread_test: CMakeFiles/Thread_test.dir/Thread.o
bin/Thread_test: CMakeFiles/Thread_test.dir/build.make
bin/Thread_test: CMakeFiles/Thread_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/liu/Desktop/high-performance-server/lec6-OO/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable bin/Thread_test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Thread_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Thread_test.dir/build: bin/Thread_test

.PHONY : CMakeFiles/Thread_test.dir/build

CMakeFiles/Thread_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Thread_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Thread_test.dir/clean

CMakeFiles/Thread_test.dir/depend:
	cd /home/liu/Desktop/high-performance-server/lec6-OO/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/liu/Desktop/high-performance-server/lec6-OO /home/liu/Desktop/high-performance-server/lec6-OO /home/liu/Desktop/high-performance-server/lec6-OO/build /home/liu/Desktop/high-performance-server/lec6-OO/build /home/liu/Desktop/high-performance-server/lec6-OO/build/CMakeFiles/Thread_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Thread_test.dir/depend

