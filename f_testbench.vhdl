library ieee;
use ieee.std_logic_1164.all;

entity f_ent_test_bench is
end entity f_ent_test_bench;

architecture Test_bench of f_ent_test_bench is

   component f_ent
    port (
        F : out std_logic;    
        x, y, z : in std_logic        
    );
  end component;

  signal test_out, test_in_x, test_in_y, test_in_z : std_logic;

begin
  -- Declaración de componente a testear.
  UUT: f_ent port map (F => test_out, x => test_in_x, y => test_in_y, z => test_in_z);

  -- Señales de test
  sign_test: process
  begin
    test_in_x <= '0'; test_in_y <= '0'; test_in_z <= '0'; wait for 100 ns;
    test_in_x <= '0'; test_in_y <= '0'; test_in_z <= '1'; wait for 100 ns;
    test_in_x <= '0'; test_in_y <= '1'; test_in_z <= '0'; wait for 100 ns;
    test_in_x <= '0'; test_in_y <= '1'; test_in_z <= '1'; wait for 100 ns;
    test_in_x <= '1'; test_in_y <= '0'; test_in_z <= '0'; wait for 100 ns;
    test_in_x <= '1'; test_in_y <= '0'; test_in_z <= '1'; wait for 100 ns; 
    test_in_x <= '1'; test_in_y <= '1'; test_in_z <= '0'; wait for 100 ns;
    test_in_x <= '1'; test_in_y <= '1'; test_in_z <= '1'; wait for 100 ns;
    
  end process sign_test;

  -- verificación de salidas
  verif: process
    variable error_status: boolean;
  begin
    wait on test_in_x, test_in_y, test_in_z;
    wait for 1 ns;
    if ( ( test_in_x = '0' and test_in_y = '0' and test_in_z = '0' and test_out = '0' ) or
         ( test_in_x = '0' and test_in_y = '0' and test_in_z = '1' and test_out = '0' ) or
         ( test_in_x = '0' and test_in_y = '1' and test_in_z = '0' and test_out = '0' ) or
         ( test_in_x = '0' and test_in_y = '1' and test_in_z = '1' and test_out = '0' ) or
         ( test_in_x = '1' and test_in_y = '0' and test_in_z = '0' and test_out = '1' ) or
         ( test_in_x = '1' and test_in_y = '0' and test_in_z = '1' and test_out = '1' ) or
         ( test_in_x = '1' and test_in_y = '1' and test_in_z = '0' and test_out = '0' ) or
         ( test_in_x = '1' and test_in_y = '1' and test_in_z = '1' and test_out = '0' )
    )
    then
      error_status := false;
    else 
      error_status := true;
    end if;
    assert not error_status
      report "Test fallado. test_in=(" & std_logic'image(test_in_x) & "," & 
          std_logic'image(test_in_y)& "," & std_logic'image(test_in_z) & "). test_out=" & std_logic'image(test_out)
      severity note;
    assert error_status
      report "Test OK. test_in=(" & std_logic'image(test_in_x) & "," & 
          std_logic'image(test_in_y)& "," & std_logic'image(test_in_z) & "). test_out=" & std_logic'image(test_out)
      severity note;
  end process verif;
end architecture Test_bench;