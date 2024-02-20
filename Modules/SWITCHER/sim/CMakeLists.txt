cmake_minimum_required(VERSION 3.15)

project(switcher_tb)
find_package(verilator HINTS $ENV{VERILATOR_ROOT})

add_executable(VSWITCHER switcher.cpp)

verilate(VSWITCHER SOURCES ../SWITCHER.v VERILATOR_ARGS --trace)
