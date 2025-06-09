`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mann Raval
// 
// Design Name: D - Flip Flop
// Module Name: dff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dff(
    input clk,
    input din,
    output reg q,
    output reg qbar
    );
    
    always@(posedge clk) begin
        q <= din;
        qbar <= ~din;
    end
endmodule
