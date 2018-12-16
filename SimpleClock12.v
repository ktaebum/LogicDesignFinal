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
	input real_quarter,
	input extern24_propagate,
	input [4:0] extern24_hours,
	input [5:0] extern24_minutes,
   input clk,
	input real_clk,
	input pulsed_set,
	input reset,
	input pulsed_up,
	input pulsed_down,
	
	output reg [6:0] disp0,
	output reg [6:0] disp1,
	output reg [6:0] disp2,
	output reg [6:0] disp3,
	output reg [6:0] disp4,
	output reg [6:0] disp5,
	output [1:0] w_current_state,
	output w_in_isPM,
	output [4:0] w_in_hours,
	output [5:0] w_in_minutes,
	output w_propagate
    );
	// 12 system clock fpga board test
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
	
	
	Set12 set12 (setEnable, clk, reset, pulsed_set, pulsed_up, pulsed_down, 
		w_propagate, w_in_isPM, w_in_hours, w_in_minutes, w_current_state);
	
	Set12DispDecoder set12dispdecoder (w_current_state, real_quarter, w_in_isPM, w_in_hours, w_in_minutes, 
		set_disp0, set_disp1, set_disp2, set_disp3, set_disp4, set_disp5);
	
	Clock12 clock12 (setEnable, real_clk, reset, w_propagate || extern24_propagate,
		extern24_hours, extern24_minutes,
		w_in_isPM, w_in_hours, w_in_minutes, w_isPM, w_hours, w_minutes);
	
	Clock12DispDecoder clock12dispdecoder (w_isPM, w_hours, w_minutes, 
		clock_disp0, clock_disp1, clock_disp2, clock_disp3, clock_disp4, clock_disp5);
	
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
