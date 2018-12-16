`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:19:36 12/15/2018 
// Design Name: 
// Module Name:    TopModule 
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
module TopModule(
	input clk,
	input mode,
	input set,
	input op1,
	input op2,
	input reset,
	
	output reg [6:0] tdisp0,
	output reg [6:0] tdisp1,
	output reg [6:0] tdisp2,
	output reg [6:0] tdisp3,
	output reg [6:0] tdisp4,
	output reg [6:0] tdisp5
    );
	 
	parameter CLOCK = 2'b00;
	parameter ALARM = 2'b01;
	parameter STOPWATCH = 2'b10;
	
	reg [1:0] currentMode;
	
	initial begin
		currentMode <= CLOCK;
	end
	
	wire slow_clk;
	ClockModulator clockmodulator (clk, reset, slow_clk);
	
	// 100Hz clk
	wire mili_clk;
	MiliClockModulator miliclockmodulator (clk, reset, mili_clk);
	
	// 1Hz clk
	wire real_clk;
	// for blink enable
	wire real_quarter;
	RealClockModulator realclockmodulator (clk, reset, real_clk, real_quarter);
	
	wire debounced_mode;
	wire pulsed_mode;
	Debouncer debouncer1 (slow_clk, mode, debounced_mode);
	PulseGenerator pulsegenerator1 (clk, reset, debounced_mode, pulsed_mode);

	// for clock and alarm
	wire debounced_set_fast;
	wire pulsed_set_fast;
	Debouncer debouncer2 (slow_clk, set, debounced_set_fast);
	PulseGenerator pulsegenerator2 (clk, reset, debounced_set_fast, pulsed_set_fast);
	
	// for stop watch
	wire debounced_set_slow;
	wire pulsed_set_slow;
	Debouncer debouncer3 (slow_clk, set, debounced_set_slow);
	PulseGenerator pulsegenerator3 (mili_clk, reset, debounced_set_slow, pulsed_set_slow);
	
	// for fast op1 (up and disp)
	wire debounced_op1_fast;
	wire pulsed_op1_fast;
	Debouncer debouncer4 (slow_clk, op1, debounced_op1_fast);
	PulseGenerator pulsegenerator4 (clk, reset, debounced_op1_fast, pulsed_op1_fast);
	
	// for slow op1 (clear in stop watch)
	wire debounced_op1_slow;
	wire pulsed_op1_slow;
	Debouncer debouncer5 (slow_clk, op1, debounced_op1_slow);
	PulseGenerator pulsegenerator5 (mili_clk, reset, debounced_op1_slow, pulsed_op1_slow);
	
	// op1 (down and aoff)
	wire debounced_op2;
	wire pulsed_op2;
	Debouncer debouncer6 (slow_clk, op2, debounced_op2);
	PulseGenerator pulsegenerator6 (clk, reset, debounced_op2, pulsed_op2);
	
	// stop watch display output
	wire [6:0] stop_disp0;
	wire [6:0] stop_disp1;
	wire [6:0] stop_disp2;
	wire [6:0] stop_disp3;
	wire [6:0] stop_disp4;
	wire [6:0] stop_disp5;
	
	// stop watch display output
	wire [6:0] clock_disp0;
	wire [6:0] clock_disp1;
	wire [6:0] clock_disp2;
	wire [6:0] clock_disp3;
	wire [6:0] clock_disp4;
	wire [6:0] clock_disp5;
	
	StopWatchWrapper stopwatchwrapper (currentMode, mili_clk, pulsed_set_slow, pulsed_op1_slow, reset,
		stop_disp0, stop_disp1, stop_disp2, stop_disp3, stop_disp4, stop_disp5);
	ClockWrapper clockwrapper (currentMode, real_quarter, clk, real_clk, pulsed_set_fast, pulsed_op1_fast, pulsed_op2, reset,
		clock_disp0, clock_disp1, clock_disp2, clock_disp3, clock_disp4, clock_disp5);
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			currentMode <= CLOCK;
		end
		else begin
			if (pulsed_mode) begin
				case (currentMode)
					CLOCK: begin
						currentMode <= STOPWATCH;
					end
					STOPWATCH: begin
						currentMode <= CLOCK;
					end
				endcase
			end
		end
	end
	
	always @ (*) begin
		case (currentMode)
			CLOCK: begin
				tdisp0 <= clock_disp0;
				tdisp1 <= clock_disp1;
				tdisp2 <= clock_disp2;
				tdisp3 <= clock_disp3;
				tdisp4 <= clock_disp4;
				tdisp5 <= clock_disp5;
			end
			STOPWATCH: begin
				tdisp0 <= stop_disp0;
				tdisp1 <= stop_disp1;
				tdisp2 <= stop_disp2;
				tdisp3 <= stop_disp3;
				tdisp4 <= stop_disp4;
				tdisp5 <= stop_disp5;
			end
		endcase
	end

endmodule
