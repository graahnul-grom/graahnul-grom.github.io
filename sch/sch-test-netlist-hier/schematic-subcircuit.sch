v 20191003 2
C 18200 24200 1 0 0 symbol-resistor.sym
{
T 18500 24600 5 10 0 0 0 0 1
device=RESISTOR
T 18400 24500 21 10 1 1 0 0 1
refdes=R1
T 18700 24500 5 8 1 1 0 0 1
value=1k
T 18200 24000 1 6 1 0 0 0 1
footprint=ACY500.fp
}
C 16800 24200 1 0 0 symbol-in.sym
{
T 16800 24500 21 10 1 0 0 0 1
refdes=1
T 16800 24700 5 6 1 0 0 0 1
device=DOES_NOT_MATTER
T 16900 23800 5 4 1 1 0 0 5
comment=refdes is set
to pinlabel of
subcircuit symbol
representing this
schematic
}
C 20500 24200 1 0 1 symbol-in.sym
{
T 20500 24700 5 6 1 0 0 6 1
device=DOESNOTMATTER
T 20500 24500 21 10 1 0 0 6 1
refdes=2
}
N 17400 24300 18200 24300 4
N 19900 24300 19100 24300 4
