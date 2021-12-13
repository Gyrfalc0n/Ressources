library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is
    port (
        clk   : in std_logic;
        rst   : in std_logic;
        rx    : in std_logic;
        ld0_r : out std_logic;
        ld0_b : out std_logic;
        ld0_g : out std_logic;
      
        ld1_r : out std_logic;
        ld1_b : out std_logic;
        ld1_g : out std_logic;
      
        ld2_r : out std_logic;
        ld2_b : out std_logic;
        ld2_g : out std_logic;
      
        ld3_r : out std_logic;
        ld3_b : out std_logic;
        ld3_g : out std_logic;
      
        ld4   : out std_logic;
        ld5   : out std_logic;
        ld6   : out std_logic;
        ld7   : out std_logic);
end entity fsm;

architecture RTL of fsm is

  type state_t is (st_idle, st_start, st_bit1, st_bit2, st_bit3, st_bit4, st_bit5, st_bit6, st_bit7, st_bit8, st_stop);
  signal state : state_t;

begin

    fsm_p : process (clk, rst) is
        begin  -- process fsm_p
          if (rst = '1') then
            ld0_r <= '0';
            ld0_b <= '0';
            ld0_g <= '0';
              
            ld1_r <= '0';
            ld1_b <= '0';
            ld1_g <= '0';
              
            ld2_r <= '0';
            ld2_b <= '0';
            ld2_g <= '0';
              
            ld3_r <= '0';
            ld3_b <= '0';
            ld3_g <= '0';
              
            ld4   <= '0';
            ld5   <= '0';
            ld6   <= '0';
            ld7   <= '0';
                  
          elsif rising_edge(clk) then
            case(state) is
              when st_idle =>
                ld0_r <= '0';
                ld0_b <= '0';
                ld0_g <= '0';
                  
                ld1_r <= '0';
                ld1_b <= '0';
                ld1_g <= '0';
                  
                ld2_r <= '0';
                ld2_b <= '0';
                ld2_g <= '0';
                  
                ld3_r <= '0';
                ld3_b <= '0';
                ld3_g <= '0';
                  
                ld4   <= '0';
                ld5   <= '0';
                ld6   <= '0';
                ld7   <= '0';
                state <= st_start;
                
                when st_start =>
                   if (rx = '0') then
                   --les transitions
                  	     state <= st_bit1;
                   end if;
                  
                when st_bit1 =>
                   if (rx = '1') then
                     ld0_r <= '1';
                   end if;
                  
                --les transitions
                    state <= st_bit2;
                
                when st_bit2 =>
                   if (rx = '1') then
                     ld1_r <= '1';
                   end if;
              
                --les transitions
                  state <= st_bit3;
                   
                when st_bit3 =>
                   if (rx = '1') then
                     ld2_r <= '1';
                   end if;

                --les transitions
                    state <= st_bit4;
                   
                when st_bit4 =>
                   if (rx = '1') then
                     ld3_r <= '1';
                   end if;

                --les transitions
                    state <= st_bit5;
                   
                when st_bit5 =>
                   if (rx = '1') then
                     ld4 <= '1';
                   end if;

                --les transitions
                    state <= st_bit6;
                   
                when st_bit6 =>
                   if (rx = '1') then
                     ld5 <= '1';
                   end if;

                --les transitions
                    state <= st_bit7;
                   
                when st_bit7 =>
                   if (rx = '1') then
                     ld6 <= '1';
                   end if;

                --les transitions
                    state <= st_bit8;
                   
                when st_bit8 =>
                   if (rx = '1') then
                     ld7 <= '1';
                   end if;
                
                    state <= st_stop;

                when st_stop =>
                   if (rx = '1') then
                   end if;
                
                    state <= st_idle;
                
              when others =>
                ld0_b <= '1';
                ld1_b <= '1';
                ld2_b <= '1';
                state <= st_idle;
                
            end case;
          end if;
        end process fsm_p;
end architecture RTL;