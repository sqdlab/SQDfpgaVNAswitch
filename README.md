# SQDfpgaVNAswitch

Switching module to expand the number of ports in a Vector Network Analyser. Specifically:

- This project takes a typical 4-port VNA with input and output triggers (e.g. *Agilent N5232A*, *Keysight PNA-L series* etc.) and multiplexes the output port into 3 ports.
- Thus, one can measure a full 3x3 s-parameter matrix in 3 rapid switching cycles (with the main bottleneck being the VNA acquisition time).
- The module operates via a simple serial USB COM port to a PC. It is thus, compatible with the drivers in [SQDToolz](https://github.com/sqdlab/SQDToolz).

The implementation utilises:

- *DE0-Nano* FPGA
- High speed *RF-Lambda RFSP3TR0208G* triple-throw RF switch
- USB COM port

Two documentation classes exist for this project:

- [User Documentation](docs/User/README.md)
- [Developer Documentation](docs/Developer/README.md)
