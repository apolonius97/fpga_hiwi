----------------------------------------------------------------------------------
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
        generic (kp : signed(3 downto 0) := "1001"; -- 7 in signed
                kd: signed(5 downto 0) := "101100" --20 in signed
                );
                
        port(   clk : in std_logic;
                rst : in std_logic; 
                ref : in signed(24 downto 0); --li0
                actual : in signed(24 downto 0);
                control : out signed(30 downto 0)
    );
end pid_sim;

architecture Behavioral of pid_sim is
        signal control_diff : signed(24 downto 0); --e
        signal control_diff_last : signed(24 downto 0); --ealt
        
        type pid_state is (ready, calc_err, mult);
        signal state : pid_state := ready;
        signal proportional : signed(29 downto 0);
        signal differential: signed(30 downto 0);
    
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
                state <= calc_err;
            else 
                case state is
                
                    when calc_err =>
                        control_diff <= ref - actual;
                        state <= mult;
                        
                    when mult =>
                        differential <= kd * (control_diff - control_diff_last);
                        proportional <= '0' & (kp * control_diff);
                        control_diff_last <= control_diff;
                        
                    when ready => 
                        control <= differential + proportional;       
               
                end case;
            end if;
        end if;
    end process;

end Behavioral;
