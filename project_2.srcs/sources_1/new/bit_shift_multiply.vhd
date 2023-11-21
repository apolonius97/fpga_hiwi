----------------------------------------------------------------------------------
-- Company: KIT
-- Engineer: Antonina Pozniak
-- 
-- Create Date: 11/18/2023 03:42:59 PM
-- Design Name: Calculate leading bit
-- Module Name: bit_shift2_4_8 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Program that calculates the leading term for a log2(input_number)
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

entity bit_shift_multiply is
    Port ( clk : in std_logic;
           rst : in std_logic;
           i_data : in unsigned(22 downto 0);
           o_data : out unsigned(4 downto 0)
           );
end bit_shift_multiply;

architecture rtl of bit_shift_multiply is
    signal x_test : unsigned(45 downto 0);
begin
    process(clk) is
        variable l2 : unsigned(4 downto 0) := "10110"; -- given in the python_simulations
        variable x : unsigned(45 downto 0); -- the input value which will be multiplied over and over
        variable x_multiplied : unsigned(45 downto 0); --the result of multiplication with 2 (x bit shifted
        variable x_shifted: unsigned(45 downto 0);
        variable x_zero : unsigned(45 downto 0) := (others=>'0');
    begin
        
        if rising_edge(clk) then
            if rst = '0' then 
                x_multiplied := (others => '0');
                x := (others => '0');
                x_shifted := (others => '0');
                x_test <= (others=>'0');
                o_data <= (others =>'0');
        
        
        else
                x := (45 downto i_data'length => '0') & i_data;
                x_test <= x;

            --          
                      if x = 0 then  
                        ---while placeholder---
               while x_shifted = x_zero loop
                     x := x(44 downto 0) & '0';
                     l2 := l2 - 1;
                     x_shifted := shift_right(unsigned(x), 22);
               end loop;
                        ---end while placeholder---
 
                       o_data <= l2;
                     
            end if;
             end if;

       end if;
    end process;
end rtl;
