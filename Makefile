default: $(PROJ).bin
all: default sim draw flash

%.blif: $(SRC)
	yosys -p 'synth_ice40 -top $(basename $<) -blif $@' $^

%.asc: $(PIN_DEF) %.blif
	arachne-pnr -d $(DEVICE) -o $@ -p $^

%.bin: %.asc
	icepack $< $@

%_tb: $(BENCH) $(SRC)
	iverilog -o $@ $^

%_tb.vcd: %_tb
	vvp -N $< +vcd=$@

%.json: $(SRC)
	yosys -p "prep -top $(basename $<); write_json $@" $^

%.svg: %.json
	netlistsvg $^ -o $@

draw: $(PROJ).svg

sim: $(basename $(BENCH)).vcd
	open -a Scansion $^

flash: $(PROJ).bin
	iceprog $<

clean:
	@echo "\033[0;33mCleaning build...\033[0;0m"
	@rm -f *.blif *.asc *.bin *.vcd *.json
