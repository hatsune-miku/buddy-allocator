cmake_minimum_required(VERSION 3.24)
project(alloc)

set(CMAKE_C_COMPILER /opt/homebrew/opt/llvm/bin/clang)
set(CMAKE_CXX_COMPILER /opt/homebrew/opt/llvm/bin/clang++)

include_directories(. /opt/homebrew/Cellar/libgrading/0.1.8/include)
link_directories(/opt/homebrew/Cellar/libgrading/0.1.8/lib)
link_libraries(grading)
set(CMAKE_CXX_FLAGS "-std=c++20 -Wall -Werror")

set(SRC rtos-alloc.c buddy.c memcpy.c test.cpp)
#  supertest.c
#  test.cpp

add_executable(alloc ${SRC} test.cpp)
