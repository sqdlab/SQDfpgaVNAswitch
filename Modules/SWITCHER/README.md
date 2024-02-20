# SWITCHER Module

This is the main module that coordinates the switch with the VNA:

```verilog
SWITCHER(
	Clk,        		//Main global clock
	VNA_RDY,			//VNA Ready flag FROM VNA
	new_state,			//2-bit Switch state demanded
	new_state_arrived,	//New state change demanded
	VNA_TRIG,			//Trigger flag TO VNA
	sw_J1,				//Switch Contact J1
	sw_J2,				//Switch Contact J2
	sw_J3				//Switch Contact J3
    );
```

Note that the state is only clocked in when `new_state_arrived` is high. In such a case, when `new_state` is 0, 1 or 2, the switch is set permanently to positions 1, 2 or 3 respectively. If `new_state` is 3, then the switch remains in its current switch state and then begins a trigger loop by sending a pulse on `VNA_TRIG`. When the VNA finishes acquisition, it sends a trigger `VNA_RDY` back to this module. Upon receiving the `VNA_RDY` trigger, the module will toggle the switch state (in the order J1, J2, J3, J1 and so on, starting with the current switch position) before proceeding to send the next `VNA_TRIG` pulse.
