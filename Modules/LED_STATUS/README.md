# LED Status Module

This module blinks the panel LED depending on the state (1, 2 and 3 blinks for `state` being 0, 1 and 2 respectively):

```verilog
LED_STATUS #(
	cntr_width,	//Wait-time counter width
	cntr_tick	//Wait-time counter value
	) instLED_STATUS(
	Clk,        //Main global clock
	state, 		//2-bit state variable
	led			//Output panel LED
    );
```

Note that the `cntr_width` and `cntr_tick` parameters specify the number of clock ticks in which the LED stays on during a blink.
