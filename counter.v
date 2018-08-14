`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:56 08/13/2018 
// Design Name: 
// Module Name:    counter 
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
*													  *
* * * * * * * * * * * * * * * * * * * * */

module counter(EN, RST, CLK, LOAD, load_in, c_out, overflow_detect);
	
	input EN, RST, CLK, LOAD;
	input[3:0] load_in;
	
	output reg[3:0] c_out;
	output wire overflow_detect;
	
	reg overflow = 1'b0;
	
	always @(posedge CLK) begin
	
		if(RST) begin
			c_out <= 4'b0000;
		end
		
		if(EN) begin
		
			if(c_out == 4'b1111) begin
				overflow = 1'b1;
			end
			
			c_out <= c_out + 4'b0001;
			
		end
		
		if(LOAD) begin
			c_out <= load_in;
		end
	
	end
	
	assign overflow_detect = overflow;

	
endmodule 