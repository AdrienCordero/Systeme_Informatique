----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2026 02:38:06 PM
-- Design Name: 
-- Module Name: InstructionMemory - Behavioral
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

entity InstructionMemory is
    Port ( ADDR : in STD_LOGIC_VECTOR(7 downto 0);
           CLK : in STD_LOGIC;
           OUTPUT : out STD_LOGIC_VECTOR(31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is
    type array_logic_vector is array (0 to 255) OF STD_LOGIC_VECTOR(31 downto 0);
    signal instruction_tab : array_logic_vector := (others => "00000000000000000000000000000000");
begin    
    instruction_tab(1) <= "00000110"&"00000010"&"00000001"&"00000000"; -- Mettre 1 dans r2
    instruction_tab(2) <= "00000110"&"00000011"&"00000010"&"00000000"; -- Mettre 2 dans r3
    -- NOP
    -- NOP
    -- NOP
    instruction_tab(6) <= "00000001"&"00000100"&"00000011"&"00000010"; -- r2 + r3 dans r4
    -- NOP
    -- NOP
    -- NOP
    instruction_tab(10) <= "00000010"&"00000101"&"00000100"&"00000011"; -- r4 * r3 dans r5
    instruction_tab(11) <= "00000101"&"00000110"&"00000010"&"00000000"; -- Copier r2 dans r6
    -- NOP
    instruction_tab(13) <= "00001101"&"00000111"&"00000001"&"00000000"; -- Load 0x1 (8) dans r7
    -- NOP
    instruction_tab(15) <= "00001101"&"00001000"&"00000011"&"00000000"; -- Load 0x3 (11) dans r8
    
    process(CLK)
    begin
        if (rising_edge(CLK)) then
            OUTPUT <= instruction_tab(TO_INTEGER(UNSIGNED(ADDR)));
        end if;
    end process;

end Behavioral;
