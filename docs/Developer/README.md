# Developer documentation

## Installation

Install Quartus Prime along with the programmer (this works in both Windows and Linux). Then clone the repository in some appropriate folder:

```
git clone https://github.com/sqdlab/SQDfpgaVNAswitch.git
```

Locate the quartus bin folder (e.g. `/home/<USERNAME>/intelFPGA/18.0/quartus/bin/` in Ubuntu). Now enter the cloned folder and run the TCL script:

```
cd SQDfpgaVNAswitch
/home/<USERNAME>/intelFPGA/18.0/quartus/bin/quartus_sh -t Main.tcl
```

This should build the Quartus project.

## Running the simulation test-benches

First install verilator via the package manager. Specifically install `cmake`, `ninja` (aka `ninja-build`), `verilator` and `gtkwave`.

Each module has a `sim` directory in which there is a `build.sh`. Run this shell script to create the build. Then run the shell script `run.sh`. This runs the simulation executable and then opens the results for viewing in `gtkwave`.

## Build notes

Use a 40-pin ribbon to connect the GPIO-00 connector on the DE0-Nano FPGA to the peripherals. The chosen pin-out was (check the datasheet/manual for details):

- GPIO_0_1 - J1 contact of the RF switch
- GPIO_0_2 - J2 contact of the RF switch
- GPIO_0_3 - J3 contact of the RF switch
- GPIO_0_4 - Trigger going **TO** VNA trigger input
- GPIO_0_5 - Trigger coming **FROM** VNA ACQ ready output
- GPIO_0_6 - USB-COM Module RX
- GPIO_0_7 - USB-COM Module TX
- GPIO_0_8 - Status Panel LED (optional)

Regarding the connectors:

- Use appropriate panel mounts for the USB ports
- Use BNC feedthrough ports for the to/from triggers to the VNA as those ports are typically BNC
- Use SMA feedthrough ports for the switch J0, J1, J2 and J3 ports
- Use an optional panel-mount LED with the appropriate series resistor (51Ω in the suggested implementation)



