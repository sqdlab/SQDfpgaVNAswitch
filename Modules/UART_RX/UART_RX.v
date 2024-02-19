//Author: Prasanna Pakkiam
//Modified: 19/02/2024
//Description: A simple UART receiver.

module UART_RX(
	input Clk_UART,
	input RX,
	output reg [7:0] Data_RX,
	output reg new_data
    );
	
	reg [7:0] rcv_buffer;
	reg [3:0] state;
	reg last_RX;

	initial begin
	$dumpfile("waves.vcd");
	$dumpvars();
	state = 4'b0;
	end

	always @(posedge Clk_UART) begin
		last_RX <= RX;
		if (state == 4'd0)
		begin
			if (last_RX == 1'b1 && RX == 1'b0)
				state <= 4'd9;
			else
				state <= 4'b0;
			new_data <= 1'b0;
		end
		else if (state == 4'b1)
		begin
			$strobe ("UART RX received 0x%0h", rcv_buffer);
			Data_RX <= rcv_buffer;
			new_data <= 1'b1;
			state <= 4'b0;
		end
		else
		begin
			rcv_buffer[7] <= RX;
			rcv_buffer[6] <= rcv_buffer[7];
			rcv_buffer[5] <= rcv_buffer[6];
			rcv_buffer[4] <= rcv_buffer[5];
			rcv_buffer[3] <= rcv_buffer[4];
			rcv_buffer[2] <= rcv_buffer[3];
			rcv_buffer[1] <= rcv_buffer[2];
			rcv_buffer[0] <= rcv_buffer[1];
			state <= state - 4'b1;
			new_data <= 1'b0;
		end
	end
	 
endmodule
