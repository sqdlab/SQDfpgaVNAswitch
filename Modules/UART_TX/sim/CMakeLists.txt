cmake_minimum_required(VERSION 3.15)

project(uart_tb)
find_package(verilator HINTS $ENV{VERILATOR_ROOT})

add_executable(VUART_TX uart.cpp)

verilate(VUART_TX SOURCES ../UART_TX.v VERILATOR_ARGS --trace)
