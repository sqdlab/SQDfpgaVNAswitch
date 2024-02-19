# UART RX Module

This module simply receives and outputs a UART byte:

```verilog
UART_RX instUART_RX(
	Clk_UART,   //UART clock input
	RX,         //Input UART serial data stream
	Data_RX,    //8-Bit byte
	new_data    //New data flag
    );
```

Note that the `new_data` flag is made high for one clock cycle on receiving a new byte (it should be read on observing the flag as high).
