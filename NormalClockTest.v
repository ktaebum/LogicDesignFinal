`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:05:46 12/04/2018
// Design Name:   NormalClock
// Module Name:   /home/taebum/Workspace/Final/NormalClockTest.v
// Project Name:  Final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: NormalClock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module NormalClockTest;

	// Inputs
	reg clk;
	reg set;
	reg op1;
	reg op2;
	reg reset;

	// Outputs
	wire isPM;
	wire [5:0] seconds;
	wire [5:0] minutes;
	wire [4:0] hours;

	// Instantiate the Unit Under Test (UUT)
	NormalClock uut (
		.clk(clk), 
		.set(set), 
		.op1(op1), 
		.op2(op2), 
		.reset(reset), 
		.isPM(isPM), 
		.seconds(seconds), 
		.minutes(minutes), 
		.hours(hours)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#10;
		
		reset = 0;
	end
	
	always begin
		#0.0005; clk = 1;
		#0.0005; clk = 0;
	end
      
endmodule

