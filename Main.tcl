# Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, the Altera Quartus II License Agreement,
# the Altera MegaCore Function License Agreement, or other 
# applicable license agreement, including, without limitation, 
# that your use is for the sole purpose of programming logic 
# devices manufactured by Altera and sold by Altera or its 
# authorized distributors.  Please refer to the applicable 
# agreement for further details.

# Quartus II: Generate Tcl File for Project
# File: AQC_Switcher.tcl
# Generated on: Mon Feb 19 17:54:52 2024

# Load Quartus II Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "quartusProjSW"]} {
		puts "Project quartusProjSW is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists quartusProjSW]} {
		project_open -revision quartusProjSW quartusProjSW
	} else {
		project_new -revision quartusProjSW quartusProjSW
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone IV E"
	set_global_assignment -name DEVICE EP4CE22F17C6
	set_global_assignment -name TOP_LEVEL_ENTITY main
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 14.1.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "16:27:58  NOVEMBER 07, 2019"
	set_global_assignment -name LAST_QUARTUS_VERSION 14.1.0
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 1
	set_global_assignment -name EDA_SIMULATION_TOOL "ModelSim-Altera (Verilog)"
	set_global_assignment -name EDA_TIME_SCALE "1 ps" -section_id eda_simulation
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT "VERILOG HDL" -section_id eda_simulation
	set_global_assignment -name EDA_TEST_BENCH_ENABLE_STATUS TEST_BENCH_MODE -section_id eda_simulation
	set_global_assignment -name EDA_NATIVELINK_SIMULATION_TEST_BENCH Ethernet_SMI_TB -section_id eda_simulation
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "2.5 V"
	set_global_assignment -name LL_ROOT_REGION ON -section_id "Root Region"
	set_global_assignment -name LL_MEMBER_STATE LOCKED -section_id "Root Region"
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name ENABLE_OCT_DONE OFF
	set_global_assignment -name ENABLE_CONFIGURATION_PINS OFF
	set_global_assignment -name ENABLE_BOOT_SEL_PIN OFF
	set_global_assignment -name USE_CONFIGURATION_DEVICE OFF
	set_global_assignment -name CRC_ERROR_OPEN_DRAIN OFF
	set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name OUTPUT_IO_TIMING_NEAR_END_VMEAS "HALF VCCIO" -rise
	set_global_assignment -name OUTPUT_IO_TIMING_NEAR_END_VMEAS "HALF VCCIO" -fall
	set_global_assignment -name OUTPUT_IO_TIMING_FAR_END_VMEAS "HALF SIGNAL SWING" -rise
	set_global_assignment -name OUTPUT_IO_TIMING_FAR_END_VMEAS "HALF SIGNAL SWING" -fall
	set_global_assignment -name QIP_FILE CLOCK_PLL.qip
	set_global_assignment -name OPTIMIZATION_MODE "AGGRESSIVE PERFORMANCE"
	set_global_assignment -name VERILOG_FILE Modules/UART_RX/UART_RX.v
	set_global_assignment -name VERILOG_FILE Modules/UART_TX/UART_TX.v
	set_global_assignment -name VERILOG_FILE Modules/LED_STATUS/LED_STATUS.v
	set_global_assignment -name VERILOG_FILE Modules/SWITCHER/SWITCHER.v
	set_global_assignment -name VERILOG_FILE Main.v
	set_location_assignment PIN_R8 -to CLOCK_50
	set_location_assignment PIN_A15 -to LED_0
	set_location_assignment PIN_A13 -to LED_1
	set_location_assignment PIN_B13 -to LED_2
	set_location_assignment PIN_A11 -to LED_3
	set_location_assignment PIN_D1 -to LED_4
	set_location_assignment PIN_F3 -to LED_5
	set_location_assignment PIN_B1 -to LED_6
	set_location_assignment PIN_L3 -to LED_7
	set_location_assignment PIN_J15 -to KEY_0
	set_location_assignment PIN_E1 -to KEY_1
	set_location_assignment PIN_M1 -to SW_0
	set_location_assignment PIN_T8 -to SW_1
	set_location_assignment PIN_B9 -to SW_2
	set_location_assignment PIN_M15 -to SW_3
	set_location_assignment PIN_P2 -to DRAM_ADDR_0
	set_location_assignment PIN_N5 -to DRAM_ADDR_1
	set_location_assignment PIN_N6 -to DRAM_ADDR_2
	set_location_assignment PIN_M8 -to DRAM_ADDR_3
	set_location_assignment PIN_P8 -to DRAM_ADDR_4
	set_location_assignment PIN_T7 -to DRAM_ADDR_5
	set_location_assignment PIN_N8 -to DRAM_ADDR_6
	set_location_assignment PIN_T6 -to DRAM_ADDR_7
	set_location_assignment PIN_R1 -to DRAM_ADDR_8
	set_location_assignment PIN_P1 -to DRAM_ADDR_9
	set_location_assignment PIN_N2 -to DRAM_ADDR_10
	set_location_assignment PIN_N1 -to DRAM_ADDR_11
	set_location_assignment PIN_L4 -to DRAM_ADDR_12
	set_location_assignment PIN_M7 -to DRAM_BA_0
	set_location_assignment PIN_M6 -to DRAM_BA_1
	set_location_assignment PIN_L7 -to DRAM_CKE
	set_location_assignment PIN_R4 -to DRAM_CLK
	set_location_assignment PIN_P6 -to DRAM_CS_N
	set_location_assignment PIN_G2 -to DRAM_DQ_0
	set_location_assignment PIN_G1 -to DRAM_DQ_1
	set_location_assignment PIN_L8 -to DRAM_DQ_2
	set_location_assignment PIN_K5 -to DRAM_DQ_3
	set_location_assignment PIN_K2 -to DRAM_DQ_4
	set_location_assignment PIN_J2 -to DRAM_DQ_5
	set_location_assignment PIN_J1 -to DRAM_DQ_6
	set_location_assignment PIN_R7 -to DRAM_DQ_7
	set_location_assignment PIN_T4 -to DRAM_DQ_8
	set_location_assignment PIN_T2 -to DRAM_DQ_9
	set_location_assignment PIN_T3 -to DRAM_DQ_10
	set_location_assignment PIN_R3 -to DRAM_DQ_11
	set_location_assignment PIN_R5 -to DRAM_DQ_12
	set_location_assignment PIN_P3 -to DRAM_DQ_13
	set_location_assignment PIN_N3 -to DRAM_DQ_14
	set_location_assignment PIN_K1 -to DRAM_DQ_15
	set_location_assignment PIN_R6 -to DRAM_DQM_0
	set_location_assignment PIN_T5 -to DRAM_DQM_1
	set_location_assignment PIN_L1 -to DRAM_CAS_N
	set_location_assignment PIN_L2 -to DRAM_RAS_N
	set_location_assignment PIN_C2 -to DRAM_WE_N
	set_location_assignment PIN_F2 -to I2C_SCLK
	set_location_assignment PIN_F1 -to I2C_SDAT
	set_location_assignment PIN_G5 -to G_SENSOR_CS_N
	set_location_assignment PIN_M2 -to G_SENSOR_INT
	set_location_assignment PIN_A10 -to ADC_CS_N
	set_location_assignment PIN_B10 -to ADC_SADDR
	set_location_assignment PIN_B14 -to ADC_SCLK
	set_location_assignment PIN_A9 -to ADC_SDAT
	set_location_assignment PIN_A14 -to GPIO_2_0
	set_location_assignment PIN_B16 -to GPIO_2_1
	set_location_assignment PIN_C14 -to GPIO_2_2
	set_location_assignment PIN_C16 -to GPIO_2_3
	set_location_assignment PIN_C15 -to GPIO_2_4
	set_location_assignment PIN_D16 -to GPIO_2_5
	set_location_assignment PIN_D15 -to GPIO_2_6
	set_location_assignment PIN_D14 -to GPIO_2_7
	set_location_assignment PIN_F15 -to GPIO_2_8
	set_location_assignment PIN_F16 -to GPIO_2_9
	set_location_assignment PIN_F14 -to GPIO_2_10
	set_location_assignment PIN_G16 -to GPIO_2_11
	set_location_assignment PIN_G15 -to GPIO_2_12
	set_location_assignment PIN_E15 -to GPIO_2_IN_0
	set_location_assignment PIN_E16 -to GPIO_2_IN_1
	set_location_assignment PIN_M16 -to GPIO_2_IN_2
	set_location_assignment PIN_A8 -to GPIO_0_IN_0
	set_location_assignment PIN_D3 -to GPIO_0_0
	set_location_assignment PIN_B8 -to GPIO_0_IN_1
	set_location_assignment PIN_C3 -to GPIO_0_1
	set_location_assignment PIN_A2 -to GPIO_0_2
	set_location_assignment PIN_A3 -to GPIO_0_3
	set_location_assignment PIN_B3 -to GPIO_0_4
	set_location_assignment PIN_B4 -to GPIO_0_5
	set_location_assignment PIN_A4 -to GPIO_0_6
	set_location_assignment PIN_B5 -to GPIO_0_7
	set_location_assignment PIN_A5 -to GPIO_0_8
	set_location_assignment PIN_D5 -to GPIO_0_9
	set_location_assignment PIN_B6 -to GPIO_0_10
	set_location_assignment PIN_A6 -to GPIO_0_11
	set_location_assignment PIN_B7 -to GPIO_0_12
	set_location_assignment PIN_D6 -to GPIO_0_13
	set_location_assignment PIN_A7 -to GPIO_0_14
	set_location_assignment PIN_C6 -to GPIO_0_15
	set_location_assignment PIN_C8 -to GPIO_0_16
	set_location_assignment PIN_E6 -to GPIO_0_17
	set_location_assignment PIN_E7 -to GPIO_0_18
	set_location_assignment PIN_D8 -to GPIO_0_19
	set_location_assignment PIN_E8 -to GPIO_0_20
	set_location_assignment PIN_F8 -to GPIO_0_21
	set_location_assignment PIN_F9 -to GPIO_0_22
	set_location_assignment PIN_E9 -to GPIO_0_23
	set_location_assignment PIN_C9 -to GPIO_0_24
	set_location_assignment PIN_D9 -to GPIO_0_25
	set_location_assignment PIN_E11 -to GPIO_0_26
	set_location_assignment PIN_E10 -to GPIO_0_27
	set_location_assignment PIN_C11 -to GPIO_0_28
	set_location_assignment PIN_B11 -to GPIO_0_29
	set_location_assignment PIN_A12 -to GPIO_0_30
	set_location_assignment PIN_D11 -to GPIO_0_31
	set_location_assignment PIN_D12 -to GPIO_0_32
	set_location_assignment PIN_B12 -to GPIO_0_33
	set_location_assignment PIN_T9 -to GPIO_1_IN_0
	set_location_assignment PIN_F13 -to GPIO_1_0
	set_location_assignment PIN_R9 -to GPIO_1_IN_1
	set_location_assignment PIN_T15 -to GPIO_1_1
	set_location_assignment PIN_T14 -to GPIO_1_2
	set_location_assignment PIN_T13 -to GPIO_1_3
	set_location_assignment PIN_R13 -to GPIO_1_4
	set_location_assignment PIN_T12 -to GPIO_1_5
	set_location_assignment PIN_R12 -to GPIO_1_6
	set_location_assignment PIN_T11 -to GPIO_1_7
	set_location_assignment PIN_T10 -to GPIO_1_8
	set_location_assignment PIN_R11 -to GPIO_1_9
	set_location_assignment PIN_P11 -to GPIO_1_10
	set_location_assignment PIN_R10 -to GPIO_1_11
	set_location_assignment PIN_N12 -to GPIO_1_12
	set_location_assignment PIN_P9 -to GPIO_1_13
	set_location_assignment PIN_N9 -to GPIO_1_14
	set_location_assignment PIN_N11 -to GPIO_1_15
	set_location_assignment PIN_L16 -to GPIO_1_16
	set_location_assignment PIN_K16 -to GPIO_1_17
	set_location_assignment PIN_R16 -to GPIO_1_18
	set_location_assignment PIN_L15 -to GPIO_1_19
	set_location_assignment PIN_P15 -to GPIO_1_20
	set_location_assignment PIN_P16 -to GPIO_1_21
	set_location_assignment PIN_R14 -to GPIO_1_22
	set_location_assignment PIN_N16 -to GPIO_1_23
	set_location_assignment PIN_N15 -to GPIO_1_24
	set_location_assignment PIN_P14 -to GPIO_1_25
	set_location_assignment PIN_L14 -to GPIO_1_26
	set_location_assignment PIN_N14 -to GPIO_1_27
	set_location_assignment PIN_M10 -to GPIO_1_28
	set_location_assignment PIN_L13 -to GPIO_1_29
	set_location_assignment PIN_J16 -to GPIO_1_30
	set_location_assignment PIN_K15 -to GPIO_1_31
	set_location_assignment PIN_J13 -to GPIO_1_32
	set_location_assignment PIN_J14 -to GPIO_1_33
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK_50
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_0
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_1
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_2
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_3
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_4
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_5
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_6
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_7
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY_0
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY_1
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_0
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_1
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_2
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_3
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_0
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_1
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_2
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_3
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_4
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_5
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_6
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_7
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_8
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_9
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_10
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_11
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_12
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_BA_0
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_BA_1
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CKE
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CLK
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CS_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_0
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_1
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_2
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_3
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_4
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_5
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_6
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_7
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_8
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_9
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_10
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_11
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_12
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_13
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_14
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_15
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQM_0
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQM_1
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CAS_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_RAS_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_WE_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to I2C_SCLK
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to I2C_SDAT
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to G_SENSOR_CS_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to G_SENSOR_INT
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_CS_N
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_SADDR
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_SCLK
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_SDAT
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_0
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_1
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_2
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_3
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_4
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_5
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_6
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_7
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_8
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_9
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_10
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_11
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_12
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_IN_0
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_IN_1
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_IN_2
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_IN_0
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_0
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_IN_1
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_1
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_2
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_3
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_4
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_5
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_6
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_7
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_8
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_9
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_10
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_11
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_12
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_13
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_14
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_15
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_16
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_17
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_18
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_19
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_20
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_21
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_22
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_23
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_24
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_25
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_26
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_27
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_28
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_29
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_30
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_31
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_32
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_33
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_IN_0
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_0
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_IN_1
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_1
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_2
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_3
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_4
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_5
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_6
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_7
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_8
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_9
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_10
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_11
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_12
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_13
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_14
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_15
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_16
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_17
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_18
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_19
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_20
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_21
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_22
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_23
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_24
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_25
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_26
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_27
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_28
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_29
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_30
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_31
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_32
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_33
	set_instance_assignment -name FAST_INPUT_REGISTER ON -to *
	set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to *
	set_instance_assignment -name TSU_REQUIREMENT "10 ns" -from * -to *
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
