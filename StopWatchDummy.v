`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:09:28 12/15/2018 
// Design Name: 
// Module Name:    StopWatchDummy 
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
module StopWatchDummy(
	input clk,
	input set,
	input clear,
	input reset,
	
	output [6:0] disp0,
	output [6:0] disp1,
	output [6:0] disp2,
	output [6:0] disp3,
	output [6:0] disp4,
	output [6:0] disp5
    );
	 
	wire slow_clk;
	wire mili_clock;
	ClockModulator clockmodulator (clk, reset, slow_clk);
	MiliClockModulator miliclockmodulator (clk, reset, mili_clock);
	
	wire debounced_set;
	wire pulsed_set;
	Debouncer debouncer1 (slow_clk, set, debounced_set);
	PulseGenerator pulsegenerator1 (mili_clock, reset, debounced_set, pulsed_set);
	
	
	wire debounced_clear;
	wire pulsed_clear;
	Debouncer debouncer2 (slow_clk, clear, debounced_clear);
	PulseGenerator pulsegenerator2 (mili_clock, reset, debounced_clear, pulsed_clear);
	
	wire [5:0] w_minutes;
	wire [5:0] w_seconds;
	wire [6:0] w_m_seconds;
	
	reg [3:0] m10;
	reg [3:0] m1;
	
	reg [3:0] s10;
	reg [3:0] s1;
	
	reg [3:0] ms10;
	reg [3:0] ms1;
	
	initial begin
		m10 <= 0;
		m1 <= 0;
		
		s10 <= 0;
		s1 <= 0;
		
		ms10 <= 0;
		ms1 <= 0;
	end	
	
	StopWatch stopwatch (mili_clock, pulsed_set, pulsed_clear, reset, w_minutes, w_seconds, w_m_seconds);
	
	Displayer displayer0 (m10, disp0);
	Displayer displayer1 (m1, disp1);
	Displayer displayer2 (s10, disp2);
	Displayer displayer3 (s1, disp3);
	Displayer displayer4 (ms10, disp4);
	Displayer displayer5 (ms1, disp5);
	
	always @ (*) begin
		if (w_minutes >= 0 && w_minutes < 10) begin
			m10 <= 10;
			m1 <= w_minutes;
		end
		else if (w_minutes >= 10 && w_minutes < 20) begin
			m10 <= 1;
			m1 <= w_minutes - 10;
		end
		else if (w_minutes >= 20 && w_minutes < 30) begin
			m10 <= 2;
			m1 <= w_minutes - 20;
		end
		else if (w_minutes >= 30 && w_minutes < 40) begin
			m10 <= 3;
			m1 <= w_minutes - 30;
		end
		else if (w_minutes >= 40 && w_minutes < 50) begin
			m10 <= 4;
			m1 <= w_minutes - 40;
		end
		else begin
			m10 <= 5;
			m1 <= w_minutes - 50;
		end
		
		if (w_seconds >= 0 && w_seconds < 10) begin
			s10 <= 10;
			s1 <= w_seconds;
		end
		else if (w_seconds >= 10 && w_seconds < 20) begin
			s10 <= 1;
			s1 <= w_seconds - 10;
		end
		else if (w_seconds >= 20 && w_seconds < 30) begin
			s10 <= 2;
			s1 <= w_seconds - 20;
		end
		else if (w_seconds >= 30 && w_seconds < 40) begin
			s10 <= 3;
			s1 <= w_seconds - 30;
		end
		else if (w_seconds >= 40 && w_seconds < 50) begin
			s10 <= 4;
			s1 <= w_seconds - 40;
		end
		else begin
			s10 <= 5;
			s1 <= w_seconds - 50;
		end
		
		if (w_m_seconds >= 0 && w_m_seconds < 10) begin
			ms10 <= 0;
			ms1 <= w_m_seconds;
		end
		else if (w_m_seconds >= 10 && w_m_seconds < 20) begin
			ms10 <= 1;
			ms1 <= w_m_seconds - 10;
		end
		else if (w_m_seconds >= 20 && w_m_seconds < 30) begin
			ms10 <= 2;
			ms1 <= w_m_seconds - 20;
		end
		else if (w_m_seconds >= 30 && w_m_seconds < 40) begin
			ms10 <= 3;
			ms1 <= w_m_seconds - 30;
		end
		else if (w_m_seconds >= 40 && w_m_seconds < 50) begin
			ms10 <= 4;
			ms1 <= w_m_seconds - 40;
		end
		else if (w_m_seconds >= 50 && w_m_seconds < 60) begin
			ms10 <= 5;
			ms1 <= w_m_seconds - 50;
		end
		else if (w_m_seconds >= 60 && w_m_seconds < 70) begin
			ms10 <= 6;
			ms1 <= w_m_seconds - 60;
		end
		else if (w_m_seconds >= 70 && w_m_seconds < 80) begin
			ms10 <= 7;
			ms1 <= w_m_seconds - 70;
		end
		else if (w_m_seconds >= 80 && w_m_seconds < 90) begin
			ms10 <= 8;
			ms1 <= w_m_seconds - 80;
		end
		else begin
			ms10 <= 9;
			ms1 <= w_m_seconds - 90;
		end
	end

endmodule
