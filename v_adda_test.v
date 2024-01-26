`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Antonina Pozniak
// Create Date: 01/25/2024 12:28:13 AM
//////////////////////////////////////////////////////////////////////////////////


module v_adda_test(

output wire DAC_SPI_clk,
output wire ADC_SPI_clk,
output wire DAC_sync_n,
output wire DAC_ldac_n,
output wire [7 : 0] DAC_SPI,
input wire [7 : 0] ADC_SPI,
output wire ADC_cnv,
output wire ADC_cs_n,
output wire sample,
input wire MHz60,
input wire MHz30,
input wire MHz25_6,
input wire s00_axi_aclk,
input wire s00_axi_aresetn,
input wire [7 : 0] s00_axi_awaddr,
input wire [2 : 0] s00_axi_awprot,
input wire s00_axi_awvalid,
output wire s00_axi_awready,
input wire [31 : 0] s00_axi_wdata,
input wire [3 : 0] s00_axi_wstrb,
input wire s00_axi_wvalid,
output wire s00_axi_wready,
output wire [1 : 0] s00_axi_bresp,
output wire s00_axi_bvalid,
input wire s00_axi_bready,
input wire [7 : 0] s00_axi_araddr,
input wire [2 : 0] s00_axi_arprot,
input wire s00_axi_arvalid,
output wire s00_axi_arready,
output wire [31 : 0] s00_axi_rdata,
output wire [1 : 0] s00_axi_rresp,
output wire s00_axi_rvalid,
input wire s00_axi_rready,
input wire m00_axis_aclk,
input wire m00_axis_aresetn,
output wire m00_axis_tvalid,
output wire [31 : 0] m00_axis_tdata,
output wire [3 : 0] m00_axis_tstrb,
output wire m00_axis_tlast,
input wire m00_axis_tready
);

    
ADDA_control_vhdl_0 adda_inst (
  .DAC_SPI_clk(DAC_SPI_clk),            // output wire DAC_SPI_clk
  .ADC_SPI_clk(ADC_SPI_clk),            // output wire ADC_SPI_clk
  .DAC_sync_n(DAC_sync_n),              // output wire DAC_sync_n
  .DAC_ldac_n(DAC_ldac_n),              // output wire DAC_ldac_n
  .DAC_SPI(DAC_SPI),                    // output wire [7 : 0] DAC_SPI
  .ADC_SPI(ADC_SPI),                    // input wire [7 : 0] ADC_SPI
  .ADC_cnv(ADC_cnv),                    // output wire ADC_cnv
  .ADC_cs_n(ADC_cs_n),                  // output wire ADC_cs_n
  .sample(sample),                      // output wire sample
  .MHz60(MHz60),                        // input wire MHz60
  .MHz30(MHz30),                        // input wire MHz30
  .MHz25_6(MHz25_6),                    // input wire MHz25_6
  .s00_axi_aclk(s00_axi_aclk),          // input wire s00_axi_aclk
  .s00_axi_aresetn(s00_axi_aresetn),    // input wire s00_axi_aresetn
  .s00_axi_awaddr(s00_axi_awaddr),      // input wire [7 : 0] s00_axi_awaddr
  .s00_axi_awprot(s00_axi_awprot),      // input wire [2 : 0] s00_axi_awprot
  .s00_axi_awvalid(s00_axi_awvalid),    // input wire s00_axi_awvalid
  .s00_axi_awready(s00_axi_awready),    // output wire s00_axi_awready
  .s00_axi_wdata(s00_axi_wdata),        // input wire [31 : 0] s00_axi_wdata
  .s00_axi_wstrb(s00_axi_wstrb),        // input wire [3 : 0] s00_axi_wstrb
  .s00_axi_wvalid(s00_axi_wvalid),      // input wire s00_axi_wvalid
  .s00_axi_wready(s00_axi_wready),      // output wire s00_axi_wready
  .s00_axi_bresp(s00_axi_bresp),        // output wire [1 : 0] s00_axi_bresp
  .s00_axi_bvalid(s00_axi_bvalid),      // output wire s00_axi_bvalid
  .s00_axi_bready(s00_axi_bready),      // input wire s00_axi_bready
  .s00_axi_araddr(s00_axi_araddr),      // input wire [7 : 0] s00_axi_araddr
  .s00_axi_arprot(s00_axi_arprot),      // input wire [2 : 0] s00_axi_arprot
  .s00_axi_arvalid(s00_axi_arvalid),    // input wire s00_axi_arvalid
  .s00_axi_arready(s00_axi_arready),    // output wire s00_axi_arready
  .s00_axi_rdata(s00_axi_rdata),        // output wire [31 : 0] s00_axi_rdata
  .s00_axi_rresp(s00_axi_rresp),        // output wire [1 : 0] s00_axi_rresp
  .s00_axi_rvalid(s00_axi_rvalid),      // output wire s00_axi_rvalid
  .s00_axi_rready(s00_axi_rready),      // input wire s00_axi_rready
  .m00_axis_aclk(m00_axis_aclk),        // input wire m00_axis_aclk
  .m00_axis_aresetn(m00_axis_aresetn),  // input wire m00_axis_aresetn
  .m00_axis_tvalid(m00_axis_tvalid),    // output wire m00_axis_tvalid
  .m00_axis_tdata(m00_axis_tdata),      // output wire [31 : 0] m00_axis_tdata
  .m00_axis_tstrb(m00_axis_tstrb),      // output wire [3 : 0] m00_axis_tstrb
  .m00_axis_tlast(m00_axis_tlast),      // output wire m00_axis_tlast
  .m00_axis_tready(m00_axis_tready)    // input wire m00_axis_tready
);    
endmodule
