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
	input optional,
	input reset,
	
	output [6:0] tdisp0,
	output [6:0] tdisp1,
	output [6:0] tdisp2,
	output [6:0] tdisp3,
	output [6:0] tdisp4,
	output [6:0] tdisp5
    );
	 
	parameter CLOCK = 2'b00;
	parameter ALARM = 2'b01;
	parameter STOPWATCH = 2'b10;
	
	parameter BRIGHT1 = 2'b00;
	parameter BRIGHT2 = 2'b01;
	parameter BRIGHT3 = 2'b10;
	
	reg [1:0] currentMode;
	reg [1:0] brightMode;
	reg brightness;
	
	reg isOnMux;
	reg [3:0] bch0;
	reg [3:0] bch1;
	reg [3:0] bch2;
	reg [3:0] bch3;
	reg [3:0] bch4;
	reg [3:0] bch5;
	
	initial begin
		currentMode <= CLOCK;
		isOnMux <= 1; // default on
		bch0 <= 0;
		bch1 <= 0;
		bch2 <= 0;
		bch3 <= 0;
		bch4 <= 0;
		bch5 <= 0;
		brightMode <= BRIGHT3;
		brightness <= 1;
	end
	
	wire slow_clk;
	ClockModulator clockmodulator (clk, reset, slow_clk);
	
	// 100Hz clk
	wire mili_clk;
	wire bright1;
	wire bright2;
	MiliClockModulator miliclockmodulator (clk, reset, mili_clk, bright1, bright2);
	
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
	
	wire debounced_optional;
	wire pulsed_optional;
	Debouncer debouncer7 (slow_clk, optional, debounced_optional);
	PulseGenerator pulsegenerator7 (clk, reset, debounced_optional, pulsed_optional);
	
	// for save lap time
	wire debounced_op2_slow;
	wire pulsed_op2_slow;
	Debouncer debouncer8 (slow_clk, op2, debounced_op2_slow);
	PulseGenerator pulsegenerator8 (mili_clk, reset, debounced_op2_slow, pulsed_op2_slow);
	
	// stop watch display output
	wire [3:0] stop_bch0;
	wire [3:0] stop_bch1;
	wire [3:0] stop_bch2;
	wire [3:0] stop_bch3;
	wire [3:0] stop_bch4;
	wire [3:0] stop_bch5;
	
	// stop watch display output
	wire [3:0] clock_bch0;
	wire [3:0] clock_bch1;
	wire [3:0] clock_bch2;
	wire [3:0] clock_bch3;
	wire [3:0] clock_bch4;
	wire [3:0] clock_bch5;
	wire alarmAlert;
	wire inDispState;
	
	
	// alarm display output
	wire [3:0] alarm_bch0;
	wire [3:0] alarm_bch1;
	wire [3:0] alarm_bch2;
	wire [3:0] alarm_bch3;
	wire [3:0] alarm_bch4;
	wire [3:0] alarm_bch5;
	
	wire [4:0] alarm_set_hours;
	wire [5:0] alarm_set_minutes;

	
	StopWatchWrapper stopwatchwrapper (currentMode, mili_clk, pulsed_set_slow, pulsed_op1_slow, reset,
		stop_bch0, stop_bch1, stop_bch2, stop_bch3, stop_bch4, stop_bch5);
	
	ClockWrapper clockwrapper (currentMode, real_quarter, clk, real_clk, pulsed_set_fast, pulsed_op1_fast, pulsed_op2, reset,
		alarm_set_hours, alarm_set_minutes,
		alarmAlert, clock_bch0, clock_bch1, clock_bch2, clock_bch3, clock_bch4, clock_bch5, inDispState);
	
	BlinkDisplayer blink_disp0 (brightness && isOnMux, bch0, tdisp0);
	BlinkDisplayer blink_disp1 (brightness && isOnMux, bch1, tdisp1);
	BlinkDisplayer blink_disp2 (brightness && isOnMux, bch2, tdisp2);
	BlinkDisplayer blink_disp3 (brightness && isOnMux, bch3, tdisp3);
	BlinkDisplayer blink_disp4 (brightness && isOnMux, bch4, tdisp4);
	BlinkDisplayer blink_disp5 (brightness && isOnMux, bch5, tdisp5);

	AlarmWrapper alarmwrapper (currentMode, real_quarter, clk, pulsed_set_fast, pulsed_op1_fast, pulsed_op2, reset,
		alarm_set_hours, alarm_set_minutes, alarm_bch0, alarm_bch1, alarm_bch2, alarm_bch3, alarm_bch4, alarm_bch5);
	
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			currentMode <= CLOCK;
		end
		else begin
			if (pulsed_mode) begin
				case (currentMode)
					CLOCK: begin
						currentMode <= ALARM;
					end
					ALARM: begin
						currentMode <= STOPWATCH;
					end
					STOPWATCH: begin
						currentMode <= CLOCK;
					end
				endcase
			end
			else begin
				if (pulsed_optional) begin
					case(brightMode)
						BRIGHT1: brightMode <= BRIGHT2;
						BRIGHT2: brightMode <= BRIGHT3;
						BRIGHT3: brightMode <= BRIGHT1;
					endcase
				end
			end
		end
	end
	
	always @ (*) begin
		case (brightMode)
			BRIGHT1: begin
				brightness <= bright1;
			end
			BRIGHT2: begin
				brightness <= bright2;
			end
			BRIGHT3: begin
				brightness <= mili_clk;
			end
		endcase
	
		case (currentMode)
			CLOCK: begin
				if (inDispState) begin
					isOnMux <= !alarmAlert || (alarmAlert && real_quarter);
				end
				else begin
					isOnMux <= 1;
				end
				bch0 <= clock_bch0;
				bch1 <= clock_bch1;
				bch2 <= clock_bch2;
				bch3 <= clock_bch3;
				bch4 <= clock_bch4;
				bch5 <= clock_bch5;
			end
			STOPWATCH: begin
				isOnMux <= 1;
				bch0 <= stop_bch0;
				bch1 <= stop_bch1;
				bch2 <= stop_bch2;
				bch3 <= stop_bch3;
				bch4 <= stop_bch4;
				bch5 <= stop_bch5;
			end
			ALARM: begin
				isOnMux <= 1;
				bch0 <= alarm_bch0;
				bch1 <= alarm_bch1;
				bch2 <= alarm_bch2;
				bch3 <= alarm_bch3;
				bch4 <= alarm_bch4;
				bch5 <= alarm_bch5;
			end	
		endcase
	end

endmodule
