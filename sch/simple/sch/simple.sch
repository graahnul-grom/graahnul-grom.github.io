v 20220529 2
C 40800 41500 1 0 0 vdc-1.sym
{
T 41500 42000 21 10 1 1 0 0 1
refdes=V1
T 41500 42350 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 41400 41800 5 8 1 0 0 0 1
value=DC 1V
T 41400 41600 1 8 1 0 0 0 1
footprint=HEADER2_1.fp
}
N 41800 42800 41100 42800 4
{
T 41450 42850 6 8 1 1 0 3 1
netname=vcc
}
N 44400 42800 45300 42800 4
C 41000 41000 1 0 0 gnd-1.sym
N 43500 42800 42700 42800 4
{
T 43100 42850 6 8 1 1 0 3 1
netname=mid
}
N 41100 41300 41100 41500 4
N 45300 42800 45300 41400 4
N 45300 41400 41100 41400 4
N 41100 42800 41100 42700 4
C 41800 42700 1 0 0 resistor-1.sym
{
T 42100 43100 5 10 0 0 0 0 1
device=RESISTOR
T 42000 43000 5 10 1 1 0 0 1
refdes=R1
T 42000 42500 5 8 1 0 0 0 1
value=500
T 42000 42300 1 8 1 0 0 0 1
footprint=1206.fp
T 42000 43400 5 10 0 0 0 0 1
symversion=0.1
}
C 43500 42700 1 0 0 resistor-1.sym
{
T 43800 43100 5 10 0 0 0 0 1
device=RESISTOR
T 43700 43000 5 10 1 1 0 0 1
refdes=R2
T 43700 42500 5 8 1 0 0 0 1
value=500
T 43700 42300 1 8 1 0 0 0 1
footprint=1206.fp
T 43700 43400 5 10 0 0 0 0 1
symversion=0.1
}
