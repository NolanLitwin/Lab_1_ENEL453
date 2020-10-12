-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 10.10.2020 02:03:38 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_MUX2TO1 is
end tb_MUX2TO1;

architecture tb of tb_MUX2TO1 is

    component MUX2TO1
        port (in1     : in std_logic_vector (15 downto 0);
              in2     : in std_logic_vector (15 downto 0);
              s       : in std_logic;
              mux_out : out std_logic_vector (15 downto 0));
    end component;

    signal in1     : std_logic_vector (15 downto 0);
    signal in2     : std_logic_vector (15 downto 0);
    signal s       : std_logic := '0';
    signal mux_out : std_logic_vector (15 downto 0);
    constant time_delay       : time := 20 ns;

begin

    dut : MUX2TO1
    port map (in1     => in1,
              in2     => in2,
              s       => s,
              mux_out => mux_out);

    s_stim : process
    begin
      s <= not s;
      wait for time_delay;
    end process;


    in1_stim : process
      begin
        in1 <= (others => '0');
        in2 <= (others => '0');
        in1(15 downto 0) <= "0000000000000000";
        wait for time_delay*2;
        in2(15 downto 0) <= "1111111111111111";
        wait for time_delay*2;
        
        in1(15 downto 0) <= "1111111111111111";
        wait for time_delay*2;
        in2(15 downto 0) <= "0000000000000000";
        wait for time_delay*2;

        in1(15 downto 0) <= "1100110011001100";
        wait for time_delay*2;
        in2(15 downto 0) <= "0011001100110011";
        wait for time_delay*2;

        in1(15 downto 0) <= "0011001100110011";
        wait for time_delay*2;
        in2(15 downto 0) <= "1100110011001100";
        wait for time_delay*2;

        in1(15 downto 0) <= "1010101010101010";
        wait for time_delay*2;
        in2(15 downto 0) <= "0101010101010101";
        wait for time_delay*2;

        in1(15 downto 0) <= "0101010101010101";
        wait for time_delay*2;
        in2(15 downto 0) <= "1010101010101010";

        wait;
    end process;
    
    

end tb;
