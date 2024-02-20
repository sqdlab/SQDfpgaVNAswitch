module main(
	input CLOCK_50,

    input GPIO_0_7,     //USB COM Module TX
    output GPIO_0_6,    //USB COM Module RX

    output GPIO_0_8,    //Status Panel LED
    
    input GPIO_0_5,     //ACQ Trigger FROM VNA
    output GPIO_0_4,    //Trigger TO VNA

	output GPIO_0_1,
	output GPIO_0_2,
	output GPIO_0_3,

    output LED_0,
    output LED_1,
    output LED_2,
    output LED_3,
    output LED_4,
    output LED_5,
    output LED_6,
    output LED_7
	);

	wire clk_50;
	CLOCK_PLL instClkPll(CLOCK_50, clk_50);
	
    //Generate a 9600 BAUD via a 50MHz clock
    reg [12:0] uart_counter;
    reg clk_UART;
	always @(posedge clk_50) begin
        if (uart_counter >= 13'd5207)
            uart_counter <= 13'd0;
        else
    		uart_counter <= uart_counter + 13'd1;
		if (uart_counter < 13'd2604)
			clk_UART <= 1'b1;
		else
			clk_UART <= 1'b0;
	end
	
    wire [7:0] debug_LEDs;
    assign LED_0 = debug_LEDs[0];
    assign LED_1 = debug_LEDs[1];
    assign LED_2 = debug_LEDs[2];
    assign LED_3 = debug_LEDs[3];
    assign LED_4 = debug_LEDs[4];
    assign LED_5 = debug_LEDs[5];
    assign LED_6 = debug_LEDs[6];
    assign LED_7 = debug_LEDs[7];

    wire [7:0] UART_RX_Data;
    wire UART_RX_new;
    UART_RX instUART_RX(
        clk_UART,       //UART clock input
        GPIO_0_7,      //Input UART serial data stream
        UART_RX_Data,   //8-Bit byte
        UART_RX_new     //New data flag
        );
    //assign debug_LEDs = UART_RX_Data;
	 
    reg [1:0] switch_state;

    reg uart_tx_send;
    wire uart_tx_busy;
    reg [7:0] uart_tx_data;
    UART_TX instUART_TX(
        clk_50,         //Main global clock
        clk_UART,       //Clock divided UART-clock phase-synchronous with Clk
        uart_tx_send,   //Send data flag
        uart_tx_data,   //8-Bit byte of data to send
        uart_tx_busy,   //Busy flag
        GPIO_0_6        //Output UART serial data stream
        );

    reg last_RX_flag;
    always @(posedge clk_50) begin
        last_RX_flag <= UART_RX_new;
        if (UART_RX_new == 1'b1 && last_RX_flag == 1'b0) begin
            if (UART_RX_Data == 8'b01010101)   //'U'
                begin
                uart_tx_data <= 8'd80;
                uart_tx_send <= 1'b1;
                switch_state <= 2'd0;
                end
            else if (UART_RX_Data == 8'b01101010)   //'j'
                begin
                uart_tx_data <= 8'd82;
                uart_tx_send <= 1'b1;
                switch_state <= 2'd1;
                end
            else if (UART_RX_Data == 8'b01100110)   //'f'
                begin
                uart_tx_data <= 8'd83;
                uart_tx_send <= 1'b1;
                switch_state <= 2'd2;
                end
            else if (UART_RX_Data == 8'b01110111)   //'w'
                begin
                uart_tx_data <= 8'd84;
                uart_tx_send <= 1'b1;
                switch_state <= 2'd3;
                end
            else
                uart_tx_send <= 1'b0;
        end
        else
            uart_tx_send <= 1'b0;
    end

    LED_STATUS #(24, 24'd10000000) instLED_STATUS(
        clk_50,         //Main global clock
        switch_state,   //Send data flag
        GPIO_0_8        //Output Status LED
        );
    
    SWITCHER instSWITCHER(
        clk_50,         //Main global clock
        GPIO_0_5,       //FROM VNA ACQ Ready
        switch_state,   //Switch state demanded
        uart_tx_send,   //New state change demanded
        GPIO_0_4,       //TO VNA Trigger
        GPIO_0_1,       //Switch Contact J1
        GPIO_0_2,       //Switch Contact J2
        GPIO_0_3        //Switch Contact J3
    );

endmodule
