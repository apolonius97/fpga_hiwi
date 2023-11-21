library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ShiftRegister is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR(7 downto 0);
           shift_out : out STD_LOGIC_VECTOR(7 downto 0));
end ShiftRegister;

architecture Behavioral of ShiftRegister is
    signal register_data : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            register_data <= (others => '0');
        elsif rising_edge(clk) then
            -- Shift operation on rising edge of the clock
            register_data <= '0' & register_data(7 downto 1);
        end if;
    end process;

    -- Output the shifted data
    shift_out <= register_data;

end Behavioral;
