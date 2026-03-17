ghdl -a  f_arch.vhdl 
ghdl -a  f_entity.vhdl 
ghdl -a  f_testbench.vhdl 
ghdl -e  f_testbench
ghdl -r f_ent_test_bench --wave=waveform.ghw --stop-time=10000ns
flatpak run io.github.gtkwave.GTKWave waveform.ghw

docker run --rm -v $(pwd):/work -w /work hdlc/ghdl:yosys   yosys -m ghdl -p "ghdl f_ent; prep -top f_ent; write_json -compat-int netlist.json"

netlistsvg netlist.json -o diagram-2.jpg