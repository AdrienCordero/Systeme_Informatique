----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2026 01:45:25 PM
-- Design Name: 
-- Module Name: DataMemory - Behavioral
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

entity DataMemory is
    Port ( ADDR : in STD_LOGIC_VECTOR(7 downto 0);
           INPUT : in STD_LOGIC_VECTOR(7 downto 0);
           RW : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           OUTPUT : out STD_LOGIC_VECTOR(7 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is
    type array_logic_vector is array (0 to 256) OF STD_LOGIC_VECTOR(7 downto 0);
    signal memory_tab : array_logic_vector;
begin
    process (CLK, RST)
    begin
    
    -- READ
    if (RW = '1') then
        OUTPUT <= memory_tab(TO_INTEGER(UNSIGNED(ADDR)));
        
    -- WRITE
    else
        memory_tab(TO_INTEGER(UNSIGNED(ADDR))) <= INPUT;
    end if;
    
    -- RST
    if (RST = '0') then
        OUTPUT <= "00000000";
        memory_tab <= (others => "00000000");
    end if;
    
    end process;

end Behavioral;
