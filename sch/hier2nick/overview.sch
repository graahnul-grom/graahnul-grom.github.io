v 20191003 2
C -12400 47100 1 0 0 bat_dmn.v.sym
{
T -11800 47500 5 3 0 0 0 0 1
symversion=1.0
T -12200 47200 21 8 1 1 0 0 1
refdes=V1
T -12200 47100 5 6 1 1 0 0 1
value=9V
T -12200 47000 1 6 1 1 0 0 1
footprint=wf02.fp
T -12200 47350 10 5 0 1 0 1 1
sim_i=?
T -12300 47400 5 3 0 0 0 0 1
device=SIMVDC_DMN
}
C -14000 48100 1 0 0 bjtn_dmn.v.sym
{
T -13650 48200 12 6 0 1 0 0 1
model-name=bc547c_sx
T -13600 48750 5 3 0 0 0 1 1
device=BJTN_DMN
T -13200 48500 5 3 0 0 0 0 1
symversion=1.0
T -13650 48300 5 6 1 1 0 0 1
value=bc547c
T -13650 48400 21 8 1 1 0 0 1
refdes=Q1
T -13650 48200 1 6 1 1 0 0 1
footprint=to92.fp
}
N -13700 47700 -13700 48100 4
{
T -13750 48000 6 6 1 1 0 7 1
netname=emitter
}
C -14700 48200 1 0 0 r_dmn.h.sym
{
T -14400 48650 5 3 0 0 0 5 1
device=R_DMN
T -14100 48500 5 3 0 0 0 0 1
symversion=1.0
T -14500 48500 21 8 1 1 0 3 1
refdes=R1
T -14500 48300 5 6 1 1 0 5 1
value=10k
T -14500 48650 1 6 1 1 0 3 1
footprint=r5.fp
}
N -14300 48400 -14000 48400 4
{
T -14150 48450 6 6 1 1 0 3 1
netname=base
}
C -13800 46700 1 0 0 r_dmn.v.sym
{
T -13450 47150 5 3 0 0 0 5 1
device=R_DMN
T -13200 47100 5 3 0 0 0 0 1
symversion=1.0
T -13600 46800 5 6 1 1 0 0 1
value=500
T -13600 46900 21 8 1 1 0 0 1
refdes=R3
T -13600 46700 1 6 1 1 0 0 1
footprint=r5.fp
}
C -13800 47300 1 0 0 r_dmn.v.sym
{
T -13450 47750 5 3 0 0 0 5 1
device=R_DMN
T -13200 47700 5 3 0 0 0 0 1
symversion=1.0
T -13600 47400 5 6 1 1 0 0 1
value=500
T -13600 47500 21 8 1 1 0 0 1
refdes=R2
T -13600 47300 1 6 1 1 0 0 1
footprint=r5.fp
}
N -13700 47100 -13700 47300 4
{
T -13750 47200 6 6 1 1 0 7 1
netname=mid
}
N -13700 46400 -13700 46700 4
N -15600 47300 -15600 48400 4
N -15600 48400 -14700 48400 4
{
T -15150 48450 6 6 1 1 0 3 1
netname=csin
}
N -12300 47300 -12300 48900 4
N -12300 48900 -13700 48900 4
{
T -12700 48950 6 6 1 1 0 3 1
netname=vcc
}
N -13700 48900 -13700 48700 4
C -12400 46100 1 0 0 gnd2_dmn.sym
{
T -11900 46500 5 3 0 0 0 0 1
symversion=1.0
}
N -12300 46300 -12300 47100 4
N -15600 47100 -15600 46400 4
N -15600 46400 -12300 46400 4
T -15700 49000 21 10 1 0 0 0 1
overview.sch
C -15700 47100 1 0 0 bat_dmn.v.sym
{
T -15100 47500 5 3 0 0 0 0 1
symversion=1.0
T -15500 47200 21 8 1 1 0 0 1
refdes=V2
T -15500 47100 5 6 1 1 0 0 1
value=1.5V
T -15500 47000 1 6 1 1 0 0 1
footprint=wf02.fp
T -15500 47350 10 5 0 1 0 1 1
sim_i=?
T -15600 47400 5 3 0 0 0 0 1
device=SIMVDC_DMN
}
B -14100 46600 900 1200 9 0 1 2 50 50 0 -1 -1 -1 -1 -1
B -14800 46500 1800 2300 12 10 1 1 -1 50 0 -1 -1 -1 -1 -1
L -15200 46300 -14800 46600 12 10 1 0 -1 -1
L -14200 46300 -13800 46600 9 10 1 0 -1 -1
T -15200 46200 12 6 1 0 0 6 1
sub-circuit
T -14200 46200 9 6 1 0 0 6 1
sub-sub-circuit
