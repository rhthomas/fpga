# Dance

Example program to flash a pattern on the 5 on-board LEDs.

* **[div.v](./div.v)**: 2^N clock divider.
* **[mem.v](./mem.v)**: ROM memory module, contains LED sequence.
* **[pc.v](./pc.v)**: Program counter, selects the address from ROM to output.
* **[top.v](./top.v)**: Top level module.
* **[top_tb.v](./top_tb.v)**: Top level testbench.
