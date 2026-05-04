----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2026 02:49:03 PM
-- Design Name: 
-- Module Name: DataWay - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DataWay is
    Port (CLK : in STD_LOGIC);
end DataWay;

architecture Behavioral of DataWay is


    ------INSTRUCTION MEMORY------
    
    component InstructionMemory is port(
        ADDR : in STD_LOGIC_VECTOR(7 downto 0);
        CLK : in STD_LOGIC;
        OUTPUT : out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    signal sInstructionADDR : STD_LOGIC_VECTOR(7 downto 0);
    signal sInstructionCLK: STD_LOGIC;
    signal sInstructionOUTPUT: STD_LOGIC_VECTOR(31 downto 0);
    
    
    ------DATA MEMORY------

    component DataMemory is port(
        ADDR : in STD_LOGIC_VECTOR(7 downto 0);
        INPUT : in STD_LOGIC_VECTOR(7 downto 0);
        RW : in STD_LOGIC;
        RST : in STD_LOGIC;
        CLK : in STD_LOGIC;
        OUTPUT : out STD_LOGIC_VECTOR(7 downto 0));
    end component;
    
        signal sDMsDMADDR : STD_LOGIC_VECTOR(7 downto 0);
        signal sDMINPUT : STD_LOGIC_VECTOR(7 downto 0);
        signal sDMRW : STD_LOGIC;
        signal sDMRST : STD_LOGIC;
        signal sDMCLK : STD_LOGIC;
        signal sDMOUTPUT :  STD_LOGIC_VECTOR(7 downto 0);
    
    ------REGISTERS------
    
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
    
    signal sRegisteraddr_A : in STD_LOGIC_VECTOR(3 downto 0);
    signal sRegisteraddr_B : in STD_LOGIC_VECTOR(3 downto 0);
    signal sRegisteraddr_W : in STD_LOGIC_VECTOR(3 downto 0);
    signal sRegisterW : in STD_LOGIC;
    signal sRegisterDATA : in STD_LOGIC_VECTOR(7 downto 0);
    signal sRegisterRST : in STD_LOGIC;
    signal sRegisterCLK : in STD_LOGIC;
    signal sRegisterQA : out STD_LOGIC_VECTOR(7 downto 0);
    signal sRegisterQB : out STD_LOGIC_VECTOR(7 downto 0)
    
    ------UAL------
    
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

begin

    process (CLK)
        variable ip : INTEGER; -- instruction pointer
    begin
    
        obj : InstructionMemory PORT MAP(
            sInstructionADDR => ADDR,
            sInstructionCLK => CLK,
            sInstructionOUTPUT => OUTPUT);
    
        InstructionADDR <= STD_LOGIC_VECTOR(ip);
        
        
    end process;
end Behavioral;
