`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:20:44 12/03/2018 
// Design Name: 
// Module Name:    NormalClock 
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
module NormalClock(
	input clk,
	input reset,
	
	output reg isPM,
	output reg [5:0] seconds,
	output reg [5:0] minutes,
	output reg [4:0] hours
    );
	 
	 initial begin
		seconds <= 0;
		minutes <= 0;
		hours <= 0;
		isPM <= 0;
	 end
	 
	 always @ (posedge clk) begin
		if (reset) begin
			seconds <= 0;
			minutes <= 0;
			hours <= 0;
		end
		else begin
			if (seconds < 59) begin
				seconds <= seconds + 1;
			end
			else begin
				seconds <= 0;
				if (minutes < 59) begin
					minutes <= minutes + 1;
				end
				else begin
					minutes <= 0;
					if (hours < 23) begin
						hours <= hours + 1;
					end
					else begin
						hours <= 0;
					end
				end
			end
		end
	 end
	 
	 always @ (hours) begin
		if (hours >= 12) begin
			isPM <= 1;
		end
		else begin
			isPM <= 0;
		end
	 end
endmodule
