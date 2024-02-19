# UART TX Module

This module simply transmits UART bytes via a 16-byte FIFO:

```verilog
UART_TX instUART_TX(
	Clk,        //Main global clock
	Clk_UART,   //Clock divided UART-clock phase-synchronous with Clk
	send_data,  //Send data flag
	Data_TX,    //8-Bit byte of data to send
	is_busy,    //Busy flag
	TX          //Output UART serial data stream
    );
```

Note that when `send_data` flag is made high the byte on `send_data` is clocked into the module's FIFO and readied for transfer. The `is_busy` flag is held high when the module is transmitting a byte. Note that data can be buffered into the module at any time (even during an output data transfer) as long as it does not overflow the 16-byte FIFO.
