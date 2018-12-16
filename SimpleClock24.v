`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:46:49 12/15/2018 
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
module SimpleClock24(
	input setEnable,
	input extern12_propagate,
	input extern12_isPM,
	input [3:0] extern12_hours,
	input [5:0] extern12_minutes,
	input clk,
	input real_clk,
	input pulsed_set,
	input reset,
	input pulsed_up,
	input pulsed_down,
	
	output [1:0] w_current_state,
	output [4:0] w_in_hours,
	output [5:0] w_in_minutes,
	output w_propagate,
	output [4:0] w_hours,
	output [5:0] w_minutes,
	output [5:0] w_seconds
    );
	// 24 system clock fpga board test

	
	Set24 set24 (setEnable, clk, reset, pulsed_set, pulsed_up, pulsed_down,
		w_propagate, w_in_hours, w_in_minutes, w_current_state);
		
	Clock24 clock24 (setEnable, real_clk, reset, w_propagate || extern12_propagate, 
		extern12_isPM, extern12_hours, extern12_minutes, 
		w_in_hours, w_in_minutes, w_hours, w_minutes, w_seconds);
		

endmodule
