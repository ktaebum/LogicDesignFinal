`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:42:34 12/16/2018 
// Design Name: 
// Module Name:    Disp2BCH 
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
module Disp2BCH(
	input [6:0] seg_disp,
	output reg [3:0] out_bch
    );
	// inverse mapping module from seg disp bit to bch
	always @ (*)
	 begin
		case (seg_disp)
			7'b1111110: out_bch = 4'd0;
			7'b0110000: out_bch = 4'd1;
			7'b1101101: out_bch = 4'd2;
			7'b1111001: out_bch = 4'd3;
			7'b0110011: out_bch = 4'd4;
			7'b1011011: out_bch = 4'd5;
			7'b1011111: out_bch = 4'd6;
			7'b1110000: out_bch = 4'd7;
			7'b1111111: out_bch = 4'd8;
			7'b1111011: out_bch = 4'd9;
			// - sign for alarm display
			7'b0000001: out_bch = 4'd10;
			// big A (for AM)
			// 4'd12: display = 7'b1110111;
			// big P (for PM)
			// 4'd13: display = 7'b1100111;
			default: out_bch = 4'd0;
		endcase
	end
endmodule
