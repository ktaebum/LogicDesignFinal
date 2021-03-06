`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:19 12/15/2018 
// Design Name: 
// Module Name:    RealClockModulator 
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
module RealClockModulator(
	input clk,
	input reset,
	output reg usr_clk,
	output reg quarter
    );
	 
	 reg [24:0] counter;
	 
	 initial begin
		counter <= 0;
		usr_clk <= 0;
		quarter <= 0;
	 end
	 
	 always @ (posedge clk) begin
		if (reset) begin
			counter <= 0;
			usr_clk <= 0;
			quarter <= 0;
		end
		else begin
			counter <= counter + 1;
			if (counter == 25000000) begin
				counter <= 0;
				usr_clk <= usr_clk +1;
				quarter <= 0;
			end
			else if (counter == 18750000) begin
				quarter <= 1;
			end
			else if (counter == 12500000) begin
				quarter <= 0;
			end
			else if (counter == 6250000) begin
				quarter <= 1;
			end
		end
	 end
endmodule
