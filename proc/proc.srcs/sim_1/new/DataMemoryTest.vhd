----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2026 02:00:24 PM
-- Design Name: 
-- Module Name: DataMemoryTest - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DataMemoryTest is
end DataMemoryTest;

architecture Behavioral of DataMemoryTest is

    component DataMemory is port(
        ADDR : in STD_LOGIC_VECTOR(7 downto 0);
        INPUT : in STD_LOGIC_VECTOR(7 downto 0);
        RW : in STD_LOGIC;
        RST : in STD_LOGIC;
        CLK : in STD_LOGIC;
        OUTPUT : out STD_LOGIC_VECTOR(7 downto 0));
    end component;
    
    signal sADDR : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal sINPUT : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal sRW : STD_LOGIC := '0';
    signal sRST : STD_LOGIC := '0';
    signal sCLK : STD_LOGIC := '0';
    signal sOUTPUT : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
        
    constant clk_period : time := 10ns;

begin

    obj : DataMemory PORT MAP(
        ADDR => sADDR,
        INPUT => sINPUT,
        RW => sRW,
        RST => sRST,
        CLK => sCLK,
        OUTPUT => sOUTPUT
    );
    
    --Clock process definitions
    process
    begin
        sCLK <= not(sCLK);
        wait for clk_period/2;
    end process;

    sADDR <= "00000001", "01000100" after 200ns;
    sINPUT <= "00000010", "00000100" after 200ns;
    sRW <= '0', '1' after 100ns, '0' after 200ns, '1' after 210ns;
    sRST <= '1';
    
end Behavioral;
