`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:49:37 12/15/2018 
// Design Name: 
// Module Name:    StopWatchWrapper 
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
module StopWatchWrapper(
	input [1:0] currentMode,
	input mili_clk,
	input mili_set,
	input mili_clear,
	input reset,
	
	output reg [3:0] bch0,
	output reg [3:0] bch1,
	output reg [3:0] bch2,
	output reg [3:0] bch3,
	output reg [3:0] bch4,
	output reg [3:0] bch5
	);
	 
	wire [5:0] w_minutes;
	wire [5:0] w_seconds;
	wire [6:0] w_m_seconds;
	
	StopWatch stopwatch (currentMode, mili_clk, mili_set, mili_clear, reset, w_minutes, w_seconds, w_m_seconds);

	always @ (*) begin
		if (w_minutes == 0) begin
			bch0 <= 10;
			bch1 <= 10;
		end
		else if (w_minutes > 0 && w_minutes < 10) begin
			bch0 <= 10;
			bch1 <= w_minutes;
		end
		else if (w_minutes >= 10 && w_minutes < 20) begin
			bch0 <= 1;
			bch1 <= w_minutes - 10;
		end
		else if (w_minutes >= 20 && w_minutes < 30) begin
			bch0 <= 2;
			bch1 <= w_minutes - 20;
		end
		else if (w_minutes >= 30 && w_minutes < 40) begin
			bch0 <= 3;
			bch1 <= w_minutes - 30;
		end
		else if (w_minutes >= 40 && w_minutes < 50) begin
			bch0 <= 4;
			bch1 <= w_minutes - 40;
		end
		else begin
			bch0 <= 5;
			bch1 <= w_minutes - 50;
		end
		
		if (w_seconds >= 0 && w_seconds < 10) begin
			bch2 <= 10;
			bch3 <= w_seconds;
		end
		else if (w_seconds >= 10 && w_seconds < 20) begin
			bch2 <= 1;
			bch3 <= w_seconds - 10;
		end
		else if (w_seconds >= 20 && w_seconds < 30) begin
			bch2 <= 2;
			bch3 <= w_seconds - 20;
		end
		else if (w_seconds >= 30 && w_seconds < 40) begin
			bch2 <= 3;
			bch3 <= w_seconds - 30;
		end
		else if (w_seconds >= 40 && w_seconds < 50) begin
			bch2 <= 4;
			bch3 <= w_seconds - 40;
		end
		else begin
			bch2 <= 5;
			bch3 <= w_seconds - 50;
		end
		
		if (w_m_seconds >= 0 && w_m_seconds < 10) begin
			bch4 <= 0;
			bch5 <= w_m_seconds;
		end
		else if (w_m_seconds >= 10 && w_m_seconds < 20) begin
			bch4 <= 1;
			bch5 <= w_m_seconds - 10;
		end
		else if (w_m_seconds >= 20 && w_m_seconds < 30) begin
			bch4 <= 2;
			bch5 <= w_m_seconds - 20;
		end
		else if (w_m_seconds >= 30 && w_m_seconds < 40) begin
			bch4 <= 3;
			bch5 <= w_m_seconds - 30;
		end
		else if (w_m_seconds >= 40 && w_m_seconds < 50) begin
			bch4 <= 4;
			bch5 <= w_m_seconds - 40;
		end
		else if (w_m_seconds >= 50 && w_m_seconds < 60) begin
			bch4 <= 5;
			bch5 <= w_m_seconds - 50;
		end
		else if (w_m_seconds >= 60 && w_m_seconds < 70) begin
			bch4 <= 6;
			bch5 <= w_m_seconds - 60;
		end
		else if (w_m_seconds >= 70 && w_m_seconds < 80) begin
			bch4 <= 7;
			bch5 <= w_m_seconds - 70;
		end
		else if (w_m_seconds >= 80 && w_m_seconds < 90) begin
			bch4 <= 8;
			bch5 <= w_m_seconds - 80;
		end
		else begin
			bch4 <= 9;
			bch5 <= w_m_seconds - 90;
		end
	end

endmodule
