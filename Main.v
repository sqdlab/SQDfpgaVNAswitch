module main(
	input CLOCK_50,
	output GPIO_0_0,
	
	output GPIO_2_0,	//CLK
	output GPIO_2_1,	//CLK
	input GPIO_2_6,	//ACQ-RDY
	output GPIO_2_4, 	//VNA-TRIG
	
	input GPIO_2_7,	//RST-Reset

    input GPIO_0_7,    //USB COM Module TX
	
	output GPIO_2_8,
	output GPIO_2_10,
	output GPIO_2_12,

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
    wire clk_UART;
	assign clk_UART = uart_counter < 13'd2604;
	always @(posedge clk_50) begin
        if (uart_counter >= 13'd5207)
            uart_counter = 13'd0;
        else
    		uart_counter <= uart_counter + 13'd1;
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

    assign debug_LEDs = UART_RX_Data;	
endmodule
