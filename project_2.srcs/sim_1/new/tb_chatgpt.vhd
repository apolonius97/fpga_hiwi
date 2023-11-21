library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegister_TB is
end ShiftRegister_TB;

architecture Behavioral of ShiftRegister_TB is
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal data_in : STD_LOGIC_VECTOR(7 downto 0) := "10101010";
    signal shift_out : STD_LOGIC_VECTOR(7 downto 0);

    constant clock_period : time := 10 ns; -- Adjust the clock period as needed
begin

    -- Instantiate the ShiftRegister
    uut: entity work.ShiftRegister
        port map (
            clk => clk,
            reset => reset,
            data_in => data_in,
            shift_out => shift_out
        );

    -- Clock process
    process
    begin
        while now < 1000 ns loop -- Simulate for 1000 ns
            clk <= '0';
            wait for clock_period / 2;
            clk <= '1';
            wait for clock_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    process
    begin
        -- Apply reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- Apply input data and observe output
        data_in <= "10101010";
        wait for 10 ns;
        assert shift_out = "01010101" report "Test Failed for initial data input" severity error;

        data_in <= "11001100";
        wait for 10 ns;
        assert shift_out = "01100110" report "Test Failed for second data input" severity error;

        -- Add more test cases as needed

        wait;
    end process;

end Behavioral;

