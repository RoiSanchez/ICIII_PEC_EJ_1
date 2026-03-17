architecture Comp2 of f_ent is
  component not_ent is 
    port ( y0 : out std_logic;
           x0 : in std_logic);
  end component not_ent;
  component and_ent is 
    port ( y0 : out std_logic;
           x0, x1 : in std_logic);
  end component and_ent;
  component or_ent is 
    port ( y0 : out std_logic;
           x0, x1 : in std_logic);
  end component or_ent;

  signal s0, s1, s2, s3, s4, s5, s6, s7, s8 : std_logic;

begin
  Not_1: not_ent port map (y0 => s0, x0 => y);
  Or_1 : or_ent port map (y0 => s1, x0 => x, x1 => s0);
  And_1 : and_ent port map (y0 => s2, x0=>y, x1 => z);
  Not_2 : not_ent port map (y0 => s3, x0 => s2);
  And_2 : and_ent port map (y0 => s4, x0 => x, x1 => s0);
  Not_3 : not_ent port map (y0 => s5, x0 => x);
  And_3 : and_ent port map (y0 => s6, x0 => s5, x1 => y);
  And_4 : and_ent port map (y0 => s7, x0 => s1, x1 => s3);
  Or_2 : or_ent port map (y0 => s8, x0 => s4, x1 => s6);
  And_5 : and_ent port map (y0 => F, x0 => s7, x1 => s8);
  
  
end architecture Comp2;