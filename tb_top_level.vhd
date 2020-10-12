-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 12.10.2020 01:41:22 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_top_level is
end tb_top_level;

architecture tb of tb_top_level is

    component top_level
        port (clk     : in std_logic;
              reset_n : in std_logic;
              SW      : in std_logic_vector (9 downto 0);
              LEDR    : out std_logic_vector (9 downto 0);
              HEX0    : out std_logic_vector (7 downto 0);
              HEX1    : out std_logic_vector (7 downto 0);
              HEX2    : out std_logic_vector (7 downto 0);
              HEX3    : out std_logic_vector (7 downto 0);
              HEX4    : out std_logic_vector (7 downto 0);
              HEX5    : out std_logic_vector (7 downto 0));
    end component;

    signal clk     : std_logic := '0';
    signal reset_n : std_logic := '0';
    signal SW      : std_logic_vector (9 downto 0);
    signal LEDR    : std_logic_vector (9 downto 0);
    signal HEX0    : std_logic_vector (7 downto 0);
    signal HEX1    : std_logic_vector (7 downto 0);
    signal HEX2    : std_logic_vector (7 downto 0);
    signal HEX3    : std_logic_vector (7 downto 0);
    signal HEX4    : std_logic_vector (7 downto 0);
    signal HEX5    : std_logic_vector (7 downto 0);
    
    constant time_delay       : time := 20 ns;

begin

    dut : top_level
    port map (clk     => clk,
              reset_n => reset_n,
              SW      => SW,
              LEDR    => LEDR,
              HEX0    => HEX0,
              HEX1    => HEX1,
              HEX2    => HEX2,
              HEX3    => HEX3,
              HEX4    => HEX4,
              HEX5    => HEX5);

    clk_stim : process
    begin
      clk <= not clk;
      wait for time_delay;
    end process;
    
    mode_stim : process
    begin
      SW(9) <= '0'; wait for time_delay * 2;
      SW(9) <= '1'; wait for time_delay * 2;
    end process;
      
    main_stim : process
    begin
    
      SW(8 downto 0) <= "000000000";
      wait for time_delay * 4;
      SW(8 downto 0) <= "000000001";
      wait for time_delay * 4;
      SW(8 downto 0) <= "000000010";
      wait for time_delay * 4;
      SW(8 downto 0) <= "000000100";
      wait for time_delay * 4;
      SW(8 downto 0) <= "000001000";
      wait for time_delay * 4;
      SW(8 downto 0) <= "111111111";
      wait for time_delay * 4;
      reset_n <= '1';
      wait for time_delay * 4;
      reset_n <= '0';
      SW(8 downto 0) <= "101010101";
      wait for time_delay * 4;
      reset_n <= '1';
      wait for time_delay * 4;
      reset_n <= '0';
      SW(8 downto 0) <= "010101010";
      wait for time_delay * 4;
      reset_n <= '1';
      wait for time_delay * 4;
      reset_n <= '0';
      wait;
      
    end process;

end tb;
