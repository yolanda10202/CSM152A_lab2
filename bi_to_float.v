`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:39:34 04/18/2022 
// Design Name: 
// Module Name:    bi_to_float 
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
module bi_to_float(bi, ft);
	input [11:0] bi;
	output reg [7:0] ft;
	reg [4:0] countZeroes;
	reg [11:0] biVal;
	
	initial
	begin
		biVal = bi;
	end
	
	always @(*) begin
		// figure out sign
		if(bi[11] == 1)
		begin
			ft[7] = 1;
			biVal = ~biVal + 1;
		end
		
		else
		begin
			ft[7] = 0;
		end
		
		
		// find out # leading zeros, determine exponent
		while(biVal[11] == 0)
		begin
			countZeroes = countZeroes + 1;
			biVal = biVal << 1;
		end
		
		// set exponent
		if(countZeroes >= 8)
		begin
			ft[6:4] <= 0;
		end
		
		else 
		begin
			ft[6:4] <= 8-countZeroes;
		end
		
		// assign significands
		ft[3:0] <= biVal[11:8];
		
		// rounding
		if(biVal[7] == 1 && ft[3:0] != 4'b1111)
		begin
			ft <= ft + 1;
		end
		
		else if (biVal[7] == 1 && ft[3:0] == 4'b1111)
		begin
			if (ft[6:4] != 3'b111)
			begin 
				ft[6:4] = ft[6:4] + 1;
				ft[4:0] = 4'b1000;
			end
		end
		
	end
endmodule
