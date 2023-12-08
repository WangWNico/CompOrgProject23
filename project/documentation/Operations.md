# Operations
We made each operation its own file based off of the Table 1 opeartions.

## add X
Addition works by takking in the 16 bit input address X and runs on the postive edge of the clock cylce or reset. If the triger is from reset then the MAR and MBR are zeroed out. Otherwise the memory location at X is assigned into the MAR. The contents of the MAR is read and stored into the MBR where it's finally written into the AC.

## halt


## load X

## store X

## clear (incomplete???)
If the positive edge of the reset signal is triggered then reset the contends of the AC are zeroed out. Otherwise

## skip C

## jump X