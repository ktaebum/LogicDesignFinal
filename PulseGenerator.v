`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:50:45 12/15/2018 
// Design Name: 
// Module Name:    PulseGenerator 
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
module PulseGenerator(
	input clk,
	input reset,
	input input_signal,
	output output_signal
    );
	 
	 parameter s00 = 2'd0;
	 parameter s11 = 2'd1;
	 parameter s01 = 2'd2;
	 
	 reg [1:0] state;
	 reg [1:0] next;
	 
	 initial begin
		state <= s00;
	 end
	 
	 assign output_signal = (state == s01) ? 1 : 0;
	 
	 always @ (posedge clk) begin
		if (reset) begin
			state <= s00;
		end
		else begin
			state <= next;
		end
	 end
	 
	 always @ (*) begin
		case (state)
			s00: begin
				if (input_signal == 1) next <= s01;
				else next <= s00;
			end
			s11: begin
				if (input_signal == 1) next <= s11;
				else next <= s00;
			end
			s01: begin
				if (input_signal == 1) next <= s11;
				else next <= s00;
			end
			default: next <= s00;
		endcase
	 end
endmodule
