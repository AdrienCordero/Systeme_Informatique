----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2026 02:03:55 PM
-- Design Name: 
-- Module Name: Registers_test - Behavioral
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

entity Registers_test is
end Registers_test;

architecture Behavioral of Registers_test is

    component Registers is port(
        addr_A : in STD_LOGIC_VECTOR(3 downto 0);
        addr_B : in STD_LOGIC_VECTOR(3 downto 0);
        addr_W : in STD_LOGIC_VECTOR(3 downto 0);
        W : in STD_LOGIC;
        DATA : in STD_LOGIC_VECTOR(7 downto 0);
        RST : in STD_LOGIC;
        CLK : in STD_LOGIC;
        QA : out STD_LOGIC_VECTOR(7 downto 0);
        QB : out STD_LOGIC_VECTOR(7 downto 0));
    end component;
           
    signal saddr_A : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal saddr_B : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal saddr_W : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal sW : STD_LOGIC := '0';
    signal sDATA : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal sRST : STD_LOGIC := '0';
    signal sCLK : STD_LOGIC := '0';
    signal sQA : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal sQB : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

    type array_logic_vector is array (0 to 15) OF STD_LOGIC_VECTOR(7 downto 0);
    signal registers_tab : array_logic_vector;
    
    constant clk_period : time := 10ns;
begin

    obj : Registers PORT MAP(
        addr_A => saddr_A,
        addr_B => saddr_B,
        addr_W => saddr_W,
        W => sW,
        DATA => sDATA,
        RST => sRST,
        CLK => sCLK,
        QA => sQA,
        QB => sQB
    );
    
    --Clock process definitions
    --process
    --begin
    --    sCLK <= not(sCLK);
    --    wait for clk_period/2;
    --end process;
    
    sCLK <= '0', '1' after 100ns;
    

    saddr_A <= "0000", "0001" after 150ns, "0011" after 250ns;
    saddr_B <= "0000", "0010" after 150ns;
    saddr_W <= "0001", "0010" after 50ns, "0011" after 100ns;
    sW <= '1', '0' after 150ns;
    sDATA <= "00000001", "00000010" after 50ns, "00000011" after 100ns;
    sRST <= '0', '1' after 300ns;
    sCLK <= '0';
end Behavioral;
