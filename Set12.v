`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:10:18 12/15/2018 
// Design Name: 
// Module Name:    Set12 
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
module Set12(
	input setEnable,
	input clk,
	input reset,
	input set,
	input up,
	input down,
	
	output reg propagate,
	output reg isPM,
	output reg [3:0] hours,
	output reg [5:0] minutes,
	output reg [1:0] currentState
    );
	parameter INITIAL = 2'b00; // initial reset state
	parameter PM = 2'b01; // PM Setting
	parameter HOUR = 2'b10; // Hour Setting
	parameter MINUTE = 2'b11; // Minute Setting
	
	reg [1:0] setting_state;
	
	initial begin
		propagate <= 0;
		isPM <= 0;
		hours <= 12;
		minutes <= 0;
		setting_state <= INITIAL;
	end
	
	always @ (*) begin
		currentState <= setting_state;
	end
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			propagate <= 0;
			isPM <= 0;
			hours <= 12;
			minutes <= 0;
			setting_state <= INITIAL;
		end
		else begin
			if (setEnable) begin
			case (setting_state)
				INITIAL: begin
					propagate <= 0;
					if (set) begin
						setting_state <= PM;
						isPM <= 0;
						hours <= 12;
						minutes <= 0;
						propagate <= 0;
					end
				end
				PM: begin
					if (set) begin
						setting_state <= HOUR;
						propagate <= 0;
					end
					else begin
						if (up) begin
							// toggle
							isPM <= isPM + 1;
						end
						else begin
							if (down) begin
								// toggle
								isPM <= isPM + 1;
							end
						end
					end
				end
				
				HOUR: begin
					if (set) begin
						setting_state <= MINUTE;
						propagate <= 0;
					end
					else begin
						if (up) begin
							if (hours == 12) begin
								// goto 1
								hours <= 1;
							end
							else begin
								hours <= hours + 1;
							end
						end
						else begin
							if (down) begin
								if (hours == 1) begin
									// goto 12
									hours <= 12;
								end
								else begin
									hours <= hours - 1;
								end
							end
						end
					end
				end
				
				MINUTE: begin
					if (set) begin
						setting_state <= INITIAL;
						propagate <= 1;
					end
					else begin
						if (up) begin
							if (minutes == 59) begin
								// goto 0, do not carry
								minutes <= 0;
							end
							else begin
								minutes <= minutes + 1;
							end
						end
						else begin
							if (down) begin
								if (minutes == 0) begin
									minutes <= 59;
								end
								else begin
									minutes <= minutes - 1;
								end
							end
						end
					end
				end
			endcase
			end
		end
	end
endmodule
