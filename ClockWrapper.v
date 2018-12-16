`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:04:46 12/15/2018 
// Design Name: 
// Module Name:    ClockWrapper 
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
module ClockWrapper(
	input [1:0] currentMode,
	input real_quarter,
	input clk,
	input real_clk,
	input pulsed_set,
	input pulsed_up,
	input pulsed_down,
	input reset,
	input [4:0] alarm_hours,
	input [5:0] alarm_minutes,
	
	output reg [6:0] disp0,
	output reg [6:0] disp1,
	output reg [6:0] disp2,
	output reg [6:0] disp3,
	output reg [6:0] disp4,
	output reg [6:0] disp5

    );
	// 0 for 24 system, 1 for 12 system
	reg dispMode;
	reg alarmAlert;
	
	initial begin
		dispMode <= 0;
		alarmAlert <= 0;
	end
	
	wire [6:0] disp12_0;
	wire [6:0] disp12_1;
	wire [6:0] disp12_2;
	wire [6:0] disp12_3;
	wire [6:0] disp12_4;
	wire [6:0] disp12_5;
	wire [1:0] disp12_state;
	wire disp12to24_isPM;
	wire [3:0] disp12to24_hours;
	wire [5:0] disp12to24_minutes;
	wire disp12to24_propagate;
	
	wire [6:0] disp24_0;
	wire [6:0] disp24_1;
	wire [6:0] disp24_2;
	wire [6:0] disp24_3;
	wire [6:0] disp24_4;
	wire [6:0] disp24_5;
	wire [1:0] disp24_state;
	wire [4:0] disp24to12_hours;
	wire [5:0] disp24to12_minutes;
	wire disp24to12_propagate;
	wire [4:0] clock24_hours;
	wire [5:0] clock24_minutes;
	
	wire [6:0] dispalarm_0;
	wire [6:0] dispalarm_1;
	wire [6:0] dispalarm_2;
	wire [6:0] dispalarm_3;
	wire [6:0] dispalarm_4;
	wire [6:0] dispalarm_5;
	
	SimpleClock12 simpleclock12 (dispMode && (currentMode == 0), real_quarter, disp24to12_propagate, disp24to12_hours, disp24to12_minutes,
		clk, real_clk, pulsed_set, reset, pulsed_up, pulsed_down, 
		disp12_0, disp12_1, disp12_2, disp12_3, disp12_4, disp12_5, disp12_state,
		disp12to24_isPM, disp12to24_hours, disp12to24_minutes, disp12to24_propagate);
		
	SimpleClock24 simpleclock24 (!dispMode && (currentMode == 0), real_quarter, disp12to24_propagate, disp12to24_isPM, disp12to24_hours, disp12to24_minutes,
		clk, real_clk, pulsed_set, reset, pulsed_up, pulsed_down, 
		disp24_0, disp24_1, disp24_2, disp24_3, disp24_4, disp24_5, disp24_state,
		disp24to12_hours, disp24to12_minutes, disp24to12_propagate,
		clock24_hours, clock24_minutes);
	
	always @ (clock24_hours or clock24_minutes) begin
		if ((clock24_hours == alarm_hours) && 
		(clock24_minutes == alarm_minutes) && 
		(disp24_5 == 7'b1111110)) begin
			// alarm match!
			// match condition: current second must be 0 second and hour minute match
			alarmAlert <= 1;
		end
	end
	
	always @ (*) begin
		if (alarmAlert) begin
			if (dispMode) begin
				// 12 system
				if (real_quarter) begin
					// on
					disp0 <= disp12_0;
					disp1 <= disp12_1;
					disp2 <= disp12_2;
					disp3 <= disp12_3;
					disp4 <= disp12_4;
					disp5 <= disp12_5;
				end
				else begin
					// off
					disp0 <= 7'b0000000;
					disp1 <= 7'b0000000;
					disp2 <= 7'b0000000;
					disp3 <= 7'b0000000;
					disp4 <= 7'b0000000;
					disp5 <= 7'b0000000;
				end
			end
			else begin
				// 24 system
				if (real_quarter) begin
					disp0 <= disp24_0;
					disp1 <= disp24_1;
					disp2 <= disp24_2;
					disp3 <= disp24_3;
					disp4 <= disp24_4;
					disp5 <= disp24_5;
				end
				else begin
					// off
					disp0 <= 7'b0000000;
					disp1 <= 7'b0000000;
					disp2 <= 7'b0000000;
					disp3 <= 7'b0000000;
					disp4 <= 7'b0000000;
					disp5 <= 7'b0000000;
				end
			end
		end
		else begin
			// no alarm alert
			if (dispMode) begin
				// 12 system
				disp0 <= disp12_0;
				disp1 <= disp12_1;
				disp2 <= disp12_2;
				disp3 <= disp12_3;
				disp4 <= disp12_4;
				disp5 <= disp12_5;
			end
			else begin
				// 24 system
				disp0 <= disp24_0;
				disp1 <= disp24_1;
				disp2 <= disp24_2;
				disp3 <= disp24_3;
				disp4 <= disp24_4;
				disp5 <= disp24_5;
			end
		end
	end
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			dispMode <= 0;
		end
		else begin
			if (pulsed_down) begin
				if (alarmAlert) begin
					// turn off the alarm
					alarmAlert <= 0;
				end
			end
			else begin
			case (dispMode)
				0: begin
					// 24 system
					if (disp24_state == 0 && pulsed_up) begin
						// can change dispMode
						dispMode <= 1;
					end
				end
				1: begin
					// 12 system
					if (disp12_state == 0 && pulsed_up) begin
						dispMode <= 0;
					end
				end
			endcase
			end
		end
	end
endmodule
