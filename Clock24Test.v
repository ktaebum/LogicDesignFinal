`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:29:28 12/15/2018
// Design Name:   Clock24
// Module Name:   /csehome/ktaebum/Workspace/LogicDesignFinal/Clock24Test.v
// Project Name:  Final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Clock24
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Clock24Test;

	// Inputs
	reg clk;
	reg reset;
	reg propagate;
	reg [4:0] in_hours;
	reg [5:0] in_minutes;

	// Outputs
	wire [4:0] hours;
	wire [5:0] minutes;
	wire [5:0] seconds;

	// Instantiate the Unit Under Test (UUT)
	Clock24 uut (
		.clk(clk), 
		.reset(reset), 
		.propagate(propagate), 
		.in_hours(in_hours), 
		.in_minutes(in_minutes), 
		.hours(hours), 
		.minutes(minutes), 
		.seconds(seconds)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		propagate = 0;
		in_hours = 4;
		in_minutes = 30;
		
		#200;
		
		propagate = 1;
		#10;
		propagate = 0;
		

	end
	
	always begin
		#0.0005; clk = 1;
		#0.0005; clk = 0;
	end
      
endmodule

