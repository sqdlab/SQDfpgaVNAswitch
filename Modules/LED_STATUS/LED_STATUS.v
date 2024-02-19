//Author: Prasanna Pakkiam
//Modified: 19/02/2024
//Description: A simple LED status indicator

module LED_STATUS(
	input Clk,
	input state,
	input [7:0] Data_TX,
	output is_busy,
	output TX
    );

	reg [10:0] send_buffer;
	reg [3:0] state;

	reg [7:0] fifo[0:15];
	reg [3:0] ptr_head;
	reg [3:0] ptr_tail;

	initial begin
	$dumpfile("waves.vcd");
	$dumpvars();
	send_buffer = 11'b1111111111;
	state = 4'b0;
	ptr_head = 4'b0;
	ptr_tail = 4'b0;
	end
	
	assign TX = send_buffer[0];
	assign is_busy = (state != 4'b0);

	always @(posedge Clk) begin
		if (send_data)
			begin
				ptr_head <= ptr_head + 4'b1;	//Don't need to worry about modulo as it's 4-bit already...
				fifo[ptr_head] <= Data_TX;
			end
	end

	always @(posedge Clk_UART) begin
		if (state == 4'd0)
		begin
			if (ptr_head != ptr_tail)
				begin
    			$strobe ("UART TX sending 0x%0h", fifo[ptr_tail]);
				send_buffer[10] <= 1'b1;			//Stop Bit
				send_buffer[9:2] <= fifo[ptr_tail];	//Data Bits
				send_buffer[1] <= 1'b0;			//Start Bit
				send_buffer[0] <= 1'b1;			//Start Bit
				state <= 4'd15;
				ptr_tail <= ptr_tail + 4'b1;
				end
			else
			begin
				state <= 4'b0;
				send_buffer <= 11'bxxxxxxxxxx1;
			end
		end
		else
		begin
			if (state < 4'd10)
				begin
					send_buffer[10] <= 1'b1;
					send_buffer[9] <= send_buffer[10];
					send_buffer[8] <= send_buffer[9];
					send_buffer[7] <= send_buffer[8];
					send_buffer[6] <= send_buffer[7];
					send_buffer[5] <= send_buffer[6];
					send_buffer[4] <= send_buffer[5];
					send_buffer[3] <= send_buffer[4];
					send_buffer[2] <= send_buffer[3];
					send_buffer[1] <= send_buffer[2];
					send_buffer[0] <= send_buffer[1];
				end
			state <= state - 4'b1;
		end
	end
	 
	 
endmodule
