----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2023 03:42:59 PM
-- Design Name: 
-- Module Name: bit_shift2_4_8 - Behavioral
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

entity bit_shift2_4_8 is
    Port ( clk : in std_logic;
           rst : in std_logic;
           i_data : in std_logic_vector(5 downto 0);
           o_data : out std_logic_vector(5 downto 0)
           );
end bit_shift2_4_8;

architecture rtl of bit_shift2_4_8 is

    --signal data_start : unsigned(5 downto 0);
begin
    process(clk) is
        variable data_shifted : std_logic_vector(5 downto 0);

        begin
        
        if rst = '0' then
            data_shifted := (others=>'0');

        
        elsif (rising_edge(clk)) then
            if rst = '1' then
                        data_shifted := i_data;
            
                        data_shifted := '0' & data_shifted(5 downto 1); 
                       o_data <= data_shifted;
                                        
            end if;
        end if;

    end process;
end rtl;
