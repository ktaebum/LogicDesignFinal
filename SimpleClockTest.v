`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:34:36 12/15/2018
// Design Name:   SimpleClock
// Module Name:   /csehome/ktaebum/Workspace/LogicDesignFinal/SimpleClockTest.v
// Project Name:  Final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SimpleClock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SimpleClockTest;

	// Inputs
	reg clk;
	reg set;
	reg reset;
	reg up;
	reg down;

	// Outputs
	wire [6:0] disp0;
	wire [6:0] disp1;
	wire [6:0] disp2;
	wire [6:0] disp3;
	wire [6:0] disp4;
	wire [6:0] disp5;
	
	// debuggings
	wire w_propagate;
	wire [4:0] w_in_hours;
	wire [5:0] w_in_minutes;
	wire [1:0] w_current_state;
	wire [4:0] w_hours;
	wire [5:0] w_minutes;
	wire [5:0] w_seconds;

	// Instantiate the Unit Under Test (UUT)
	SimpleClock uut (
		.clk(clk), 
		.set(set), 
		.reset(reset), 
		.up(up), 
		.down(down), 
		.disp0(disp0), 
		.disp1(disp1), 
		.disp2(disp2), 
		.disp3(disp3), 
		.disp4(disp4), 
		.disp5(disp5),
		.w_propagate(w_propagate),
		.w_in_hours(w_in_hours),
		.w_in_minutes(w_in_minutes),
		.w_current_state(w_current_state),
		.w_hours(w_hours),
		.w_minutes(w_minutes),
		.w_seconds(w_seconds)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		set = 0;
		reset = 0;
		up = 0;
		down = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		set = 1;
		#10;
		set = 0;
		#50;
		
		
		up = 1;
		#20;
		up = 0;
		#50;
		
		
		set = 1;
		#20;
		set = 0;
		#50;
		
		
		set = 1;
		#20;
		set = 0;
		#50;
		
		
		set = 1;
		#20;
		set = 0;
		#50;
		// Add stimulus here
		
		reset = 1;
		#50;
		reset = 0;

	end
	
	always begin
		#10 clk = 1;
		#10 clk = 0;
	end
      
endmodule

