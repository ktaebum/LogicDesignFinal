`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:05:06 12/15/2018
// Design Name:   Set12
// Module Name:   /csehome/ktaebum/Workspace/LogicDesignFinal/Set12Test.v
// Project Name:  Final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Set12
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Set12Test;

	// Inputs
	reg clk;
	reg set;
	reg up;
	reg down;

	// Outputs
	wire propagate;
	wire isPM;
	wire [3:0] hours;
	wire [5:0] minutes;

	// Instantiate the Unit Under Test (UUT)
	Set12 uut (
		.clk(clk), 
		.set(set), 
		.up(up), 
		.down(down), 
		.propagate(propagate), 
		.isPM(isPM), 
		.hours(hours), 
		.minutes(minutes)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		set = 0;
		up = 0;
		down = 0;
		
		#10;
		up = 1;
		#10;
		up = 0;
		
		
		#10;
		set = 1;
		#10;
		set = 0;
		
		
		#10;
		up = 1;
		#10;
		up = 0;
	end
	always begin
		#10; clk = 1;
		#10; clk = 0;
	end
      
endmodule

