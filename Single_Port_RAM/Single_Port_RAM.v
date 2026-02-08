`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2026 11:28:37 PM
// Design Name: 
// Module Name: Single_Port_RAM
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


module Single_Port_RAM(
    input clk,
    input we,
    input reset,
    input [5:0] addr, 
    input [7:0] din,
    input [7:0] dout
    );
    
    reg [7:0] mem [63:0];
    reg [7:0] temp;
    integer i = 0;
    
    always @(posedge clk) begin
        if(reset) begin
            for(i = 0; i < 64; i = i + 1) begin
                mem[i] <= 8'h00;
            end
            temp <= 8'h00;
        end
        
        else begin
            if(we == 1'b1) begin
            mem[addr] <= din;
            end
            else begin
                temp <= mem[addr];
            end
        end
    end
    
    assign dout = temp;
endmodule
