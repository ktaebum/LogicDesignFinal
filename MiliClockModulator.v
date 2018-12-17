`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:12:24 12/15/2018 
// Design Name: 
// Module Name:    MiliClockModulator 
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
module MiliClockModulator(
	input clk,
	input reset,
	output reg usr_clk,
	output reg bright1,
	output reg bright2
    );
	 
	 reg [17:0] counter;
	 
	 initial begin
		counter <= 0;
		usr_clk <= 0;
		bright1 <= 0;
	 end
	 
	 always @ (posedge clk) begin
		if (reset) begin
			counter <= 0;
			usr_clk <= 0;
		end
		else begin
			counter <= counter + 1;
			if (bright1 == 1) begin
				// brightness clock on
				if (counter == 70000) begin
					bright1 <= 0;
				end
			end
			else begin
				if (counter == 250000) begin
					bright1 <= 1;
				end
			end
			
			if (bright2 == 1) begin
				if (counter == 30000) begin
					bright2 <= 0;
				end
			end
			else begin
				if (counter == 250000) begin
					bright2 <= 1;
				end
			end
			
			if (counter == 250000) begin
				counter <= 0;
				usr_clk <= usr_clk +1;
			end
		end
	 end
endmodule
