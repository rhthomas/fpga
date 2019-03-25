# -----------------------------------------------------------------------------
# FOSS Verilog Toolchain
#
# Author  : Rhys Thomas
# Created : 2018-07-17
# -----------------------------------------------------------------------------

default: all
all: $(PROJ).bin

# -----------------------------------------------------------------------------
# File extensions

%.blif: $(SRC)
	yosys -p 'synth_ice40 -top $(TOP) -blif $@' $(SRC)

%.asc: $(PIN_DEF) %.blif
	arachne-pnr -d $(DEVICE) -o $@ -p $^

%.bin: %.asc
	icepack $< $@

%_tb: $(BENCH) $(SRC)
	iverilog -o $@ $^

%_tb.vcd: %_tb
	vvp -N $< +vcd=$@

# -----------------------------------------------------------------------------
# Targets

sim: $(PROJ)_tb.vcd
	open -a Scansion $(PROJ).vcd

flash: $(PROJ).bin
	iceprog $<

clean:
	@echo "\033[0;33mCleaning build...\033[0;0m"
	@rm -f $(PROJ).blif $(PROJ).asc $(PROJ).bin $(PROJ).vcd
