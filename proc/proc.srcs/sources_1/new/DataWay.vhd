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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DataWay is
    Port (
        CLK : in STD_LOGIC;
        IP : in STD_LOGIC_VECTOR(7 downto 0)
    );
end DataWay;

architecture Behavioral of DataWay is

    ------INSTRUCTION MEMORY------
    
    component InstructionMemory is port(
        ADDR : in STD_LOGIC_VECTOR(7 downto 0);
        CLK : in STD_LOGIC;
        OUTPUT : out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    signal sInstructionADDR : STD_LOGIC_VECTOR(7 downto 0);
    signal sInstructionOUTPUT: STD_LOGIC_VECTOR(31 downto 0);
    signal sInstructionOP : STD_LOGIC_VECTOR(7 downto 0);
    
    
    ------DATA MEMORY------

    component DataMemory is port(
        ADDR : in STD_LOGIC_VECTOR(7 downto 0);
        INPUT : in STD_LOGIC_VECTOR(7 downto 0);
        RW : in STD_LOGIC;
        RST : in STD_LOGIC;
        CLK : in STD_LOGIC;
        OUTPUT : out STD_LOGIC_VECTOR(7 downto 0));
    end component;
    
    signal sDMADDR : STD_LOGIC_VECTOR(7 downto 0);
    signal sDMINPUT : STD_LOGIC_VECTOR(7 downto 0);
    signal sDMRW : STD_LOGIC;
    signal sDMRST : STD_LOGIC;
    signal sDMOUTPUT :  STD_LOGIC_VECTOR(7 downto 0);
    signal sDMOP : STD_LOGIC_VECTOR(7 downto 0);
    
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
    
    signal sRegisteraddr_A : STD_LOGIC_VECTOR(3 downto 0);
    signal sRegisteraddr_B : STD_LOGIC_VECTOR(3 downto 0);
    signal sRegisteraddr_W : STD_LOGIC_VECTOR(3 downto 0);
    signal sRegisterW : STD_LOGIC;
    signal sRegisterDATA : STD_LOGIC_VECTOR(7 downto 0);
    signal sRegisterRST : STD_LOGIC;
    signal sRegisterQA : STD_LOGIC_VECTOR(7 downto 0);
    signal sRegisterQB : STD_LOGIC_VECTOR(7 downto 0);
    signal sRegisterOP : STD_LOGIC_VECTOR(7 downto 0);
    
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
    
    signal sA : STD_LOGIC_VECTOR(7 downto 0);
    signal sB : STD_LOGIC_VECTOR(7 downto 0);
    signal sCtrl_Alu : STD_LOGIC_VECTOR(2 downto 0);
    signal sN : STD_LOGIC;
    signal sO : STD_LOGIC;
    signal sZ : STD_LOGIC;
    signal sC: STD_LOGIC;
    signal sS : STD_LOGIC_VECTOR(7 downto 0);
    signal sOP : STD_LOGIC_VECTOR(7 downto 0);
    
    signal sLIDIA : STD_LOGIC_VECTOR(7 downto 0);
    signal sLIDIB : STD_LOGIC_VECTOR(7 downto 0);
    signal sDIEXA : STD_LOGIC_VECTOR(7 downto 0);
    signal sDIEXB : STD_LOGIC_VECTOR(7 downto 0);
    signal sEXMEMA : STD_LOGIC_VECTOR(7 downto 0);
    signal sEXMEMB : STD_LOGIC_VECTOR(7 downto 0);
    
begin

    instruction_memory : InstructionMemory PORT MAP(
        ADDR => sInstructionADDR,
        CLK => CLK,
        OUTPUT => sInstructionOUTPUT
    );
              
    registers_file : Registers PORT MAP(
        addr_A => sRegisteraddr_A,
        addr_B => sRegisteraddr_B,
        addr_W => sRegisteraddr_W,
        W => sRegisterW,
        DATA => sRegisterDATA,
        RST => sRegisterRST,
        CLK => CLK,
        QA => sRegisterQA,
        QB => sRegisterQB
    );
    
    data_memory: DataMemory PORT MAP(
        ADDR => sDMADDR,
        INPUT => sDMINPUT,
        RW => sDMRW,
        RST => sDMRST,
        CLK => CLK,
        OUTPUT => sDMOUTPUT
    );
          
    unit_al: UAL PORT MAP(
        A => sA,
        B => sB,
        Ctrl_Alu => sCtrl_Alu,
        N => sN,
        O => sO,
        Z => sZ,
        C => sC,
        S => sS 
    );
         
    LI_DI : process (CLK)
    begin
        sInstructionADDR <= STD_LOGIC_VECTOR(IP);
        
        sLIDIA <= sInstructionOUTPUT(23 downto 16);
        sLIDIB <= sInstructionOUTPUT(15 downto 8);
        if sInstructionOUTPUT(31 downto 24) = "00000101" then
            sRegisteraddr_A <= sInstructionOUTPUT(11 downto 8); -- COP
        end if;
        sRegisterOP <= sInstructionOUTPUT(31 downto 24); 
    end process;
    
    DI_EX : process(CLK)
    begin
        sDIEXA <= sLIDIA;
        case sRegisterOP is
            when "00000101" => sDIEXB <= sRegisterQA; -- COP
            when others => sDIEXB <= sLIDIB;
        end case;
        sOP <= sRegisterOP;
    end process;
    
    EX_Mem : process(CLK)
    begin
        sEXMEMA <= sDIEXA;
        sEXMEMB <= sDIEXB;
        sDMOP <= sOP;
    end process;
    
    Mem_RE : process(CLK)
    begin
        sRegisteraddr_W <= sEXMEMA(3 downto 0);
        sRegisterDATA <= sEXMEMB;
        case sDMOP is
            when "00000110" => sRegisterW <= '1'; -- AFC
            when "00000101" => sRegisterW <= '1'; -- COP
            when others => sRegisterW <= '0';
        end case;
    end process;
end Behavioral;
