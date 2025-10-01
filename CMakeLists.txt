cmake_minimum_required(VERSION 3.16)
project(FlockingApp)

# C++ version
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# set the startup project in Visual Studio
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT FlockingApp)

add_subdirectory(3rdparty/raylib)

add_executable(FlockingApp src/main.cpp)

target_link_libraries(FlockingApp PRIVATE raylib)