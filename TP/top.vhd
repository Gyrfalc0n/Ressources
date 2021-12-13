----------------------------------------------------------------------------------
-- Company: EFREI Paris
-- Engineer: 
--    
-- Create Date:    16:19:05 01/24/2019 
-- Design Name: 
-- Module Name:   top - Behavioral 
-- Project Name: TP2 Logique Programmable
-- Target Devices: xc7a200tsbg484
-- Tool versions: 
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
use IEEE.STD_LOGIC_1164.all;

entity top is
  port(
  
  
  CLK100MHZ : in std_logic;                 -- 100 MHz Clock

    sw  : in  std_logic_vector(3 downto 0);  -- 4 Switches
    led : out std_logic_vector(3 downto 0);  -- 3 simple LEDs
    
    led0_b: out std_logic;
    led0_g: out std_logic;
    led0_r: out std_logic;

    led1_b: out std_logic;
    led1_g: out std_logic;
    led1_r: out std_logic;
    
    led2_b: out std_logic;
    led2_g: out std_logic;
    led2_r: out std_logic;
    
    led3_b: out std_logic;
    led3_g: out std_logic;
    led3_r: out std_logic;

    btn  : in std_logic_vector(3 downto 0); -- 4 Button
   
    uart_rxd_out : out std_logic;        -- UART Out (Fpga to PC) 
    uart_txd_in  : in  std_logic      -- UART In (PC to Fpga)
               
    );
end top;

architecture Behavioral of top is

  signal A_In          : std_logic_vector (2 downto 0);
  signal ld_value      : std_logic;
  signal sync_1s       : std_logic;
  signal uart_data_out : std_logic_vector(7 downto 0);
  signal uart_dv       : std_logic;

begin

  -- On assigne le vecteur uart_data_out au vecteur led
  led(0) <= uart_data_out(0) and ld_value;
  led(1) <= uart_data_out(1) and ld_value;
  led(2) <= uart_data_out(2) and ld_value;
  led(3) <= uart_data_out(3) and ld_value;
  
  led0_b <= uart_data_out(4) and ld_value;
  led0_g <= uart_data_out(4) and ld_value;
  led0_r <= uart_data_out(4) and ld_value;
  
  led1_b <= uart_data_out(5) and ld_value;
  led1_g <= uart_data_out(5) and ld_value;
  led1_r <= uart_data_out(5) and ld_value;
  
  led2_b <= uart_data_out(6) and ld_value;
  led2_g <= uart_data_out(6) and ld_value;
  led2_r <= uart_data_out(6) and ld_value;  
  
  led3_b <= uart_data_out(7) and ld_value;
  led3_g <= uart_data_out(7) and ld_value;
  led3_r <= uart_data_out(7) and ld_value;    

  -- Instance du module HeartBeat
  HeartBeat_1 : entity work.HeartBeat
    port map (
      Clock => Clk100mhz,
      Reset => btn(0),
      LED   => ld_value);

  -- Instance du module FSM (Final State Machine)
  fsm_1 : entity work.fsm
    port map (
      clk       => Clk100mhz,
      rst       => btn(0),
      sync_1s   => sync_1s,
      count_out => A_in,
      count_up  => SW(0));

  -- Instance du module sync
  sync_2 : entity work.sync
    port map (
      Clock   => Clk100mhz,
      Reset   => btn(0),
      sync_1s => sync_1s);

  -- Instance du module UART
  uart_1 : entity work.uart
    port map(
      clk         => Clk100mhz,
      rst         => btn(0),
      uart_rx_out => uart_rxd_out,
      uart_tx_in  => uart_txd_in,
      data_out    => uart_data_out,
      dv          => uart_dv);


end Behavioral;

