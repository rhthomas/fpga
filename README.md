# fpga
Experimenting with FPGA open-source toolchains.

## Tools

The FPGA that is developed on is the [iCEstick](www.latticesemi.com/icestick)
from Lattice Semiconductor.

The device is programmed using the on-board FTDI interface, and the
[apio](https://github.com/FPGAwars/apio) ecosystem project. This expands on
other FPGA open-source tools such as
[icestorm](http://www.clifford.at/icestorm/) and
[iverilog](http://iverilog.icarus.com/) among others.

## Builds

<details>
	<summary><a href="./count">count</a> : Binary counter.</summary>
	<img src="count/img/top.svg">
</details>
<details>
	<summary><a href="./adder">adder</a> : Simple adder module.</summary>
	<img src="adder/img/top.svg">
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

### Netlistsvg (module diagrams)

*More information given [here](https://github.com/nturley/netlistsvg).*
```
(install nodejs)
git clone https://github.com/nturley/netlistsvg
cd netlistsvg
npm install
```

### iVerilog (simulations)

#### macOS
```
brew install icarus-verilog
```

### Scansion (VCD viewer for macOS)

Download [here](http://www.logicpoet.com/scansion/).
