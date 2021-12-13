library ieee;
use ieee.std_logic_1164.all;

entity uart_tb is
end entity uart_tb;

architecture sim of uart_tb is
  signal run   : std_logic :='1';
  signal clk   : std_logic :='1';
  signal rst   : std_logic;
  signal rx    : std_logic;
  signal ld0_r : std_logic;
  signal ld0_b : std_logic;
  signal ld0_g : std_logic;

  signal ld1_r : std_logic;
  signal ld1_b : std_logic;
  signal ld1_g : std_logic;

  signal ld2_r : std_logic;
  signal ld2_b : std_logic;
  signal ld2_g : std_logic;

  signal ld3_r : std_logic;
  signal ld3_b : std_logic;
  signal ld3_g : std_logic;

  signal ld4 : std_logic;
  signal ld5 : std_logic;
  signal ld6 : std_logic;
  signal ld7 : std_logic;


begin

  fsm_2: entity work.fsm
    port map (
    clk => clk,
    rst => rst,
    rx => rx,

    ld0_r => ld0_r,
    ld0_b => ld0_b,
    ld0_g => ld0_g,

    ld1_r => ld1_r,
    ld1_b => ld1_b,
    ld1_g => ld1_g,

    ld2_r => ld2_r,
    ld2_b => ld2_b,
    ld2_g => ld2_g,

    ld3_r => ld3_r,
    ld3_b => ld3_b,
    ld3_g => ld3_g,

    ld4 => ld4,
    ld5 => ld5,
    ld6 => ld6,
    ld7 => ld7);

  clk <= not clk after 4340 ns when run = '1' else '0';

  wavegen : process
  begin
    rst   <= '1';
    rx    <= '1';
    wait for 1 ms;

    rst <= '0';
    wait for 1 ms;

-- bit de start
    rx <='0';
    wait for 8680 ns;

-- 1e bit de data
    rx <='0';
    wait for 8680 ns;

-- 2e bit de data
    rx <='1';
    wait for 8680 ns;
    
-- 3e bit de data
    rx <='1';
    wait for 8680 ns;
    
-- 4e bit de data
    rx <='0';
    wait for 8680 ns;

-- 5e bit de data
    rx <='0';
    wait for 8680 ns;

-- 6e bit de data
    rx <='1';
    wait for 8680 ns;

-- 7e bit de data
    rx <='0';
    wait for 8680 ns;

-- 8e bit de data
    rx <='0';
    wait for 8680 ns;

-- bit de stop
    rx <='1';
    wait for 8680 ns;

-- stop simulation
    wait for 10 ms;
    run <= '0';

-- exit process
    wait;

  end process wavegen;

end architecture sim;
