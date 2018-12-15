`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:19 12/15/2018 
// Design Name: 
// Module Name:    SimpleClock 
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
module SimpleClock(
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

    );
	
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

endmodule
