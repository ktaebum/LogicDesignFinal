`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:26:53 12/15/2018
// Design Name:   Clock24DispDecoder
// Module Name:   /csehome/ktaebum/Workspace/LogicDesignFinal/Clock24DispDecoderTest.v
// Project Name:  Final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Clock24DispDecoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Clock24DispDecoderTest;

	// Inputs
	reg [4:0] hours;
	reg [5:0] minutes;
	reg [5:0] seconds;

	// Outputs
	wire [6:0] disp0;
	wire [6:0] disp1;
	wire [6:0] disp2;
	wire [6:0] disp3;
	wire [6:0] disp4;
	wire [6:0] disp5;

	// Instantiate the Unit Under Test (UUT)
	Clock24DispDecoder uut (
		.hours(hours), 
		.minutes(minutes), 
		.seconds(seconds), 
		.disp0(disp0), 
		.disp1(disp1), 
		.disp2(disp2), 
		.disp3(disp3), 
		.disp4(disp4), 
		.disp5(disp5)
	);

	initial begin
		// Initialize Inputs
		hours = 0;
		minutes = 0;
		seconds = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		hours = 20;
		minutes = 30;
        
		// Add stimulus here

	end
      
endmodule

