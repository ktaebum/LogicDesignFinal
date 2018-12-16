`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:00:53 12/16/2018 
// Design Name: 
// Module Name:    DisplayerMux 
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
module DisplayerMux(
	input [1:0] control,
	
	input [6:0] clock_disp0,
	input [6:0] clock_disp1,
	input [6:0] clock_disp2,
	input [6:0] clock_disp3,
	input [6:0] clock_disp4,
	input [6:0] clock_disp5,
   
	input [6:0] stop_disp0,
	input [6:0] stop_disp1,
	input [6:0] stop_disp2,
	input [6:0] stop_disp3,
	input [6:0] stop_disp4,
	input [6:0] stop_disp5,
	
	output reg [6:0] final_disp0,
	output reg [6:0] final_disp1,
	output reg [6:0] final_disp2,
	output reg [6:0] final_disp3,
	output reg [6:0] final_disp4,
	output reg [6:0] final_disp5
	);
	
	always @ (*) begin
		case (control)
			0: begin
				// clock disp
				final_disp0 <= clock_disp0;
				final_disp1 <= clock_disp1;
				final_disp2 <= clock_disp2;
				final_disp3 <= clock_disp3;
				final_disp4 <= clock_disp4;
				final_disp5 <= clock_disp5;
			end
			1: begin
				// alarm disp
			end
			2: begin
				// stop watch disp
				final_disp0 <= stop_disp0;
				final_disp1 <= stop_disp1;
				final_disp2 <= stop_disp2;
				final_disp3 <= stop_disp3;
				final_disp4 <= stop_disp4;
				final_disp5 <= stop_disp5;
			end
		endcase
	end


endmodule
