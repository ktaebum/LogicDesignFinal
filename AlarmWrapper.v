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
	output reg [6:0] dispAlarm0,
	output reg [6:0] dispAlarm1,
	output reg [6:0] dispAlarm2,
	output reg [6:0] dispAlarm3,
	output reg [6:0] dispAlarm4,
	output reg [6:0] dispAlarm5
    );
	 
	reg dispMode;
	
	reg [3:0] h10;
	reg [3:0] h1;
	
	reg [3:0] m10;
	reg [3:0] m1;
	
	reg [3:0] s10;
	reg [3:0] s1;
	
	initial begin
		// 0 for 24 system, 1 for 12 system
		dispMode <= 0;
		
		h10 <= 11;
		h1 <= 11;
		
		m10 <= 11;
		m1 <= 11;
		
		s10 <= 11;
		s1 <= 11;
	end
	 
	wire alarm12_propagate;
	wire alarm12_isPM;
	wire [3:0] alarm12_hours;
	wire [5:0] alarm12_minutes;
	wire [1:0] alarm12_state;
	wire [6:0] set12_disp0;
	wire [6:0] set12_disp1;
	wire [6:0] set12_disp2;
	wire [6:0] set12_disp3;
	wire [6:0] set12_disp4;
	wire [6:0] set12_disp5;
	
	wire alarm24_propagate;
	wire [4:0] alarm24_hours;
	wire [5:0] alarm24_minutes;
	wire [1:0] alarm24_state;
	wire [6:0] set24_disp0;
	wire [6:0] set24_disp1;
	wire [6:0] set24_disp2;
	wire [6:0] set24_disp3;
	wire [6:0] set24_disp4;
	wire [6:0] set24_disp5;
	
	// alarm set value
	wire [6:0] set_disp0;
	wire [6:0] set_disp1;
	wire [6:0] set_disp2;
	wire [6:0] set_disp3;
	wire [6:0] set_disp4;
	wire [6:0] set_disp5;
	
	
	Set12 alarm12set (dispMode && (currentMode == 1), clk, reset, set, display, clear, 
		alarm12_propagate, alarm12_isPM, alarm12_hours, alarm12_minutes, alarm12_state);
		
	Set12DispDecoder alarm12setdispdecoder (alarm12_state, real_quarter, alarm12_isPM, alarm12_hours, alarm12_minutes, 
		set12_disp0, set12_disp1, set12_disp2, set12_disp3, set12_disp4, set12_disp5);	
		
	Set24 alarm24set (!dispMode && (currentMode == 1), clk, reset, set, display, clear, 
		alarm24_propagate, alarm24_hours, alarm24_minutes, alarm24_state);
		
	Set24DispDecoder alarm24setdispdecoder (alarm24_state, real_quarter, alarm24_hours, alarm24_minutes, 
		set24_disp0, set24_disp1, set24_disp2, set24_disp3, set24_disp4, set24_disp5);
		
	AlarmSetter alarmsetter (clk, reset || clear, dispMode, alarm12_propagate || alarm24_propagate, 
		alarm12_isPM, alarm12_hours, alarm12_minutes,
		alarm24_hours, alarm24_minutes, alarm_hours, alarm_minutes);
	
	/*
	assign dispAlarm0 = set24_disp0;
	assign dispAlarm1 = set24_disp1;
	assign dispAlarm2 = set24_disp2;
	assign dispAlarm3 = set24_disp3;
	assign dispAlarm4 = set24_disp4;
	assign dispAlarm5 = set24_disp5;
	*/
	
	Displayer a_displayer0 (h10, set_disp0);
	Displayer a_displayer1 (h1, set_disp1);
	Displayer a_displayer2 (m10, set_disp2);
	Displayer a_displayer3 (m1, set_disp3);
	Displayer a_displayer4 (s10, set_disp4);
	Displayer a_displayer5 (s1, set_disp5);
	
	always @ (*) begin
		// get bit
		if (alarm_hours == 24) begin
			// no alarm
			h10 <= 11;
			h1 <= 11;
			m10 <= 11;
			m1 <= 11;
			s10 <= 11;
			s1 <= 11;
		end
		else begin
		case (dispMode)
			0: begin
				// 24 system
				if (alarm_hours >= 0 && alarm_hours < 10) begin
					h10 <= 0;
					h1 <= alarm_hours;
				end
				else if (alarm_hours >= 10 && alarm_hours < 20) begin
					h10 <= 1;
					h1 <= alarm_hours - 10;
				end
				else begin
					h10 <= 2;
					h1 <= alarm_hours - 20;
				end
				
				if (alarm_minutes >= 0 && alarm_minutes < 10) begin
					m10 <= 0;
					m1 <= alarm_minutes;
				end
				else if (alarm_minutes >= 10 && alarm_minutes < 20) begin
					m10 <= 1;
					m1 <= alarm_minutes - 10;
				end
				else if (alarm_minutes >= 20 && alarm_minutes < 30) begin
					m10 <= 2;
					m1 <= alarm_minutes - 20;
				end
				else if (alarm_minutes >= 30 && alarm_minutes < 40) begin
					m10 <= 3;
					m1 <= alarm_minutes - 30;
				end
				else if (alarm_minutes >= 40 && alarm_minutes < 50) begin
					m10 <= 4;
					m1 <= alarm_minutes - 40;
				end
				else begin
					m10 <= 5;
					m1 <= alarm_minutes - 50;
				end
				s10 <= 0;
				s1 <= 0;
			end
			1: begin
				h1 <= 10;
				if (alarm_hours >= 12) begin
					// PM
					h10 <= 13;
					if (alarm_hours == 12) begin
						m10 <= 1;
						m1 <= 2;
					end
					else begin
						m10 <= 0;
						m1 <= alarm_hours - 12;
					end
				end
				else begin
					// AM
					h10 <= 12;
					if (alarm_hours == 0) begin
						m10 <= 1;
						m1 <= 2;
					end
					else begin
						m10 <= 0;
						m1 <= alarm_hours;
					end
				end
				// minute split
				if (alarm_minutes >= 0 && alarm_minutes < 10) begin
					s10 <= 0;
					s1 <= alarm_minutes;
				end
				else if (alarm_minutes >= 10 && alarm_minutes < 20) begin
					s10 <= 1;
					s1 <= alarm_minutes - 10;
				end
				else if (alarm_minutes >= 20 && alarm_minutes < 30) begin
					s10 <= 2;
					s1 <= alarm_minutes - 20;
				end
				else if (alarm_minutes >= 30 && alarm_minutes < 40) begin
					s10 <= 3;
					s1 <= alarm_minutes - 30;
				end
				else if (alarm_minutes >= 40 && alarm_minutes < 50) begin
					s10 <= 4;
					s1 <= alarm_minutes - 40;
				end
				else begin
					s10 <= 5;
					s1 <= alarm_minutes - 50;
				end
			end
		endcase
		end
		
		case (dispMode)
			0: begin
				if (alarm24_state == 0) begin
					dispAlarm0 <= set_disp0;
					dispAlarm1 <= set_disp1;
					dispAlarm2 <= set_disp2;
					dispAlarm3 <= set_disp3;
					dispAlarm4 <= set_disp4;
					dispAlarm5 <= set_disp5;
				end
				else begin
					dispAlarm0 <= set24_disp0;
					dispAlarm1 <= set24_disp1;
					dispAlarm2 <= set24_disp2;
					dispAlarm3 <= set24_disp3;
					dispAlarm4 <= set24_disp4;
					dispAlarm5 <= set24_disp5;
				end
			end
			1: begin
				if (alarm12_state == 0) begin
					dispAlarm0 <= set_disp0;
					dispAlarm1 <= set_disp1;
					dispAlarm2 <= set_disp2;
					dispAlarm3 <= set_disp3;
					dispAlarm4 <= set_disp4;
					dispAlarm5 <= set_disp5;
				end
				else begin
					dispAlarm0 <= set12_disp0;
					dispAlarm1 <= set12_disp1;
					dispAlarm2 <= set12_disp2;
					dispAlarm3 <= set12_disp3;
					dispAlarm4 <= set12_disp4;
					dispAlarm5 <= set12_disp5;
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
