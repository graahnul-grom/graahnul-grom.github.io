v 20191003 2
C 41800 42600 1 0 0 EMBEDDEDresistor-1.sym
[
L 42400 42800 42300 42600 3 0 0 0 -1 -1
L 42300 42600 42200 42800 3 0 0 0 -1 -1
L 42200 42800 42100 42600 3 0 0 0 -1 -1
L 42100 42600 42000 42800 3 0 0 0 -1 -1
T 42100 43000 5 10 0 0 0 0 1
device=RESISTOR
L 42400 42800 42500 42600 3 0 0 0 -1 -1
L 42500 42600 42550 42700 3 0 0 0 -1 -1
P 42700 42700 42550 42700 1 0 0
{
T 42600 42750 5 8 0 1 0 0 1
pinnumber=2
T 42600 42750 5 8 0 0 0 0 1
pinseq=2
T 42600 42750 5 8 0 1 0 0 1
pinlabel=2
T 42600 42750 5 8 0 1 0 0 1
pintype=pas
}
P 41800 42700 41952 42700 1 0 0
{
T 41900 42750 5 8 0 1 0 0 1
pinnumber=1
T 41900 42750 5 8 0 0 0 0 1
pinseq=1
T 41900 42750 5 8 0 1 0 0 1
pinlabel=1
T 41900 42750 5 8 0 1 0 0 1
pintype=pas
}
L 42001 42800 41950 42700 3 0 0 0 -1 -1
T 42000 42900 8 10 0 1 0 0 1
refdes=R?
T 41800 42600 8 10 0 1 0 0 1
pins=2
T 41800 42600 8 10 0 1 0 0 1
class=DISCRETE
]
{
T 42100 43000 5 10 0 0 0 0 1
device=RESISTOR
T 42100 42900 21 10 1 1 0 0 1
refdes=R1
T 41800 42400 1 6 1 0 0 0 1
footprint=1206.fp
T 41800 42500 5 6 1 0 0 0 1
value=500
}
C 44000 42400 1 0 0 EMBEDDEDgnd-1.sym
[
P 44100 42500 44100 42700 1 0 1
{
T 44158 42561 5 4 0 1 0 0 1
pinnumber=1
T 44158 42561 5 4 0 0 0 0 1
pinseq=1
T 44158 42561 5 4 0 1 0 0 1
pinlabel=1
T 44158 42561 5 4 0 1 0 0 1
pintype=pwr
}
L 44000 42500 44200 42500 3 0 0 0 -1 -1
L 44055 42450 44145 42450 3 0 0 0 -1 -1
L 44080 42410 44120 42410 3 0 0 0 -1 -1
T 44300 42450 8 10 0 0 0 0 1
net=GND:1
]
C 40800 41500 1 0 0 EMBEDDEDvdc-1.sym
[
T 41500 42150 8 10 0 1 0 0 1
refdes=V?
T 41500 42350 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 41500 42550 5 10 0 0 0 0 1
footprint=none
T 41500 42750 5 10 0 0 0 0 1
numslots=0
T 41500 42950 5 10 0 0 0 0 1
description=dc power source
P 41100 42700 41100 42400 1 0 0
{
T 41150 42500 5 8 1 1 0 0 1
pinnumber=1
T 41150 42500 5 8 0 1 0 2 1
pinseq=1
T 41100 42350 9 8 1 1 0 5 1
pinlabel=+
T 41100 42200 5 8 0 1 0 5 1
pintype=pwr
}
P 41100 41500 41100 41800 1 0 0
{
T 41150 41600 5 8 1 1 0 0 1
pinnumber=2
T 41150 41600 5 8 0 1 0 2 1
pinseq=2
T 41100 41850 9 8 1 1 0 3 1
pinlabel=-
T 41100 42000 5 8 0 1 0 3 1
pintype=pwr
}
V 41100 42100 300 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
L 40975 42125 41225 42125 3 0 0 0 -1 -1
L 40975 42075 41225 42075 3 0 0 0 -1 -1
T 41500 41950 5 10 0 1 0 0 1
value=DC 1V
]
{
T 41500 42150 21 10 1 1 0 0 1
refdes=V1
T 41500 42350 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 41500 41950 5 6 1 0 0 0 1
value=DC 1V
T 41400 41800 1 6 1 0 0 0 1
footprint=HEADER2_1.fp
}
N 41800 42700 41100 42700 4
{
T 41450 42750 6 6 1 1 0 3 1
netname=vcc
}
N 44000 42700 44100 42700 4
C 41000 41200 1 0 0 EMBEDDEDgnd-1.sym
[
P 41100 41300 41100 41500 1 0 1
{
T 41158 41361 5 4 0 1 0 0 1
pinnumber=1
T 41158 41361 5 4 0 0 0 0 1
pinseq=1
T 41158 41361 5 4 0 1 0 0 1
pinlabel=1
T 41158 41361 5 4 0 1 0 0 1
pintype=pwr
}
L 41000 41300 41200 41300 3 0 0 0 -1 -1
L 41055 41250 41145 41250 3 0 0 0 -1 -1
L 41080 41210 41120 41210 3 0 0 0 -1 -1
T 41300 41250 8 10 0 0 0 0 1
net=GND:1
]
C 43100 42600 1 0 0 EMBEDDEDresistor-1.sym
[
L 43700 42800 43600 42600 3 0 0 0 -1 -1
L 43600 42600 43500 42800 3 0 0 0 -1 -1
L 43500 42800 43400 42600 3 0 0 0 -1 -1
L 43400 42600 43300 42800 3 0 0 0 -1 -1
T 43400 43000 5 10 0 0 0 0 1
device=RESISTOR
L 43700 42800 43800 42600 3 0 0 0 -1 -1
L 43800 42600 43850 42700 3 0 0 0 -1 -1
P 44000 42700 43850 42700 1 0 0
{
T 43900 42750 5 8 0 1 0 0 1
pinnumber=2
T 43900 42750 5 8 0 0 0 0 1
pinseq=2
T 43900 42750 5 8 0 1 0 0 1
pinlabel=2
T 43900 42750 5 8 0 1 0 0 1
pintype=pas
}
P 43100 42700 43252 42700 1 0 0
{
T 43200 42750 5 8 0 1 0 0 1
pinnumber=1
T 43200 42750 5 8 0 0 0 0 1
pinseq=1
T 43200 42750 5 8 0 1 0 0 1
pinlabel=1
T 43200 42750 5 8 0 1 0 0 1
pintype=pas
}
L 43301 42800 43250 42700 3 0 0 0 -1 -1
T 43300 42900 8 10 0 1 0 0 1
refdes=R?
T 43100 42600 8 10 0 1 0 0 1
pins=2
T 43100 42600 8 10 0 1 0 0 1
class=DISCRETE
]
{
T 43400 43000 5 10 0 0 0 0 1
device=RESISTOR
T 43400 42900 21 10 1 1 0 0 1
refdes=R2
T 43100 42400 1 6 1 0 0 0 1
footprint=1206.fp
T 43100 42500 5 6 1 0 0 0 1
value=500
}
N 43100 42700 42700 42700 4
{
T 42900 42750 6 6 1 1 0 3 1
netname=mid
}
