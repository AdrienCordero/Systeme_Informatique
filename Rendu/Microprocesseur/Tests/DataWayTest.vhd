----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2026 01:40:41 PM
-- Design Name: 
-- Module Name: DataWayTest - Behavioral
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

entity DataWayTest is

end DataWayTest;

architecture Behavioral of DataWayTest is
    component DataWay is port( CLK : in STD_LOGIC);
    end component;
    
    signal sCLK : STD_LOGIC := '1';
    constant clk_period : time := 10ns;
    
begin

    obj : DataWay PORT MAP (
        CLK => sCLK
    );
    
    process
    begin
        sCLK <= not(sCLK);
        wait for clk_period/2;
    end process;
    
    --sIP <= "00000000", "00000001" after 100ns, "00000010" after 200ns, "00000011" after 300ns;

        
end Behavioral;
