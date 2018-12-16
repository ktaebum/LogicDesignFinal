`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:29:19 12/17/2018 
// Design Name: 
// Module Name:    OR 
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
module OR(
	input a,
	input b,
	output reg out
    );
	 
	always @ (*) begin
		out <= a || b;
	end


endmodule
