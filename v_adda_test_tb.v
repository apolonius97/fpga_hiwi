`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////


module v_adda_test_tb(

    );
reg clk;
reg rst;    
wire DAC_SPI_clk;
wire ADC_SPI_clk;
wire DAC_sync_n;
wire DAC_ldac_n;
wire [7 : 0] DAC_SPI;
wire [7 : 0] ADC_SPI;
wire ADC_cnv;
wire ADC_cs_n;
wire sample;
wire MHz60;
wire MHz30;
wire MHz25_6;
wire s00_axi_aclk;
wire s00_axi_aresetn;
wire [7 : 0] s00_axi_awaddr;
wire [2 : 0] s00_axi_awprot;
wire s00_axi_awvalid;
wire s00_axi_awready;
wire [31 : 0] s00_axi_wdata;
wire [3 : 0] s00_axi_wstrb;
wire s00_axi_wvalid;
wire s00_axi_wready;
wire [1 : 0] s00_axi_bresp;
wire s00_axi_bvalid;
wire s00_axi_bready;
wire [7 : 0] s00_axi_araddr;
wire [2 : 0] s00_axi_arprot;
wire s00_axi_arvalid;
wire s00_axi_arready;
wire [31 : 0] s00_axi_rdata;
wire [1 : 0] s00_axi_rresp;
wire s00_axi_rvalid;
wire s00_axi_rready;
wire m00_axis_aclk;
wire m00_axis_aresetn;
wire m00_axis_tvalid;
wire [31 : 0] m00_axis_tdata;
wire [3 : 0] m00_axis_tstrb;
wire m00_axis_tlast;
wire m00_axis_tready;

initial
begin
    clk = 1'b0;
    forever #5 clk = ~clk; //clock, what name to use? 
end

initial //generate reset
begin
    rst = 1'b0;
    #200 rst = 1'b1;
end

v_adda_test DUT(
      .DAC_SPI_clk(DAC_SPI_clk),
      .ADC_SPI_clk(ADC_SPI_clk),
      .DAC_sync_n(DAC_sync_n),
      .DAC_ldac_n(DAC_ldac_n),
      .DAC_SPI(DAC_SPI),
      .ADC_SPI(ADC_SPI),
      .ADC_cnv(ADC_cnv),
      .ADC_cs_n(ADC_cs_n),
      .sample(sample),
      .MHz60(MHz60),
      .MHz30(MHz30),
      .MHz25_6(MHz25_6),
      .s00_axi_aclk(s00_axi_aclk),
      .s00_axi_aresetn(s00_axi_aresetn),
      .s00_axi_awaddr(s00_axi_awaddr),
      .s00_axi_awprot(s00_axi_awprot),
      .s00_axi_awvalid(s00_axi_awvalid),
      .s00_axi_awready(s00_axi_awready),
      .s00_axi_wdata(s00_axi_wdata),
      .s00_axi_wstrb(s00_axi_wstrb),
      .s00_axi_wvalid(s00_axi_wvalid),
      .s00_axi_wready(s00_axi_wready),
      .s00_axi_bresp(s00_axi_bresp),
      .s00_axi_bvalid(s00_axi_bvalid),
      .s00_axi_bready(s00_axi_bready),
      .s00_axi_araddr(s00_axi_araddr),
      .s00_axi_arprot(s00_axi_arprot),
      .s00_axi_arvalid(s00_axi_arvalid),
      .s00_axi_arready(s00_axi_arready),
      .s00_axi_rdata(s00_axi_rdata),
      .s00_axi_rresp(s00_axi_rresp),
      .s00_axi_rvalid(s00_axi_rvalid),
      .s00_axi_rready(s00_axi_rready),
      .m00_axis_aclk(m00_axis_aclk),
      .m00_axis_aresetn(m00_axis_aresetn),
      .m00_axis_tvalid(m00_axis_tvalid),
      .m00_axis_tdata(m00_axis_tdata),
      .m00_axis_tstrb(m00_axis_tstrb),
      .m00_axis_tlast(m00_axis_tlast),
      .m00_axis_tready(m00_axis_tready)
);
endmodule
