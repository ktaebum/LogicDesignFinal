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
	input setEnable,
	input extern24_propagate,
	input [4:0] extern24_hours,
	input [5:0] extern24_minutes,
   input clk,
	input real_clk,
	input pulsed_set,
	input reset,
	input pulsed_up,
	input pulsed_down,
	
	// setter related
	output [1:0] w_current_state,
	output w_in_isPM,
	output [4:0] w_in_hours,
	output [5:0] w_in_minutes,
	output w_propagate,
	
	// clock related
	output w_isPM,
	output [3:0] w_hours,
	output [5:0] w_minutes
	);
	// 12 system clock fpga board test
	
	Set12 set12 (setEnable, clk, reset, pulsed_set, pulsed_up, pulsed_down, 
		w_propagate, w_in_isPM, w_in_hours, w_in_minutes, w_current_state);

	Clock12 clock12 (setEnable, real_clk, reset, w_propagate || extern24_propagate,
		extern24_hours, extern24_minutes,
		w_in_isPM, w_in_hours, w_in_minutes, w_isPM, w_hours, w_minutes);


endmodule
