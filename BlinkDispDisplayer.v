`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:26:39 12/16/2018 
// Design Name: 
// Module Name:    BlinkDispDisplayer 
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
module BlinkDispDisplayer(
	input isOn,
	input [6:0] in_disp,
	output reg [6:0] out_disp
    );
	 
	always @ (*) begin
		if (isOn) begin
			out_disp <= in_disp;
		end
		else begin
			out_disp <= 7'b0000000;
		end
	end


endmodule
