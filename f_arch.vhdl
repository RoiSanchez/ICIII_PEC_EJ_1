architecture Comp of f_ent is

begin
  F <= (x or (not y)) and (not(y and z)) and ((x and not(y)) or (not(x) and y));
  
end architecture Comp;