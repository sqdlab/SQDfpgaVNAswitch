//Author: Prasanna Pakkiam
//Modified: 19/02/2024
//Description: A simple LED status indicator

module LED_STATUS #(parameter cntr_width=3, parameter cntr_tick=3'd4)(
	input Clk,
	input [1:0] state,
	output reg led
    );

	reg [cntr_width-1:0] tick_cntr;
	reg [3:0] blink_state;		//0-9 are LOW while 10-15 form the triple blinks...

	initial begin
	$dumpfile("waves.vcd");
	$dumpvars();
	end
	
	always @(posedge Clk) begin
		if (tick_cntr >= (cntr_tick-1))
			tick_cntr <= 0;
		else
			tick_cntr <= tick_cntr + 1;
		
		if (tick_cntr == 0) begin
			blink_state <= blink_state + 4'd1;
		end

		if (blink_state == 4'd10 || (blink_state == 4'd12 && state > 0) || (blink_state == 4'd14 && state > 1) || state == 2'd3)
			led <= 1'b1;
		else
			led <= 1'b0;
	end	 
	 
endmodule
