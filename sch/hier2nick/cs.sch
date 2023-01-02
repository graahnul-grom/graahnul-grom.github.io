v 20220529 2
C 16400 17100 1 0 0 bjtn_dmn.v.sym
{
T 16750 17300 5 6 1 1 0 0 1
value=bc547c
T 16750 17400 21 8 1 1 0 0 1
refdes=Q1
T 16750 17200 1 6 1 1 0 0 1
footprint=to92.fp
T 16750 17200 12 6 0 1 0 0 1
model-name=bc547c_sx
T 16800 17750 5 3 0 0 0 1 1
device=BJTN_DMN
T 17200 17500 5 3 0 0 0 0 1
symversion=1.0
}
N 17100 17900 16700 17900 4
C 15400 17300 1 0 1 in_dmn.sym
{
T 14900 17700 5 3 0 0 0 6 1
symversion=1.0
T 15200 17400 21 6 1 1 0 7 1
refdes=ctl
T 15400 17500 5 3 0 0 0 6 1
device=IN_DMN
}
C 17100 17800 1 0 0 out_dmn.sym
{
T 17600 18200 5 3 0 0 0 0 1
symversion=1.0
T 17300 17900 21 6 1 1 0 1 1
refdes=plus
}
N 16700 16900 16700 17100 4
{
T 16650 17000 6 6 1 1 0 7 1
netname=emitter
}
N 17100 15900 16700 15900 4
C 15700 17200 1 0 0 r_dmn.h.sym
{
T 16000 17650 5 3 0 0 0 5 1
device=R_DMN
T 15900 17500 21 8 1 1 0 3 1
refdes=R1
T 15900 17300 5 6 1 1 0 5 1
value=10k
T 16300 17500 5 3 0 0 0 0 1
symversion=1.0
T 15900 17650 1 6 1 1 0 3 1
footprint=r5.fp
}
N 16100 17400 16400 17400 4
{
T 16250 17450 6 6 1 1 0 3 1
netname=base
}
N 15400 17400 15700 17400 4
{
T 15550 17450 6 6 1 1 0 3 1
netname=in
}
N 16700 16100 16700 15900 4
{
T 16650 16000 6 6 1 1 0 7 1
netname=tmp
}
C 17100 15800 1 0 0 out_dmn.sym
{
T 17600 16200 5 3 0 0 0 0 1
symversion=1.0
T 17300 15900 21 6 1 1 0 1 1
refdes=minus
}
C 16400 16100 1 0 0 rr.sym
{
T 17050 16500 13 6 1 0 0 0 1
source=rr.sch
T 17050 16600 21 8 1 1 0 0 1
refdes=U2
}
N 16700 17900 16700 17700 4
{
T 16650 17800 6 6 1 1 0 7 1
netname=collector
}
B 14700 15700 4000 3100 15 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
B 17500 18400 1100 300 15 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 17800 18500 21 12 1 0 0 0 1
cs.sch
B 14800 18350 1450 350 5 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
B 14900 18600 100 50 21 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 14900 18400 100 50 6 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 14900 18500 100 50 9 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 15600 18400 100 50 1 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 15600 18600 100 50 13 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 15600 18500 100 50 5 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
T 15050 18600 21 6 1 1 0 0 1
refdes
T 15050 18400 6 6 1 1 0 0 1
netname
T 15050 18500 9 6 1 1 0 0 1
pinlabel
T 15750 18400 1 6 1 1 0 0 1
footprint
T 15750 18600 13 6 1 1 0 0 1
source
T 15750 18500 5 6 1 1 0 0 1
value
