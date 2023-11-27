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

entity signed_lead_count_log2 is
    Port ( clk : in std_logic;
           rst : in std_logic;
           i_data : in signed(23 downto 0);
           o_data : out integer
           );
end signed_lead_count_log2;

architecture rtl of signed_lead_count_log2 is
    signal x_test : unsigned(47 downto 0);
    signal l2_test : integer;
   
begin
    process(clk) is
        variable i_data_signed : signed(23 downto 0);
        variable i_data_unsigned : unsigned(22 downto 0);
        variable l2 : integer; -- given in the python_simulations
        variable x : unsigned(47 downto 0); -- the input value which will be multiplied over and over
        variable x_multiplied : unsigned(47 downto 0); --the result of multiplication with 2 (x bit shifted
        variable x_shifted: unsigned(47 downto 0);
        variable x_zero : unsigned(47 downto 0) := (others=>'0');
        variable x_m_fraction : unsigned
    begin
        
        if rising_edge(clk) then
            if rst = '0' then -- initialize everything as '0'
                x_multiplied := (others => '0');
                x := (others => '0');
                x_shifted := (others => '0');
                x_test <= (others=>'0');
                i_data_signed := (others => '0');
                i_data_unsigned := (others => '0');

        
            else
            
                if i_data(23) = '1' then
                    i_data_signed := i_data;
                    i_data_unsigned := unsigned(not i_data_signed(22 downto 0) + 1);
                else
                    i_data_unsigned := unsigned(i_data(22 downto 0));
                end if;
                    
--------------------------------------------------------------------------------------------------------------------------------------------                    
                --the leading bit part of the program--
                -----------------------------------------------------------------------------
                    
                x := (47 downto i_data_unsigned'length => '0') & i_data_unsigned;         --load x with the input and pad with '0's
                x_test <= x;                                             -- just for checking

                    if x > 0 then                                       --if input is greater than '0'
                       x_shifted := shift_right(unsigned(x), 23); 
                              -- shift the input by 23 to the right
                        if x_shifted = x_zero then
                             
                         -- loop for calculating l2                                       
                            for i in 22 downto 0 loop                            
                                 x := x(46 downto 0) & '0';             --shift to the left/multiply by 2
                                 l2 := i;
                                 x_shifted := shift_right(unsigned(x), 23);
                                 
                                    if x_shifted > x_zero then                                        
                                        exit;
                                    end if;
                                    
                             end loop;
                            -- end loop                              
                                o_data <= l2;
                         end if;
                        
                        
                       
                    end if;
-------------------------------------------------------------------------------------------------------------
                        --END OF LEAD----------------------------------------------------
                     
            end if;

       end if;
       
    end process;
end rtl;
