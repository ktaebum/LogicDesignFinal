`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:17:54 12/15/2018 
// Design Name: 
// Module Name:    Clock24 
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
module Clock24(
	input clk,
	input reset,
	input propagate,
	input [4:0] in_hours,
	input [5:0] in_minutes,
	
	output reg [4:0] hours,
	output reg [5:0] minutes,
	output reg [5:0] seconds
    );
	 
	initial begin
		hours <= 0;
		minutes <= 0;
		seconds <= 0;
	end
	
	always @ (posedge propagate or posedge clk or posedge reset) begin
		if (reset) begin
			hours <= 0;
			minutes <= 0;
			seconds <= 0;
		end
		else begin
			if (propagate) begin
				// load set value
				hours <= in_hours;
				minutes <= in_minutes;
				seconds <= 0;
			end
			else begin
				// normal counter
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
	end
endmodule
