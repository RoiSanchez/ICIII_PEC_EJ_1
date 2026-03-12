ghdl -a  f_arch.vhdl 
ghdl -a  f_entity.vhdl 
ghdl -a  f_testbench.vhdl 
ghdl -e  f_testbench
ghdl -r f_ent_test_bench --wave=waveform.ghw --stop-time=10000ns
flatpak run io.github.gtkwave.GTKWave waveform.ghw