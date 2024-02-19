cmake_minimum_required(VERSION 3.15)

project(led_status_tb)
find_package(verilator HINTS $ENV{VERILATOR_ROOT})

add_executable(VLED_STATUS led.cpp)

verilate(VLED_STATUS SOURCES ../LED_STATUS.v VERILATOR_ARGS --trace)
