`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:45:36 12/04/2018
// Design Name:   StopWatch
// Module Name:   /home/taebum/Workspace/Final/StopWatchTest.v
// Project Name:  Final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: StopWatch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module StopWatchTest;

	// Inputs
	reg m_clk;
	reg set;
	reg clear;

	// Outputs
	wire [5:0] minutes;
	wire [5:0] seconds;
	wire [6:0] m_seconds;

	// Instantiate the Unit Under Test (UUT)
	StopWatch uut (
		.m_clk(m_clk), 
		.set(set), 
		.clear(clear), 
		.minutes(minutes), 
		.seconds(seconds), 
		.m_seconds(m_seconds)
	);

	initial begin
		// Initialize Inputs
		m_clk = 0;
		set = 0;
		clear = 0;
		
		#100;
		set = 1;
		#1;
		set = 0;
		
		#25;
		clear = 1;
		#20;
		clear = 0;
		
		#100;
		set = 1;
		#1;
		set = 0;
	end
	
	always begin
		#0.0005; m_clk = 1;
		#0.0005; m_clk = 0;
	end
      
endmodule

