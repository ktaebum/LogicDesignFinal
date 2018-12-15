`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:20 12/15/2018 
// Design Name: 
// Module Name:    Clock12 
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
module Clock12(
	input clk,
	input reset,
	input propagate,
	input in_PM,
	input [3:0] in_hours,
	input [5:0] in_minutes,
	
	output reg isPM,
	output reg [3:0] hours,
	output reg [5:0] minutes
    );
	 
	reg [5:0] seconds;
	 
	initial begin
		isPM <= 0;
		hours <= 12;
		minutes <= 0;
		seconds <= 0;
	end
	
	always @ (posedge propagate or posedge reset or posedge clk) begin
		if (reset) begin
			isPM <= 0;
			hours <= 12;
			minutes <= 0;
			seconds <= 0;
		end
		else begin
			if (propagate) begin
				isPM <= in_PM;
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
						if (hours == 12) begin
							hours <= 1;
						end
						else begin
							if (hours == 11) begin
								isPM <= isPM + 1;
							end
							hours <= hours + 1;
						end
					end
				end
			end
		end
	end


endmodule
