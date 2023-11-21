----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2023 05:19:25 PM
-- Design Name: 
-- Module Name: tb_bit_shift_2_4_8 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.numeric_std.unsigned;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_bit_shift_multiply is
--  Port ( );
end tb_bit_shift_multiply;

architecture test of tb_bit_shift_multiply is
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal i_data : unsigned(22 downto 0) := (others => '0');
    signal o_data : unsigned(4 downto 0) := (others => '0');

begin
    clk <= not clk after 5ns;
      rst <= '0', '1' after 100 ns;
    dut: entity work.bit_shift_multiply(rtl)
        port map(
            clk => clk,
            rst => rst,
            i_data => i_data,
            o_data => o_data
        );
    
    stimulus:
    process begin
       
      wait until (rst = '1');
      i_data <= "00000000000001110000001";
      wait for 50ns;
                
      --wait for 30ns;
        i_data <= "00000000000000001111000";

    wait for 30ns;

    end process stimulus;


end test;
