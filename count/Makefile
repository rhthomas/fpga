#-------------------------------------------------------------------------------
# FOSS Verilog Toolchain
#-------------------------------------------------------------------------------
# Author:	Rhys Thomas
# Created:	2018-07-17
# Modified:	2018-07-17
# Version:	1.1		Initial revision, adapted from old Makefile.
#-------------------------------------------------------------------------------

# PROJECT METADATA
PROJ	= project
BUILD	= ./build
IMG		= ./img
DEVICE	= 1k

# FILES
FILES	= top.v
TESTS	= top_tb.v
IMAGE	= $(patsubst %.v, $(IMG)/%.svg, $(FILES))

# BUILD RULES
.PHONY: all clean flash

default: build
all: build draw sim

build:
	@echo "\033[0;33mCreating build folder...\033[0;0m"
	@mkdir -p $(BUILD)
	yosys -p "synth_ice40 -top top -blif $(BUILD)/$(PROJ).blif" $(FILES)
	arachne-pnr -d $(DEVICE) -p icestick.pcf -o $(BUILD)/$(PROJ).asc \
		$(BUILD)/$(PROJ).blif
	icepack $(BUILD)/$(PROJ).asc $(BUILD)/$(PROJ).bin

draw: $(IMAGE)

sim: 
	iverilog -o $(PROJ).vvp $(FILES) $(TESTS)
	vvp $(PROJ).vvp	
	open -a Scansion $(PROJ).vcd

clean:	
	@echo "\033[0;33mCleaning build...\033[0;0m"
	@rm -r $(BUILD) *.vcd *.vvp

flash: $(BUILD)/$(PROJ).bin
	iceprog $^

$(IMG)/%.json: $(FILES)
	@mkdir -p $(IMG)
	yosys -p "prep -top $(basename $(notdir $@)); write_json $@" $^

$(IMG)/%.svg: $(IMG)/%.json
	node ../../netlistsvg/bin/netlistsvg.js $^ -o $@

