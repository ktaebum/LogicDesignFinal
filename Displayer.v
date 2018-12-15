`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:58 12/15/2018 
// Design Name: 
// Module Name:    Displayer 
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
module Displayer(
	input [3:0] bch,
	output reg [6:0] display
    );
	 always @ (*)
	 begin
		case (bch)
			4'd0: display = 7'b1111110;
			4'd1: display = 7'b0110000;
			4'd2: display = 7'b1101101;
			4'd3: display = 7'b1111001;
			4'd4: display = 7'b0110011;
			4'd5: display = 7'b1011011;
			4'd6: display = 7'b1011111;
			4'd7: display = 7'b1110000;
			4'd8: display = 7'b1111111;
			4'd9: display = 7'b1111011;
			// offsign
			4'd10: display = 7'b0000000;
			// - sign for alarm display
			4'd11: display = 7'b0000001;
			// big A (for AM)
			4'd12: display = 7'b1110111;
			// big P (for PM)
			4'd13: display = 7'b1100111;
			//4'd12: display = 7'b1001110;
			//4'd13: display = 7'b0111101;
			//4'd14: display = 7'b1001111;
			//4'd15: display = 7'b1000111;
			default: display = 7'b0000000;
		endcase
	end
endmodule
