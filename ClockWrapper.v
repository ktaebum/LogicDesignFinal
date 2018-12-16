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
	
	output reg alarmAlert,
	output reg [3:0] bch0,
	output reg [3:0] bch1,
	output reg [3:0] bch2,
	output reg [3:0] bch3,
	output reg [3:0] bch4,
	output reg [3:0] bch5
    );
	// 0 for 24 system, 1 for 12 system
	reg dispMode;
	
	initial begin
		dispMode <= 0;
		alarmAlert <= 0;
		bch0 <= 0;
		bch1 <= 0;
		bch2 <= 0;
		bch3 <= 0;
		bch4 <= 0;
		bch5 <= 0;
	end
	
	wire [1:0] disp12_state;
	wire disp12to24_isPM;
	wire [3:0] disp12to24_hours;
	wire [5:0] disp12to24_minutes;
	wire disp12to24_propagate;
	wire clock12_isPM;
	wire [3:0] clock12_hours;
	wire [5:0] clock12_minutes;
	
	wire [1:0] disp24_state;
	wire [4:0] disp24to12_hours;
	wire [5:0] disp24to12_minutes;
	wire disp24to12_propagate;
	wire [4:0] clock24_hours;
	wire [5:0] clock24_minutes;
	wire [5:0] clock24_seconds;
	
	SimpleClock12 simpleclock12 (dispMode && (currentMode == 0), disp24to12_propagate, disp24to12_hours, disp24to12_minutes,
		clk, real_clk, pulsed_set, reset, pulsed_up, pulsed_down,
		disp12_state, disp12to24_isPM, disp12to24_hours, disp12to24_minutes, disp12to24_propagate,
		clock12_isPM, clock12_hours, clock12_minutes);
	
	SimpleClock24 simpleclock24 (!dispMode && (currentMode == 0), disp12to24_propagate, disp12to24_isPM, disp12to24_hours, disp12to24_minutes,
		clk, real_clk, pulsed_set, reset, pulsed_up, pulsed_down, 
		disp24_state, disp24to12_hours, disp24to12_minutes, disp24to12_propagate,
		clock24_hours, clock24_minutes, clock24_seconds);
	
	always @ (*) begin
		case (dispMode)
			0: begin
				// 24 system
				if (disp24_state == 0) begin
					// normal clock display
					if (clock24_hours >= 0 && clock24_hours < 10) begin
						bch0 <= 0;
						bch1 <= clock24_hours;
					end
					else if (clock24_hours >= 10 && clock24_hours < 20) begin
						bch0 <= 1;
						bch1 <= clock24_hours - 10;
					end
					else begin
						bch0 <= 2;
						bch1 <= clock24_hours - 20;
					end
					
					if (clock24_minutes >= 0 && clock24_minutes < 10) begin
						bch2 <= 0;
						bch3 <= clock24_minutes;
					end
					else if (clock24_minutes >= 10 && clock24_minutes < 20) begin
						bch2 <= 1;
						bch3 <= clock24_minutes - 10;
					end
					else if (clock24_minutes >= 20 && clock24_minutes < 30) begin
						bch2 <= 2;
						bch3 <= clock24_minutes - 20;
					end
					else if (clock24_minutes >= 30 && clock24_minutes < 40) begin
						bch2 <= 3;
						bch3 <= clock24_minutes - 30;
					end
					else if (clock24_minutes >= 40 && clock24_minutes < 50) begin
						bch2 <= 4;
						bch3 <= clock24_minutes - 40;
					end
					else begin
						bch2 <= 5;
						bch3 <= clock24_minutes - 50;
					end
					
					if (clock24_seconds >= 0 && clock24_seconds < 10) begin
						bch4 <= 0;
						bch5 <= clock24_seconds;
					end
					else if (clock24_seconds >= 10 && clock24_seconds < 20) begin
						bch4 <= 1;
						bch5 <= clock24_seconds - 10;
					end
					else if (clock24_seconds >= 20 && clock24_seconds < 30) begin
						bch4 <= 2;
						bch5 <= clock24_seconds - 20;
					end
					else if (clock24_seconds >= 30 && clock24_seconds < 40) begin
						bch4 <= 3;
						bch5 <= clock24_seconds - 30;
					end
					else if (clock24_seconds >= 40 && clock24_seconds < 50) begin
						bch4 <= 4;
						bch5 <= clock24_seconds - 40;
					end
					else begin
						bch4 <= 5;
						bch5 <= clock24_seconds - 50;
					end
				end
				else begin
					// setter display
					bch4 <= 0;
					bch5 <= 0;
					if (disp24to12_hours >= 0 && disp24to12_hours < 10) begin
						if (disp24_state == 1) begin
							// setting hour, blink!
							if (real_quarter) begin
								bch0 <= 0;
								bch1 <= disp24to12_hours;
							end
							else begin
								bch0 <= 10;
								bch1 <= 10;
							end
						end
						else begin
							// setting minute
							bch0 <= 0;
							bch1 <= disp24to12_hours;
						end
					end
					else if (disp24to12_hours >= 10 && disp24to12_hours < 20) begin
						if (disp24_state == 1) begin
							if (real_quarter) begin
								bch0 <= 1;
								bch1 <= disp24to12_hours - 10;
							end
							else begin
								bch0 <= 10;
								bch1 <= 10;
							end
						end
						else begin
							bch0 <= 1;
							bch1 <= disp24to12_hours - 10;
						end
					end
					else begin
						if (disp24_state == 1) begin
							if (real_quarter) begin
								bch0 <= 2;
								bch1 <= disp24to12_hours - 20;
							end
							else begin
								bch0 <= 10;
								bch1 <= 10;
							end
						end
						else begin
							bch0 <= 2;
							bch1 <= disp24to12_hours - 20;
						end
					end
					
					if (disp24to12_minutes >= 0 && disp24to12_minutes < 10) begin
						if (disp24_state == 2) begin
							if (real_quarter) begin
								bch2 <= 0;
								bch3 <= disp24to12_minutes;
							end
							else begin
								bch2 <= 10;
								bch3 <= 10;
							end
						end
						else begin
							bch2 <= 0;
							bch3 <= disp24to12_minutes;
						end
					end
					else if (disp24to12_minutes >= 10 && disp24to12_minutes < 20) begin
						if (disp24_state == 2) begin
							if (real_quarter) begin
								bch2 <= 1;
								bch3 <= disp24to12_minutes - 10;
							end
							else begin
								bch2 <= 10;
								bch3 <= 10;
							end
						end
						else begin
							bch2 <= 1;
							bch3 <= disp24to12_minutes - 10;
						end
					end
					else if (disp24to12_minutes >= 20 && disp24to12_minutes < 30) begin
						if (disp24_state == 2) begin
							if (real_quarter) begin
								bch2 <= 2;
								bch3 <= disp24to12_minutes - 20;
							end
							else begin
								bch2 <= 10;
								bch3 <= 10;
							end
						end
						else begin
							bch2 <= 2;
							bch3 <= disp24to12_minutes - 20;
						end
					end
					else if (disp24to12_minutes >= 30 && disp24to12_minutes < 40) begin
						if (disp24_state == 2) begin
							if (real_quarter) begin
								bch2 <= 3;
								bch3 <= disp24to12_minutes - 30;
							end
							else begin
								bch2 <= 10;
								bch3 <= 10;
							end
						end
						else begin
							bch2 <= 3;
							bch3 <= disp24to12_minutes - 30;
						end
					end
					else if (disp24to12_minutes >= 40 && disp24to12_minutes < 50) begin
						if (disp24_state == 2) begin
							if (real_quarter) begin
								bch2 <= 4;
								bch3 <= disp24to12_minutes - 40;
							end
							else begin
								bch2 <= 10;
								bch3 <= 10;
							end
						end
						else begin
							bch2 <= 4;
							bch3 <= disp24to12_minutes - 40;
						end
					end
					else begin
						if (disp24_state == 2) begin
							if (real_quarter) begin
								bch2 <= 5;
								bch3 <= disp24to12_minutes - 50;
							end
							else begin
								bch2 <= 10;
								bch3 <= 10;
							end
						end
						else begin
							bch2 <= 5;
							bch3 <= disp24to12_minutes - 50;
						end
					end
					
				end
			end
			1: begin
				// 12 system
				bch1 <= 10;
				if (disp12_state == 0) begin
					if (clock12_isPM) begin
						bch0 <= 13; 
					end
					else begin
						bch0 <= 12;
					end
					
					if (clock12_hours >= 0 && clock12_hours < 10) begin
						bch2 <= 0;
						bch3 <= clock12_hours;
					end
					else begin
						bch2 <= 1;
						bch3 <= clock12_hours - 10;
					end
					
					if (clock12_minutes >= 0 && clock12_minutes < 10) begin
						bch4 <= 0;
						bch5 <= clock12_minutes;
					end
					else if (clock12_minutes >= 10 && clock12_minutes < 20) begin
						bch4 <= 1;
						bch5 <= clock12_minutes - 10;
					end
					else if (clock12_minutes >= 20 && clock12_minutes < 30) begin
						bch4 <= 2;
						bch5 <= clock12_minutes - 20;
					end
					else if (clock12_minutes >= 30 && clock12_minutes < 40) begin
						bch4 <= 3;
						bch5 <= clock12_minutes - 30;
					end
					else if (clock12_minutes >= 40 && clock12_minutes < 50) begin
						bch4 <= 4;
						bch5 <= clock12_minutes - 40;
					end
					else begin
						bch4 <= 5;
						bch5 <= clock12_minutes - 50;
					end
				end
				else begin
					// setter display
					if (disp12to24_isPM == 1) begin
						// PM Set
						if (disp12_state == 1) begin
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
						if (disp12_state == 1) begin
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
					
					if (disp12to24_hours >= 0 && disp12to24_hours < 10) begin
						if (disp12_state == 2) begin
							// setting hour, blink!
							if (real_quarter) begin
								bch2 <= 0;
								bch3 <= disp12to24_hours;
							end
							else begin
								bch2 <= 10;
								bch3 <= 10;
							end
						end
						else begin
							// setting minute
							bch2 <= 0;
							bch3 <= disp12to24_hours;
						end
					end
					else begin
						if (disp12_state == 2) begin
							if (real_quarter) begin
								bch2 <= 1;
								bch3 <= disp12to24_hours - 10;
							end
							else begin
								bch2 <= 10;
								bch3 <= 10;
							end
						end
						else begin
							bch2 <= 1;
							bch3 <= disp12to24_hours - 10;
						end
					end
					
					
					// minute display
					if (disp12to24_minutes >= 0 && disp12to24_minutes < 10) begin
						if (disp12_state == 3) begin
							if (real_quarter) begin
								bch4 <= 0;
								bch5 <= disp12to24_minutes;
							end
							else begin
								bch4 <= 10;
								bch5 <= 10;
							end
						end
						else begin
							bch4 <= 0;
							bch5 <= disp12to24_minutes;
						end
					end
					else if (disp12to24_minutes >= 10 && disp12to24_minutes < 20) begin
						if (disp12_state == 3) begin
							if (real_quarter) begin
								bch4 <= 1;
								bch5 <= disp12to24_minutes - 10;
							end
							else begin
								bch4 <= 10;
								bch5 <= 10;
							end
						end
						else begin
							bch4 <= 1;
							bch5 <= disp12to24_minutes - 10;
						end
					end
					else if (disp12to24_minutes >= 20 && disp12to24_minutes < 30) begin
						if (disp12_state == 3) begin
							if (real_quarter) begin
								bch4 <= 2;
								bch5 <= disp12to24_minutes - 20;
							end
							else begin
								bch4 <= 10;
								bch5 <= 10;
							end
						end
						else begin
							bch4 <= 2;
							bch5 <= disp12to24_minutes - 20;
						end
					end
					else if (disp12to24_minutes >= 30 && disp12to24_minutes < 40) begin
						if (disp12_state == 3) begin
							if (real_quarter) begin
								bch4 <= 3;
								bch5 <= disp12to24_minutes - 30;
							end
							else begin
								bch4 <= 10;
								bch5 <= 10;
							end
						end
						else begin
							bch4 <= 3;
							bch5 <= disp12to24_minutes - 30;
						end
					end
					else if (disp12to24_minutes >= 40 && disp12to24_minutes < 50) begin
						if (disp12_state == 3) begin
							if (real_quarter) begin
								bch4 <= 4;
								bch5 <= disp12to24_minutes - 40;
							end
							else begin
								bch4 <= 10;
								bch5 <= 10;
							end
						end
						else begin
							bch4 <= 4;
							bch5 <= disp12to24_minutes - 40;
						end
					end
					else begin
						if (disp12_state == 3) begin
							if (real_quarter) begin
								bch4 <= 5;
								bch5 <= disp12to24_minutes - 50;
							end
							else begin
								bch4 <= 10;
								bch5 <= 10;
							end
						end
						else begin
							bch4 <= 5;
							bch5 <= disp12to24_minutes - 50;
						end
					end
					
					
				end
			end
		endcase
	end
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			dispMode <= 0;
			alarmAlert <= 0;
		end
		else begin
			if ((clock24_hours == alarm_hours) && 
				(clock24_minutes == alarm_minutes) && 
				!alarmAlert && 
				(clock24_seconds == 0)) begin
					// alarm match!
					// match condition: current second must be 0 second and hour minute match
					alarmAlert <= 1;
			end
			else begin
			if (currentMode == 0) begin
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
		end
	end
endmodule
