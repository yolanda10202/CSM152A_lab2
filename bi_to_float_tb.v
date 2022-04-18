`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:11:56 04/18/2022 
// Design Name: 
// Module Name:    bi_to_float_tb 
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
module bi_to_float_tb(result);

	reg [11:0] a = 12'b000110100110;
	output [7:0] result;
	
	bi_to_float m_bi_to_float(.bi(a), .ft(result));
	
	initial begin
		// test 422
		#50;
		
		// test -422
		a = 12'b111001011010;
		#50;
	end
endmodule
