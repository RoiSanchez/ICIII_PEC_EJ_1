# Ejercicio 1

Se desea diseñar un circuito digital que implemente la función F mostrada a continuación, que depende de las tres variables x, y y z:


> F = (x+y')(yz)'(xy'+x'y)

-**1a)** (0.5 puntos) Escriba en VHDL la entity del circuito que implemente la función lógica. Es decir, que tenga tres entradas x, y y z, y una salida F.

> library ieee;
> use ieee.std_logic_1164.all;
> entity f_ent is
>     port (
>         F : out std_logic;    
>         x, y, z : in std_logic        
>     );
>
> end entity f_ent;