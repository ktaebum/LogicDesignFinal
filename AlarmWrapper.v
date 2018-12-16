`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:14:46 12/16/2018 
// Design Name: 
// Module Name:    AlarmWrapper 
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
module AlarmWrapper(
	input [1:0] currentMode,
	input real_quarter,
	input clk,
	input set,
	input display,
	input clear,
	input reset,
	
	output [4:0] alarm_hours,
	output [5:0] alarm_minutes,
	
	output reg [3:0] bch0,
	output reg [3:0] bch1,
	output reg [3:0] bch2,
	output reg [3:0] bch3,
	output reg [3:0] bch4,
	output reg [3:0] bch5
	);
	 
	reg dispMode;
	
	initial begin
		// 0 for 24 system, 1 for 12 system
		dispMode <= 0;
	end
	 
	wire alarm12_propagate;
	wire alarm12_isPM;
	wire [3:0] alarm12_hours;
	wire [5:0] alarm12_minutes;
	wire [1:0] alarm12_state;
	
	wire alarm24_propagate;
	wire [4:0] alarm24_hours;
	wire [5:0] alarm24_minutes;
	wire [1:0] alarm24_state;
	
	Set12 alarm12set (dispMode && (currentMode == 1), clk, reset, set, display, clear, 
		alarm12_propagate, alarm12_isPM, alarm12_hours, alarm12_minutes, alarm12_state);
		
	Set24 alarm24set (!dispMode && (currentMode == 1), clk, reset, set, display, clear, 
		alarm24_propagate, alarm24_hours, alarm24_minutes, alarm24_state);
		
	AlarmSetter alarmsetter (clk, reset || (clear && (currentMode == 1)), dispMode, alarm12_propagate || alarm24_propagate, 
		alarm12_isPM, alarm12_hours, alarm12_minutes,
		alarm24_hours, alarm24_minutes, alarm_hours, alarm_minutes);
	
	
	always @ (*) begin
		case (dispMode)
			0: begin
				// 24 system
				// seconds are always 0
				
				if (alarm24_state == 0) begin
					// normal clock display
					// seconds always 0
					if (alarm_hours == 24) begin
						bch0 <= 11;
						bch1 <= 11;
						bch2 <= 11;
						bch3 <= 11;
						bch4 <= 11;
						bch5 <= 11;
					end
					else begin
						bch4 <= 0;
						bch5 <= 0;
						if (alarm_hours >= 0 && alarm_hours < 10) begin
							bch0 <= 0;
							bch1 <= alarm_hours;
						end
						else if (alarm_hours >= 10 && alarm_hours < 20) begin
							bch0 <= 1;
							bch1 <= alarm_hours - 10;
						end
						else begin
							bch0 <= 2;
							bch1 <= alarm_hours - 20;
						end
						
						if (alarm_minutes >= 0 && alarm_minutes < 10) begin
							bch2 <= 0;
							bch3 <= alarm_minutes;
						end
						else if (alarm_minutes >= 10 && alarm_minutes < 20) begin
							bch2 <= 1;
							bch3 <= alarm_minutes - 10;
						end
						else if (alarm_minutes >= 20 && alarm_minutes < 30) begin
							bch2 <= 2;
							bch3 <= alarm_minutes - 20;
						end
						else if (alarm_minutes >= 30 && alarm_minutes < 40) begin
							bch2 <= 3;
							bch3 <= alarm_minutes - 30;
						end
						else if (alarm_minutes >= 40 && alarm_minutes < 50) begin
							bch2 <= 4;
							bch3 <= alarm_minutes - 40;
						end
						else begin
							bch2 <= 5;
							bch3 <= alarm_minutes - 50;
						end
					end
				end
				else begin
					// setter display
					bch4 <= 0;
					bch5 <= 0;
					if (alarm24_hours >= 0 && alarm24_hours < 10) begin
						if (alarm24_state == 1) begin
							// setting hour, blink!
							if (real_quarter) begin
								bch0 <= 0;
								bch1 <= alarm24_hours;
							end
							else begin
								bch0 <= 10;
								bch1 <= 10;
							end
						end
						else begin
							// setting minute
							bch0 <= 0;
							bch1 <= alarm24_hours;
						end
					end
					else if (alarm24_hours >= 10 && alarm24_hours < 20) begin
						if (alarm24_state == 1) begin
							if (real_quarter) begin
								bch0 <= 1;
								bch1 <= alarm24_hours - 10;
							end
							else begin
								bch0 <= 10;
								bch1 <= 10;
							end
						end
						else begin
							bch0 <= 1;
							bch1 <= alarm24_hours - 10;
						end
					end
					else begin
						if (alarm24_state == 1) begin
							if (real_quarter) begin
								bch0 <= 2;
								bch1 <= alarm24_hours - 20;
							end
							else begin
								bch0 <= 10;
								bch1 <= 10;
							end
						end
						else begin
							bch0 <= 2;
							bch1 <= alarm24_hours - 20;
						end
					end
					
					if (alarm24_minutes >= 0 && alarm24_minutes < 10) begin
						if (alarm24_state == 2) begin
							if (real_quarter) begin
								bch2 <= 0;
								bch3 <= alarm24_minutes;
							end
							else begin
								bch2 <= 10;
								bch3 <= 10;
							end
						end
						else begin
							bch2 <= 0;
							bch3 <= alarm24_minutes;
						end
					end
					else if (alarm24_minutes >= 10 && alarm24_minutes < 20) begin
						if (alarm24_state == 2) begin
							if (real_quarter) begin
								bch2 <= 1;
								bch3 <= alarm24_minutes - 10;
							end
							else begin
								bch2 <= 10;
								bch3 <= 10;
							end
						end
						else begin
							bch2 <= 1;
							bch3 <= alarm24_minutes - 10;
						end
					end
					else if (alarm24_minutes >= 20 && alarm24_minutes < 30) begin
						if (alarm24_state == 2) begin
							if (real_quarter) begin
								bch2 <= 2;
								bch3 <= alarm24_minutes - 20;
							end
							else begin
								bch2 <= 10;
								bch3 <= 10;
							end
						end
						else begin
							bch2 <= 2;
							bch3 <= alarm24_minutes - 20;
						end
					end
					else if (alarm24_minutes >= 30 && alarm24_minutes < 40) begin
						if (alarm24_state == 2) begin
							if (real_quarter) begin
								bch2 <= 3;
								bch3 <= alarm24_minutes - 30;
							end
							else begin
								bch2 <= 10;
								bch3 <= 10;
							end
						end
						else begin
							bch2 <= 3;
							bch3 <= alarm24_minutes - 30;
						end
					end
					else if (alarm24_minutes >= 40 && alarm24_minutes < 50) begin
						if (alarm24_state == 2) begin
							if (real_quarter) begin
								bch2 <= 4;
								bch3 <= alarm24_minutes - 40;
							end
							else begin
								bch2 <= 10;
								bch3 <= 10;
							end
						end
						else begin
							bch2 <= 4;
							bch3 <= alarm24_minutes - 40;
						end
					end
					else begin
						if (alarm24_state == 2) begin
							if (real_quarter) begin
								bch2 <= 5;
								bch3 <= alarm24_minutes - 50;
							end
							else begin
								bch2 <= 10;
								bch3 <= 10;
							end
						end
						else begin
							bch2 <= 5;
							bch3 <= alarm24_minutes - 50;
						end
					end
					
				end
			end
			1: begin
				// 12 system
				if (alarm12_state == 0) begin
					if (alarm_hours == 24) begin
						bch0 <= 11;
						bch1 <= 11;
						bch2 <= 11;
						bch3 <= 11;
						bch4 <= 11;
						bch5 <= 11;
					end
					else begin
					// always off
						bch1 <= 10;
						if (alarm_hours >= 12) begin
							// PM
							bch0 <= 13;
							if (alarm_hours == 12) begin
								bch2 <= 1;
								bch3 <= 2;
							end
							else begin
								bch2 <= 0;
								bch3 <= alarm_hours - 12;
							end
						end
						else begin
							// AM
							bch0 <= 12;
							if (alarm_hours == 0) begin
								bch2 <= 1;
								bch3 <= 2;
							end
							else begin
								bch2 <= 0;
								bch3 <= alarm_hours;
							end
						end
						
						if (alarm_minutes >= 0 && alarm_minutes < 10) begin
							bch4 <= 0;
							bch5 <= alarm_minutes;
						end
						else if (alarm_minutes >= 10 && alarm_minutes < 20) begin
							bch4 <= 1;
							bch5 <= alarm_minutes - 10;
						end
						else if (alarm_minutes >= 20 && alarm_minutes < 30) begin
							bch4 <= 2;
							bch5 <= alarm_minutes - 20;
						end
						else if (alarm_minutes >= 30 && alarm_minutes < 40) begin
							bch4 <= 3;
							bch5 <= alarm_minutes - 30;
						end
						else if (alarm_minutes >= 40 && alarm_minutes < 50) begin
							bch4 <= 4;
							bch5 <= alarm_minutes - 40;
						end
						else begin
							bch4 <= 5;
							bch5 <= alarm_minutes - 50;
						end
					end
				end
				else begin
					// setter display
					bch1 <= 10;
					if (alarm12_isPM == 1) begin
						// PM Set
						if (alarm12_state == 1) begin
							if (real_quarter) begin
								bch0 <= 13;
							end
							else begin
								bch0 <= 10;
							end
						end
						else begin
							bch0 <= 13;
						end
					end
					else begin
						// AM Set
						if (alarm12_state == 1) begin
							if (real_quarter) begin
								bch0 <= 12;
							end
							else begin
								bch0 <= 10;
							end
						end
						else begin
							bch0 <= 12;
						end
					end
					
					if (alarm12_hours >= 0 && alarm12_hours < 10) begin
						if (alarm12_state == 2) begin
							// setting hour, blink!
							if (real_quarter) begin
								bch2 <= 0;
								bch3 <= alarm12_hours;
							end
							else begin
								bch2 <= 10;
								bch3 <= 10;
							end
						end
						else begin
							// setting minute
							bch2 <= 0;
							bch3 <= alarm12_hours;
						end
					end
					else begin
						if (alarm12_state == 2) begin
							if (real_quarter) begin
								bch2 <= 1;
								bch3 <= alarm12_hours - 10;
							end
							else begin
								bch2 <= 10;
								bch3 <= 10;
							end
						end
						else begin
							bch2 <= 1;
							bch3 <= alarm12_hours - 10;
						end
					end
					
					
					// minute display
					if (alarm12_minutes >= 0 && alarm12_minutes < 10) begin
						if (alarm12_state == 3) begin
							if (real_quarter) begin
								bch4 <= 0;
								bch5 <= alarm12_minutes;
							end
							else begin
								bch4 <= 10;
								bch5 <= 10;
							end
						end
						else begin
							bch4 <= 0;
							bch5 <= alarm12_minutes;
						end
					end
					else if (alarm12_minutes >= 10 && alarm12_minutes < 20) begin
						if (alarm12_state == 3) begin
							if (real_quarter) begin
								bch4 <= 1;
								bch5 <= alarm12_minutes - 10;
							end
							else begin
								bch4 <= 10;
								bch5 <= 10;
							end
						end
						else begin
							bch4 <= 1;
							bch5 <= alarm12_minutes - 10;
						end
					end
					else if (alarm12_minutes >= 20 && alarm12_minutes < 30) begin
						if (alarm12_state == 3) begin
							if (real_quarter) begin
								bch4 <= 2;
								bch5 <= alarm12_minutes - 20;
							end
							else begin
								bch4 <= 10;
								bch5 <= 10;
							end
						end
						else begin
							bch4 <= 2;
							bch5 <= alarm12_minutes - 20;
						end
					end
					else if (alarm12_minutes >= 30 && alarm12_minutes < 40) begin
						if (alarm12_state == 3) begin
							if (real_quarter) begin
								bch4 <= 3;
								bch5 <= alarm12_minutes - 30;
							end
							else begin
								bch4 <= 10;
								bch5 <= 10;
							end
						end
						else begin
							bch4 <= 3;
							bch5 <= alarm12_minutes - 30;
						end
					end
					else if (alarm12_minutes >= 40 && alarm12_minutes < 50) begin
						if (alarm12_state == 3) begin
							if (real_quarter) begin
								bch4 <= 4;
								bch5 <= alarm12_minutes - 40;
							end
							else begin
								bch4 <= 10;
								bch5 <= 10;
							end
						end
						else begin
							bch4 <= 4;
							bch5 <= alarm12_minutes - 40;
						end
					end
					else begin
						if (alarm12_state == 3) begin
							if (real_quarter) begin
								bch4 <= 5;
								bch5 <= alarm12_minutes - 50;
							end
							else begin
								bch4 <= 10;
								bch5 <= 10;
							end
						end
						else begin
							bch4 <= 5;
							bch5 <= alarm12_minutes - 50;
						end
					end
				end
			end
		endcase
	end
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			dispMode <= 0;
		end
		else begin
			if (currentMode == 1) begin
				if (display) begin
					case (dispMode)
						0: begin
							if (alarm24_state == 0) begin
								dispMode <= 1;
							end
						end
						1: begin
							if (alarm12_state == 0) begin
								dispMode <= 0;
							end
						end
					endcase
				end
			end
		end
	end
	
endmodule
