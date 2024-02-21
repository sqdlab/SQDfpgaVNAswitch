//Author: Prasanna Pakkiam
//Modified: 19/02/2024
//Description: A simple LED status indicator

module SWITCHER(
	input Clk,
	input VNA_RDY,
	input [1:0] new_state,
	input new_state_arrived,
	output reg VNA_TRIG,
	output sw_J1,
	output sw_J2,
	output sw_J3
    );

	reg [3:0] ACQ_cleanup;
	reg tick_state;
	reg [4:0] tick_cntr;
	reg [1:0] switch_state;
	reg switching;
	reg reset_state;

	initial begin
	$dumpfile("waves.vcd");
	$dumpvars();
	ACQ_cleanup = 4'b0;
	tick_state = 1'b0;
	tick_cntr = 5'b0;
	switch_state = 2'b0;
	switching = 1'b0;
	end
	
	assign sw_J1 = ~(switch_state == 2'd0);
	assign sw_J2 = ~(switch_state == 2'd1);
	assign sw_J3 = ~(switch_state == 2'd2);

	always @(posedge Clk) begin
		ACQ_cleanup[0] <= VNA_RDY;
		ACQ_cleanup[1] <= ACQ_cleanup[0];
		ACQ_cleanup[2] <= ACQ_cleanup[1];
		ACQ_cleanup[3] <= ACQ_cleanup[2];

		if (new_state_arrived) begin
			tick_state <= 1'b0;
			if (new_state == 2'd3)
				begin
					reset_state <= 1'b1;
					switching <= 1'b1;
				end
			else
				begin
					reset_state <= 1'b0;
					switching <= 1'b0;
					switch_state <= new_state;
				end
		end
		else
		begin
			reset_state <= 1'b0;
			case (tick_state)
				1'd0:
					begin
						tick_cntr <= 5'd0;
						VNA_TRIG <= 1'b0;

						if (switching) begin
							if (reset_state)
								tick_state <= 1'd1;
							else if (ACQ_cleanup[3:2] == 2'b01 || reset_state) begin
								case (switch_state)
									2'd0: switch_state <= 2'd1;
									2'd1: switch_state <= 2'd2;
									2'd2: switch_state <= 2'd0;
									2'd3: switch_state <= 2'd0;
								endcase
							end
						end
						else
							tick_state <= 1'd0;

						if (switching && (ACQ_cleanup[3:2] == 2'b01 || reset_state))
							tick_state <= 1'd1;
						else
							tick_state <= 1'd0;
					end
				1'd1:	//TICK PULSING VNA-TRIG
					begin
					if (tick_cntr < 5'd29)
						begin
						tick_cntr <= tick_cntr + 5'd1;
						tick_state <= 1'd1;
						end
					else
						begin
						tick_cntr <= 5'd0;
						tick_state <= 1'd0;
						end
					
					if (tick_cntr > 5'd4)
						VNA_TRIG <= 1'b1;
					else
						VNA_TRIG <= 1'b0;
					end
			endcase
		end
	end	 
	 
endmodule
