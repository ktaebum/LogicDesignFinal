`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:04:03 12/15/2018 
// Design Name: 
// Module Name:    ClockModulatorSmall 
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
module ClockModulatorSmall(
 	input clk,
	input reset,
	output reg usr_clk
    );
	 
	 reg [4:0] counter;
	 
	 initial begin
		counter <= 0;
		usr_clk <= 0;
	 end
	 
	 always @ (posedge clk) begin
		if (reset) begin
			counter <= 0;
			usr_clk <= 0;
		end
		else begin
			counter <= counter + 1;
			if (counter == 15) begin
				counter <= 0;
				usr_clk <= usr_clk +1;
			end
		end
	 end
endmodule
