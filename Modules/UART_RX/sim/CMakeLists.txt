cmake_minimum_required(VERSION 3.15)

project(uart_tb)
find_package(verilator HINTS $ENV{VERILATOR_ROOT})

add_executable(VUART_RX uart.cpp)

verilate(VUART_RX SOURCES ../UART_RX.v VERILATOR_ARGS --trace)
