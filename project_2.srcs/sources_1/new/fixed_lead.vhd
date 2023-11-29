----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/29/2023 08:24:19 PM
-- Design Name: 
-- Module Name: fixed_lead - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fixed_lead is
    Port ( clk : in std_logic;
           rst : in std_logic;
           i_data : in signed(23 downto 0);
           o_data : out integer;
            o_data_frac : out unsigned(18 downto 0);
            o_data_total : out ufixed(5 downto -18)
           );
end fixed_lead;

architecture Behavioral of fixed_lead is

begin
    process(clk) is
            --generate variables for checking the sign
            variable i_data_signed : signed(23 downto 0);
            variable i_data_unsigned : unsigned(22 downto 0);
            --generate variables to calculate the lead value
            variable l2 : integer; -- given in the python_simulations
            variable l2_u : ufixed(4 downto 0);
            variable x : unsigned(47 downto 0); -- the input value which will be multiplied over and over
            variable x_multiplied : unsigned(47 downto 0); --the result of multiplication with 2 (x bit shifted
            variable x_shifted: unsigned(47 downto 0);
            variable x_zero : unsigned(47 downto 0) := (others=>'0');
            
        begin
            if rising_edge(clk) then
                if rst = '0' then
                    x_multiplied := (others => '0');
                    x := (others => '0');
                    x_shifted := (others => '0');
                    i_data_signed := (others => '0');
                    i_data_unsigned := (others => '0');
                    l2_u := (others => '0');
                    o_data_total <= (others => '0');
                    
                else
                
                --convert the signed to unsigned incase the input is negative
                    if i_data(23) = '1' then
                        i_data_signed := i_data;
                        i_data_unsigned := unsigned(not i_data_signed(22 downto 0) + 1);
                    else
                        i_data_unsigned := unsigned(i_data(22 downto 0));
                    end if;
                --end of the convertion                    
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
                                l2_u := to_ufixed(l2, 5);                             
                                o_data <= l2;
                                o_data_total(5 downto 1) <= l2_u;
                                
                         end if;
                        
                       
                    end if;                                        
                end if;
            end if;

    end process;


end Behavioral;
