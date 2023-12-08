# CPU
The CPU is the main entrypoint for all of the code. Here the constants, registers, and memory are defined. On every positive edge of the clock or positive edge of the reset the pipeline runs. Starting with fetch then decode then execute then memory and finally write back.

## Constants 
The constants for word size, memory size, number of blocks, and block size were dervied from the assignment reqirements pdf file. This also includes the cache size of 40k.

## Registers
In this section of the code we are defining the registers that will be used throughout the cpu.


## Clock
On every rising edge of the clock or reset signal a cycle in the CPU is triggered running thorugh the entire pipeline. First, we call the fetch moducle to get the instruction from memory into the IR. Then the decoder module decodes the IR into an OP_code and the data value. From here the execute module runs the given instruction based of the OP_code and value data. Then the memory module is called to load or store from the main memory. Finally the write back module is called to write the data back to a register.