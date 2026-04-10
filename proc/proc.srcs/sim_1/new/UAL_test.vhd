----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2026 02:10:39 PM
-- Design Name: 
-- Module Name: UAL_test - Behavioral
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
use IEEE.std_logic_signed.all;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UAL_test is
end UAL_test;

architecture Behavioral of UAL_test is

    component UAL is port (
        A : in STD_LOGIC_VECTOR(7 downto 0);
        B : in STD_LOGIC_VECTOR(7 downto 0);
        Ctrl_Alu : in STD_LOGIC_VECTOR(2 downto 0);
        N : out STD_LOGIC;
        O : out STD_LOGIC;
        Z : out STD_LOGIC;
        C : out STD_LOGIC;
        S : out STD_LOGIC_VECTOR(7 downto 0));
    end component;
    
    signal sA : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal sB : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal sCtrl_Alu : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal sN : STD_LOGIC := '0';
    signal sO : STD_LOGIC := '0';
    signal sZ : STD_LOGIC := '0';
    signal sC : STD_LOGIC := '0';
    signal sS : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

begin

    obj : UAL PORT MAP (
        A => sA,
        B => sB,
        Ctrl_Alu => sCtrl_Alu,
        N => sN,
        O => sO,
        Z => sZ,
        C => sC,
        S => sS
    );
    
    sA <= "00000011";
    sB <= "00000010";
    sCtrl_Alu <= "000", "001" after 10ns, "010" after 200ns, "011" after 400ns, "100" after 600ns;

end Behavioral;
