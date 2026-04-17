----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2026 01:44:28 PM
-- Design Name: 
-- Module Name: UAL - Behavioral
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

entity UAL is
    Port ( A : in STD_LOGIC_VECTOR(7 downto 0);
           B : in STD_LOGIC_VECTOR(7 downto 0);
           Ctrl_Alu : in STD_LOGIC_VECTOR(2 downto 0);
           N : out STD_LOGIC;
           O : out STD_LOGIC;
           Z : out STD_LOGIC;
           C : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR(7 downto 0));
end UAL;

architecture Behavioral of UAL is
begin
    process 
        variable tmp_add : UNSIGNED (8 downto 0);
        variable tmp_sub_div : UNSIGNED (7 downto 0);
        variable tmp_res : UNSIGNED(15 downto 0);
    begin
        wait until Ctrl_Alu'event and Ctrl_Alu /= "000"; -- detecter changement
        case Ctrl_Alu is
        
        ----------------------- ADD ----------------------------
        when "001" =>
            tmp_add := ('0' & UNSIGNED(A)) + ('0' & UNSIGNED(B));
            S <= STD_LOGIC_VECTOR(tmp_add(7 downto 0));
            if (tmp_add(8) = '1') then
                C <= '1';
                O <= '1';
            else
                C <= '0';
                O <= '0';
            end if;
            if (tmp_add < 0) then
                N <= '1';
            else
                N <= '0';
            end if;
            if (tmp_add = 0) then
                Z <= '1';
            else
                Z <= '0';
            end if;
            
        ----------------------- SUB ----------------------------
        when "010" =>
            tmp_sub_div := UNSIGNED(A) - UNSIGNED(B);
            S <= STD_LOGIC_VECTOR(tmp_sub_div);
            if (tmp_sub_div < 0) then
                N <= '1';
            else
                N <= '0';
            end if;
            if (tmp_sub_div = 0) then
                Z <= '1';
            else
                Z <= '0';
            end if;
            
        ----------------------- MUL ----------------------------
        when "011" =>
            tmp_res := UNSIGNED(A) * UNSIGNED(B);
            S <= STD_LOGIC_VECTOR(tmp_res(7 downto 0));
            if (tmp_res > 128) then
                O <= '1';
            else
                O <= '0';
            end if;
            if (tmp_res < 0) then
                N <= '1';
            else
                N <= '0';
            end if;
            if (tmp_res = 0) then
                Z <= '1';
            else
                Z <= '0';
            end if;
            
        ----------------------- DIV ----------------------------
        when "100" =>
            if (B = 0) then
                S <= "00000000";
            else
                tmp_sub_div := UNSIGNED(A) / UNSIGNED(B);
                S <= STD_LOGIC_VECTOR(tmp_sub_div);
                if (tmp_sub_div < 0) then
                    N <= '1';
                else
                    N <= '0';
                end if;
                if (tmp_sub_div = 0) then
                    Z <= '1';
                else
                    Z <= '0';
                end if;
            end if;
            
        when others =>
            S <= "00000000";
        end case;
    end process;
end Behavioral;
