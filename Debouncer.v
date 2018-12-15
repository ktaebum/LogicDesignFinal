`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:50:19 12/15/2018 
// Design Name: 
// Module Name:    Debouncer 
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
module Debouncer(
	input clk,
	input input_data,
	output reg output_data
    );
	 
	 reg [3:0] counter;
	 
	 initial begin
		counter <= 0;
	 end
	 
	 always @ (posedge clk) begin
		if (!input_data) counter <= 0;
		else begin
			if (counter < 15) begin
				counter <= counter + 1;
			end
		end
		
		if (counter >= 15) begin
			output_data <= 1;
		end
		else begin
			output_data <= 0;
		end
	 end
endmodule
