----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2026 01:43:07 PM
-- Design Name: 
-- Module Name: Registers - Behavioral
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

entity Registers is
    Port ( addr_A : in STD_LOGIC_VECTOR(3 downto 0);
           addr_B : in STD_LOGIC_VECTOR(3 downto 0);
           addr_W : in STD_LOGIC_VECTOR(3 downto 0);
           W : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR(7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR(7 downto 0);
           QB : out STD_LOGIC_VECTOR(7 downto 0));
end Registers;

architecture Behavioral of Registers is
    type array_logic_vector is array (0 to 15) OF STD_LOGIC_VECTOR(7 downto 0);
    signal registers_tab : array_logic_vector;
begin
    process (CLK, RST)
    begin        
    
        ----------------------- WRITE ----------------------------
        if (W = '1') then
            registers_tab(TO_INTEGER(UNSIGNED(addr_W))) <= DATA;
        end if;
        
         ----------------------- RST ----------------------------
        if (RST = '0') then
            QA <= "00000000";
            QB <= "00000000";
            registers_tab <= (others => "00000000");
        end if;
        
        ----------------------- READ ----------------------------
        QA <= registers_tab(TO_INTEGER(UNSIGNED(addr_A)));
        QB <= registers_tab(TO_INTEGER(UNSIGNED(addr_B)));
    end process;
end Behavioral;
