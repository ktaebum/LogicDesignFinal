`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:13:52 12/15/2018 
// Design Name: 
// Module Name:    SimpleClock12 
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
module SimpleClock12(
   input clk,
	input set,
	input reset,
	input up,
	input down,
	
	output reg [6:0] disp0,
	output reg [6:0] disp1,
	output reg [6:0] disp2,
	output reg [6:0] disp3,
	output reg [6:0] disp4,
	output reg [6:0] disp5
	
	// for debugging
	/*
	output w_propagate,
	output [4:0] w_in_hours,
	output [5:0] w_in_minutes,
	output [1:0] w_current_state,
	
	output [4:0] w_hours,
	output [5:0] w_minutes,
	output [5:0] w_seconds
	*/
    );
	// 24 system clock fpga board test
	
	wire slow_clk;
	wire real_clk;
	ClockModulator clockmodulator (clk, reset, slow_clk);
	RealClockModulator realclockmodulator (clk, reset, real_clk);
	
	wire debounced_up;
	wire pulsed_up;
	Debouncer debouncer1 (slow_clk, up, debounced_up);
	PulseGenerator pulsegenerator1 (clk, reset, debounced_up, pulsed_up);
	
	wire debounced_set;
	wire pulsed_set;
	Debouncer debouncer2 (slow_clk, set, debounced_set);
	PulseGenerator pulsegenerator2 (clk, reset, debounced_set, pulsed_set);
	
	wire debounced_down;
	wire pulsed_down;
	Debouncer debouncer3 (slow_clk, down, debounced_down);
	PulseGenerator pulsegenerator3 (clk, reset, debounced_down, pulsed_down);
	
	
	wire w_propagate;
	wire w_in_isPM;
	wire [4:0] w_in_hours;
	wire [5:0] w_in_minutes;
	wire [1:0] w_current_state;
	
	wire w_isPM;
	wire [4:0] w_hours;
	wire [5:0] w_minutes;
	
	wire [6:0] clock_disp0;
	wire [6:0] clock_disp1;
	wire [6:0] clock_disp2;
	wire [6:0] clock_disp3;
	wire [6:0] clock_disp4;
	wire [6:0] clock_disp5;
	
	wire [6:0] set_disp0;
	wire [6:0] set_disp1;
	wire [6:0] set_disp2;
	wire [6:0] set_disp3;
	wire [6:0] set_disp4;
	wire [6:0] set_disp5;
	
	
	Set12 set12 (clk, reset, pulsed_set, pulsed_up, pulsed_down, w_propagate, w_in_isPM, w_in_hours, w_in_minutes, w_current_state);
	Set12DispDecoder set12dispdecoder (w_in_isPM, w_in_hours, w_in_minutes, set_disp0, set_disp1, set_disp2, set_disp3, set_disp4, set_disp5);
	Clock12 clock12 (real_clk, reset, w_propagate, w_in_isPM, w_in_hours, w_in_minutes, w_isPM, w_hours, w_minutes);
	Clock12DispDecoder clock12dispdecoder (w_isPM, w_hours, w_minutes, clock_disp0, clock_disp1, clock_disp2, clock_disp3, clock_disp4, clock_disp5);
	
	
	// debug mode
	/*
	Set24 set24 (clk, reset, set, up, down, w_propagate, w_in_hours, w_in_minutes, w_current_state);
	Set24DispDecoder set24dispdecoder (w_in_hours, w_in_minutes, set_disp0, set_disp1, set_disp2, set_disp3, set_disp4, set_disp5);
	Clock24 clock24 (clk, reset, w_propagate, w_in_hours, w_in_minutes, w_hours, w_minutes, w_seconds);
	Clock24DispDecoder clock24dispdecoder (w_hours, w_minutes, w_seconds, clock_disp0, clock_disp1, clock_disp2, clock_disp3, clock_disp4, clock_disp5);
	*/
	always @ (*) begin
		if (w_current_state == 0) begin
			// display clock
			disp0 <= clock_disp0;
			disp1 <= clock_disp1;
			disp2 <= clock_disp2;
			disp3 <= clock_disp3;
			disp4 <= clock_disp4;
			disp5 <= clock_disp5;
		end
		else begin
			// display setter
			disp0 <= set_disp0;
			disp1 <= set_disp1;
			disp2 <= set_disp2;
			disp3 <= set_disp3;
			disp4 <= set_disp4;
			disp5 <= set_disp5;
		end
	end

endmodule
