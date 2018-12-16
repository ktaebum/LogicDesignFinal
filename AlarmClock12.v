`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:26:33 12/16/2018 
// Design Name: 
// Module Name:    AlarmClock12 
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
module AlarmClock12(
   input setEnabled,
	input clk,
	input set,
	input up,
	input down,
	input reset,
	
	input propagate,
	input [4:0] extern_hours,
	input [5:0] extern_minutes,
	input in_PM,
	input [3:0] in_hours,
	input [5:0] in_minutes,
	
	output reg isPM,
	output reg [4:0] hours,
	output reg [5:0] minutes
    );
	 
	parameter NOALARM = 5'b11000; // 24 hour as no alarm state

	initial begin
		isPM <= 0;
		hours <= NOALARM;
		minutes <= 0;
	end
	
endmodule
