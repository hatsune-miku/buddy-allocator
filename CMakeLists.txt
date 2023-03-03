cmake_minimum_required(VERSION 3.24)
project(alloc)

set(CMAKE_C_STANDARD 11)

include_directories(. /opt/homebrew/Cellar/libgrading/0.1.8/include)
link_directories(/opt/homebrew/Cellar/libgrading/0.1.8/lib)
link_libraries(grading)
set(CMAKE_CXX_FLAGS "-std=c++17 -Wall -Werror")

set(SRC rtos-alloc.c buddy.c memcpy.c supertest.c)
#  supertest.c
#  test.cpp

add_executable(alloc ${SRC} test.cpp)
