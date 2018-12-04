`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:02:49 12/03/2018 
// Design Name: 
// Module Name:    ClockSystem 
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
module ClockSystem(
	input clk,
	input mode,
	input set,
	input op1,
	input op2,
	input reset,
	
	output [6:0] disp0,
	output [6:0] disp1,
	output [6:0] disp2,
	output [6:0] disp3,
	output [6:0] disp4,
	output [6:0] disp5
    );
	 
	 reg [1:0] currentMode;
	 
	 
	 // for normal clock
	 wire w_isPM;
	 wire [4:0] w_hours;
	 wire [5:0] w_minutes;
	 wire [5:0] w_seconds;
	 
	 NormalClock normalclock (clk, reset, w_isPM, w_seconds, w_minutes, w_hours);
	 


endmodule
