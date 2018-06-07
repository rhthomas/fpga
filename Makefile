FILES  = files
DESIGN = design
SIM    = sim
SVG    = ../../netlistsvg/bin/netlistsvg.js

#----------------------------------------------------
# DEPENDENCIES

$(FILES).txt:
	find *.v > $@
	@echo "\x1B[0;33mFiles found:"
	@cat $@
	@echo "\x1B[0m"

$(DESIGN).vvp: $(FILES).txt
	iverilog -o $(DESIGN).vvp -c $(FILES).txt

$(SIM).vcd: $(DESIGN).vvp
	vvp $<

#----------------------------------------------------
# DIRECTIVES

default: sim
all: default

check: $(FILES).txt
	
sim: $(SIM).vcd

draw: main.v
	yosys -p "prep -top top; write_json out.json" $<
	node $(SVG) out.json

disp: $(SIM).vcd
	open -a Scansion $^

flash: 
	yosys -p "synth_ice40 -blif hardware.blif" main.v
	arachne-pnr -d 1k -p icestick.pcf hardware.blif -o hardware.asc
	icepack hardware.asc hardware.bin
	iceprog hardware.bin

time:
	icetime -tmd hx1k main.asc

clean:
	-rm -f files.txt *.vvp *.vcd *.svg *.json *.blif *.asc *.bin
 
