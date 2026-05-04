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
    type array_logic_vector is array (0 to 256) OF STD_LOGIC_VECTOR(7 downto 0);
    signal instruction_tab : array_logic_vector;
begin

    process(CLK)
    begin
        OUTPUT <= instruction_tab(TO_INTEGER(UNSIGNED(ADDR)));
    end process;

end Behavioral;
