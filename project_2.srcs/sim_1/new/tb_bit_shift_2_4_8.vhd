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

entity tb_bit_shift_2_4_8 is
--  Port ( );
end tb_bit_shift_2_4_8;

architecture test of tb_bit_shift_2_4_8 is
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal i_data : std_logic_vector(5 downto 0) := (others => '0');
    signal o_data : std_logic_vector(5 downto 0) := (others => '0');

begin
    clk <= not clk after 5ns;
      rst <= '0', '1' after 5 ns;
    dut: entity work.bit_shift2_4_8(rtl)
        port map(
            clk => clk,
            rst => rst,
            i_data => i_data,
            o_data => o_data
        );
    
    stimulus:
    process begin
        
        i_data <= "111111";
        wait for 60ns;
        i_data <= "011010";
    wait for 60ns;
    end process stimulus;


end test;
