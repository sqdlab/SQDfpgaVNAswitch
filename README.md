# SQDfpgaVNAswitch

Switching module to expand the number of ports in a Vector Network Analyser.

## Installation

Install Quartus Prime along with the programmer. Then clone the repository in some appropriate folder:

```
git clone https://github.com/sqdlab/SQDfpgaVNAswitch.git
```

Locate the quartus bin folder (e.g. `/home/<USERNAME>/intelFPGA/18.0/quartus/bin/`). Now enter the cloned folder and run the TCL script:

```
cd SQDfpgaVNAswitch
/home/<USERNAME>/intelFPGA/18.0/quartus/bin/quartus_sh -t Main.tcl
```

This should build the Quartus project.
