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
	
	output reg [6:0] disp0,
	output reg [6:0] disp1,
	output reg [6:0] disp2,
	output reg [6:0] disp3,
	output reg [6:0] disp4,
	output reg [6:0] disp5
    );
	 
	 parameter N = 2'b00; // normal clock mode
	 parameter N12 = 1'b0; // normal clock 12 hours system
	 parameter N24 = 1'b1; // normal clock 24 hours system
	 parameter A = 2'b01; // alarm mode
	 parameter S = 2'b10; // stop watch mode
	 
	 reg [1:0] currentMode;
	 reg clockDisp; 
	 
	 initial begin
		currentMode <= N;
		clockDisp <= N24;
	 end
	 
	 
	 // for normal clock
	 wire w_isPM;
	 wire [4:0] w_hours;
	 wire [5:0] w_minutes;
	 wire [5:0] w_seconds;
	


	 always @ (posedge mode or posedge set or posedge op1 or posedge op2 or posedge reset) begin
		if (reset) begin
		
		end
		else begin
			if (mode) begin
			
			end
			else begin
				if (set) begin
				
				end
				else begin
					if (op1) begin
					
					end
					else begin
						if (op2) begin
						
						end
						else begin
						
						end
					end
				end
			end
		end
	 end

endmodule
