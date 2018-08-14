`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:22:20 08/13/2018 
// Design Name: 
// Module Name:    counter_tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

/* * * * * * * * * * * * * * * * * * * * *
*	Counter by Alex Santilli (sync reset) *
*					Testbench					  *
* * * * * * * * * * * * * * * * * * * * */

module counter_tb();

	reg EN_t, RST_t, CLK_t, LOAD_t;
	reg[3:0] load_in_t;
	
	wire[3:0] c_out_t;
	wire overflow_detect_t;
	
	initial begin
		
		CLK_t = 0;
		LOAD_t = 0;
		load_in_t = 4'b0110;
		#5 RST_t <= 1;
		#10 RST_t <= 0;
		
		#20 LOAD_t = 1;
		#45 LOAD_t = 0;
		
		#50 EN_t <= 1;
		#960 EN_t <= 0;
		
	end

	always #40 begin
		CLK_t <= ~CLK_t;
	end

	counter MUT(EN_t, RST_t, CLK_t, LOAD_t, load_in_t, c_out_t, overflow_detect_t);
	
endmodule 