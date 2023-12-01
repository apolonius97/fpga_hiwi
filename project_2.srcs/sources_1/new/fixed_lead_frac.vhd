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
use ieee.fixed_pkg.all;
use ieee.math_real.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fixed_lead_frac is
    Port ( clk : in std_logic;
           rst : in std_logic;
           i_data : in signed(23 downto 0);
           o_data : out integer;
            --o_data_frac : out unsigned(18 downto 0);
            o_data_total : out ufixed(4 downto -19);
            o_data_test : out ufixed(4 downto 0);
            o_data_frac_test : out ufixed(-1 downto -19)

           );
end fixed_lead_frac;

architecture rtl of fixed_lead_frac is
    signal x_test : unsigned(22 downto 0);
    signal l2_test : ufixed(4 downto 0) := (others=> '0');

    signal x_final_test : unsigned(23 downto 0);
    signal x_read_test : unsigned(22 downto 0);
   signal y_test : unsigned(72 downto 0) := (others => '0');
   signal y_multiplied_sig: unsigned(45 downto 0) := (others => '0');
   signal y_shifted2_sig : unsigned(1 downto 0) := (others => '0');
      signal y_shifted1_sig : unsigned(23 downto 0) := (others => '0');
              signal frac_sig : ufixed(0 downto -19) := (others => '0');
        signal frac_shifted_sig : ufixed(-1 downto -19) := (others => '0');
        signal frac_sum_sig : ufixed(-1 downto -19) := (others => '0');
        signal y_start_sig : unsigned(22 downto 0) := (others => '0');


begin


                        
    process(clk) is
    --general variables
        variable i_data_signed : signed(23 downto 0);
        variable i_data_unsigned : unsigned(22 downto 0);
    --end general variables
    --lead variables
        variable l2 : integer; -- given in the python_simulations
        variable x : unsigned(45 downto 0); -- the input value which will be multiplied over and over
        variable x_multiplied : unsigned(45 downto 0); --the result of multiplication with 2 (x bit shifted
        variable x_shifted: unsigned(45 downto 0);
        variable x_zero : unsigned(45 downto 0) := (others=>'0');
        variable l2_u : ufixed(4 downto 0);
        variable x_read : unsigned(22 downto 0);
        variable x_final : unsigned(22 downto 0);
    --end lead variables
    --fraction variables 
        
        variable y_start : unsigned(22 downto 0);
        variable y_new: unsigned(23 downto 0);
                variable y_new3: unsigned(22 downto 0);

        variable y_multiplied : unsigned(47 downto 0);  
        variable y_shifted1 : unsigned(25 downto 0);
        variable y_two : unsigned(1 downto 0) := "10";
        variable y_shifted1_int : integer;
        variable y_shifted2 : integer;
variable y_new2: unsigned(23 downto 0);

        

        
        variable frac : ufixed(0 downto -19) := (others =>'0');
        variable frac_shifted : ufixed(-1 downto -19):= (others => '0');
        variable frac_sum : ufixed(-1 downto -19):= (others => '0');
        variable l2_and_frac: ufixed(4 downto -19);
        
    --    variable y
        
        
    --end fraction variables
    begin
        
        if rising_edge(clk) then
            if rst = '0' then -- initialize everything as '0'
                x_multiplied := (others => '0');
                x := (others => '0');
                x_shifted := (others => '0');
                x_test <= (others=>'0');
                i_data_signed := (others => '0');
                i_data_unsigned := (others => '0');
                l2_u := (others => '0');
                o_data_total <= (others => '0');

        
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
                    
                x := (45 downto i_data_unsigned'length => '0') & i_data_unsigned;         --load x with the input and pad with '0's
                --x_array(23) <= x;                                             -- just for checking

                    if x > 0 then                                       --if input is greater than '0'
                       x_shifted := shift_right(unsigned(x), 22); 
                              -- shift the input by 23 to the right
                        if x_shifted = x_zero then
                             
                         -- loop for calculating l2                                       
                            for i in 21 downto 0 loop                            
                                 x := x(44 downto 0) & '0';
                                 l2 := i;
                                 
                                 x_shifted := shift_right(unsigned(x), 22);
                                 
                                    if x_shifted > x_zero then                                        
                                        exit;
                                    end if;
                                    
                             end loop;
                            -- end loop 

                                    x_final := x(22 downto 0);
                                    x_read_test <= x_final;
                                    l2_u := to_ufixed(l2, 4);                             
                                    o_data <= l2; 
                                    o_data_total(4 downto 0) <= l2_u; 
                                    l2_test <= ufixed(l2_u);

                         end if;
                        
                        
                       
                     end if;
                     
                     
                       
-------------------------------------------------------------------------------------------------------------
                        --END OF LEAD----------------------------------------------------
                     ---begining of fraction
                     
                     if x_final > 0 then
                        y_start := x_final;
                        y_new :=  '0' & y_start;
                        frac(0) := '1';
                         y_new2 := y_new;
                     
                        for j in 1 to 19 loop
                       -- if j = 1 then
                      --  y_new2 := y_new;
                       -- end if;
                        
                           -- x_final_test <= y_new2;

                            y_multiplied := (y_new2 * y_new2);
                          --  y_multiplied_sig <= y_multiplied;
                            y_shifted1 := y_multiplied(47 downto 22);
                            --y_new3 :=  y_shifted1;
                            y_shifted1_int := to_integer(y_shifted1);
                            y_shifted2 := y_shifted1_int / (2**22);
                            
                                if y_shifted2 >= 2 then                                
                                    
                                    frac_shifted(-j) := '1';
                                    frac_sum := frac_shifted;-- +frac_sum;
                                    frac_shifted(-j) := '0';
                                    --frac_sig <= frac_sum;  
                                    y_new2 := y_shifted1 / 2;
                                else y_new2 := y_shifted1;      
                                end if;
                        end loop;
                        
                     end if;
                     
            end if;

       end if;
       
    end process;
   
end rtl;
