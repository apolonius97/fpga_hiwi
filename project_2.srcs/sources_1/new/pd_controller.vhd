---------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date: 12/12/2023 09:07:07 PM
-- Design Name:
-- Module Name: pid_sim - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description: PID simulation of STM junction Scanning Tunneling Microscopy
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pid_sim is
                
        port(   clk : in std_logic;
                rst : in std_logic;
                ref : in signed(24 downto 0); -- reference log current
                actual : in signed(24 downto 0); -- actual log current
                p : in signed(17 downto 0); -- proportional constant
                d: in signed(17 downto 0); -- differential constant
                z_old: in unsigned(23 downto 0); -- old z-value
                z_new: out unsigned(23 downto 0); -- new z-value
                start: in std_logic -- start claculation
                
    );
end pid_sim;

architecture Behavioral of pid_sim is
        signal control_diff : signed(24 downto 0); --e
        signal control_diff_last : signed(24 downto 0); --ealt
        
        type pid_state is (ready, halt, calc_err, mult, summ);
        signal state : pid_state := ready;
        signal proportional : signed(23 downto 0); --kp
        signal differential: signed(23 downto 0); --kd
        signal control : signed(25 downto 0);
--arrays as the code says
--ax
--bx
--dx
--z0

begin
    process(clk)
    begin
        if rising_edge(clk) then
        
            if rst = '0' then
                control_diff_last <= (others=>'0');
                control_diff <= (others=>'0');
                state <= halt;
            else
                case state is
                    when halt =>
                        if start = '1' then
                            state <= calc_err;
                        end if;
                        
                        
                    when calc_err =>
                        control_diff <= ref - actual;
                        state <= mult;    
                        
                                            
                    when mult =>
                        differential <= signed("*"(d, (control_diff - control_diff_last))(40 downto 17));
                        proportional <= signed("*"(p, control_diff)(40 downto 17));
                        control_diff_last <= control_diff;
                        state<=summ;
                        
                        
                    when summ =>
                        control <= signed("0"&z_old) + signed(differential(23)&differential(23)&std_logic_vector(differential)) + signed(proportional(23)&proportional(23)&std_logic_vector(proportional));       
                        state<=ready;
                        
                    when ready =>
                        if control>=0 then
                            if control(24)='1' then
                               z_new<="111111111111111111111111";
                            else
                               z_new <= resize(unsigned(control), 24);
                            end if;
                        else
                            z_new<=(others => '0');
                        end if;  
                        
                end case;
            end if;
            
        end if;
        
    end process;

end Behavioral;

