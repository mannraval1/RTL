`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2026 01:09:06 AM
// Design Name: 
// Module Name: seq_detector_ol
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: This is the implementation of "111" Overlapping Sequence Detector.
// 
//////////////////////////////////////////////////////////////////////////////////


module seq_detector_ol(
    input clk,
    input reset,
    input din,
    output reg dout
    );
    
    parameter idle = 0;
    parameter s0 = 1;
    parameter s1 = 2;
    parameter s2 = 3;
    
    
    reg [1:0] state = idle;
    reg [1:0] nstate = idle;
    
    
    always@(posedge clk) begin
        case(state)
            idle : begin
                dout <= 1'b0;
                if(reset == 1'b1) begin
                    state <= idle;
                end else begin
                    state <= s0;
                end
            end
            
            s0: begin
                if(din == 1'b1) begin
                    state <= s1;
                    dout <= 1'b0;
                end else begin
                    state <= s0;
                    dout <= 1'b0;
                end
            end
            
            s1: begin
                if(din == 1'b1) begin
                    state <= s2;
                    dout <= 1'b0;
                end else begin
                    state <= s0;
                    dout <= 1'b0;
                end
            end
            
            s2: begin
                if(din == 1'b1) begin
                    state <= s2;
                    dout <= 1'b1;
                end else begin
                    state <= s0;
                    dout <= 1'b0;
                end
            end
            
        endcase
    end
    
endmodule
