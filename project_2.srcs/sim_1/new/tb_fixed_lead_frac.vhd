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
use ieee.fixed_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_fixed_lead_frac is
--  Port ( );
end tb_fixed_lead_frac;

architecture test of tb_fixed_lead_frac is
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal i_data : signed(23 downto 0) := (others => '0');
    signal o_data : integer;
    signal o_data_total : ufixed(4 downto -19);
    signal o_data_test : ufixed(4 downto 0);
    signal o_data_frac_test : ufixed(-1 downto -19);



begin
    clk <= not clk after 5ns;
      rst <= '0', '1' after 100 ns;
    dut: entity work.fixed_lead_frac(rtl)
        port map(
            clk => clk,
            rst => rst,
            i_data => i_data,
            o_data => o_data,
            o_data_total => o_data_total,
            o_data_test => o_data_test,
            o_data_frac_test => o_data_frac_test
        );
    
    stimulus:
    process begin
       
      wait until (rst = '1');

     --i_data <= "111111111111111110001000";
     -- wait for 30ns;
    --  i_data <= "100000000000000000000000";
    --  wait for 30ns;
        i_data <= "000000000000000001111000";

    wait for 30ns;

     --wait for 30ns;
     --   i_data <= "000011110000000001111000";

  --wait for 30ns;
--       i_data <= "001000000000000001111000";



  --    wait for 30ns;
  --    i_data <= "000011110000000001111000";
  --     wait for 30ns;
  --   i_data <= "011000000000000001111000";

 -- wait for 30ns;
    end process stimulus;


end test;
