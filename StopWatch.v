`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:26:35 12/04/2018 
// Design Name: 
// Module Name:    StopWatch 
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
module StopWatch(
	input [1:0] currentMode,
	input m_clk,
	input set,
	input clear,
	input reset, 
	output reg [5:0] minutes,
	output reg [5:0] seconds,
	output reg [6:0] m_seconds
    );
	
	reg isStop;
	
	initial begin
		isStop <= 1;
		minutes <= 0;
		seconds <= 0;
		m_seconds <= 0;
	end
	
	always @ (posedge m_clk or posedge reset) begin
		if (reset) begin
			isStop <= 1;
			minutes <= 0;
			seconds <= 0;
			m_seconds <= 0;
		end
		else begin
			if (currentMode == 2) begin
			if (set) begin
				isStop <= isStop + 1;
			end
			else if (isStop) begin
				if (clear) begin
					minutes <= 0;
					seconds <= 0;
					m_seconds <= 0;
					isStop <= 1;
				end
			end
			else begin
				if (m_seconds < 99) begin
					m_seconds <= m_seconds + 1;
				end
				else begin
					// stop counting case
					if ((minutes != 59) || (seconds != 59)) begin
						m_seconds <= 0;
						if (seconds < 59) begin
							seconds <= seconds + 1;
						end
						else begin
							if (minutes != 59) begin
								seconds <= 0;
								minutes <= minutes + 1;
							end
						end
					end
					else begin
						isStop <= isStop + 1;
					end
				end
			end
			end
		end
	end

endmodule
