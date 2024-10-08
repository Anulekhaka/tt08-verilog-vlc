/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_vlc (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  //assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;
  assign uo_out [7:6]= 0;

  
    vlc vlc(
        .Turn_Left(ui_in[0]),
        .Turn_Right(ui_in[1]),
        .Emergency(ui_in[2]),
        .Left_Lamp(uo_out[2:0]),
        //.Left_Lamp[1],
        //.Left_Lamp[2],
        .Right_Lamp(uo_out[5:3]),
        //.Right_Lamp[1],
        //.Right_Lamp[2],
        .clk(clk),
        .rst_n(rst_n)
        
    );
endmodule
