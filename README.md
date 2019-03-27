# fpga

Experimenting with FPGA open-source toolchains.

## Tools
The FPGA that is developed on is the [iCEstick](https://www.latticesemi.com/icestick) from Lattice Semiconductor.

This expands on other FPGA open-source tools such as [icestorm](http://www.clifford.at/icestorm/) and [iverilog](http://iverilog.icarus.com/) among others.

A quick script is used to generate the directory structure for new modules, simply run `perl create.pl <module> <project>` to create a folder with all the necessary files.
If the project is the same as the module name (i.e. you're creating a small sub-module) the project field can be omitted.

```
> perl create.pl module project
Creating module module files.
 +- module/Makefile
 +- module/module.sv
 +- module/module_tb.sv
 +- module/icestick.pcf
```

## Builds
<details>
	<summary><a href="./adder">adder</a> : Simple adder module.</summary>
	<img src="./adder/adder.svg">
</details>
<details>
	<summary><a href="./count">count</a> : Binary counter.</summary>
	<img src="./count/top.svg">
</details>
<details>
	<summary><a href="./dance">dance</a> : LED pattern display.</summary>
	<img src="./dance/dance.svg">
</details>

## Requirements
### IceStorm
```
git clone https://github.com/cliffordwolf/icestorm.git icestorm
cd icestorm
make
sudo make install
```

### Arachne-PNR
```
git clone https://github.com/cseed/arachne-pnr.git arachne-pnr
cd arachne-pnr
make
sudo make install
```

### Yosys
```
git clone https://github.com/cliffordwolf/yosys.git yosys
cd yosys
make
sudo make install
```

### Netlistsvg (RTL netlist diagrams)
More information given [here](https://github.com/nturley/netlistsvg).
```
(install nodejs)
git clone https://github.com/nturley/netlistsvg
cd netlistsvg
npm install -g
```

### iVerilog (simulations)
#### macOS
```
brew install icarus-verilog
```

### Scansion (VCD viewer for macOS)
Download [here](http://www.logicpoet.com/scansion/).
