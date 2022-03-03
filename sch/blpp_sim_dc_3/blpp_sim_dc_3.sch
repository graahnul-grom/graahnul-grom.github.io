v 20211219 2
C 47300 43900 1 0 0 simcmd_op_on_dmn.sym
{
T 47400 44150 5 3 0 0 0 0 1
device=SIMCMD_OP_DMN
T 48100 44500 5 3 0 0 0 0 1
symversion=1.0
}
C 47300 42000 1 0 0 simvdc_dmn.v.sym
{
T 47550 42500 5 3 0 0 0 1 1
device=SIMVDC_DMN
T 47600 42400 1 6 0 1 0 1 1
footprint=wf02.fp
T 47350 42200 10 6 1 1 0 7 1
sim_i=-1.06 mA
T 47650 42200 17 8 1 1 0 1 1
refdes=Vcc
T 47650 42075 5 6 1 1 0 1 1
value=5V
T 48000 42100 5 3 0 0 0 0 1
symversion=1.0
}
C 44800 43000 1 0 0 r_dmn.v.sym
{
T 45150 43450 5 3 0 0 0 5 1
device=R_DMN
T 45400 43400 5 3 0 0 0 0 1
symversion=1.0
T 45000 43100 5 6 1 1 0 0 1
value=2.4k
T 45000 43200 17 8 1 1 0 0 1
refdes=R2
T 45000 43000 1 6 0 1 0 0 1
footprint=r5.fp
}
C 44800 40800 1 0 0 r_dmn.v.sym
{
T 45150 41250 5 3 0 0 0 5 1
device=R_DMN
T 45400 41200 5 3 0 0 0 0 1
symversion=1.0
T 45000 40900 5 6 1 1 0 0 1
value=1.2k
T 45000 41000 17 8 1 1 0 0 1
refdes=R3
T 45000 40800 1 6 0 1 0 0 1
footprint=r5.fp
}
C 44600 41600 1 0 0 bjtn_2n3904.v.sym
{
T 44950 41800 5 6 1 1 0 0 1
value=2n3904
T 44950 41900 17 8 1 1 0 0 1
refdes=Q1
T 44950 41600 1 6 0 1 0 0 1
footprint=to92_dmn.fp
T 44950 41700 12 6 1 1 0 0 1
model-name=2n3904_on
T 45000 42250 5 3 0 0 0 1 1
device=BJTN_DMN
T 45400 42000 5 3 0 0 0 0 1
symversion=1.0
}
N 44900 41200 44900 41600 4
{
T 44950 41400 12 6 1 1 0 1 1
sim_v=-713 mV
T 44850 41400 6 6 1 1 0 7 1
netname=emitter
}
N 44900 42700 44900 42200 4
{
T 44950 42400 12 6 1 1 0 1 1
sim_v=2.448 V
T 44850 42400 6 6 1 1 0 7 1
netname=collector
}
C 47300 41400 1 0 0 simvdc_dmn.v.sym
{
T 47550 41900 5 3 0 0 0 1 1
device=SIMVDC_DMN
T 47600 41800 1 6 0 1 0 1 1
footprint=wf02.fp
T 47350 41600 10 6 1 1 0 7 1
sim_i=-1.07 mA
T 47650 41600 17 8 1 1 0 1 1
refdes=Vee
T 47650 41475 5 6 1 1 0 1 1
value=2V
T 48000 41500 5 3 0 0 0 0 1
symversion=1.0
}
C 47200 42000 1 270 0 gnd2_dmn.sym
{
T 47600 41500 5 3 0 0 270 0 1
symversion=1.0
}
N 47500 41800 47500 42000 4
N 47400 41900 47500 41900 4
N 47500 42400 47500 43500 4
N 47500 43500 44900 43500 4
{
T 47150 43450 12 6 1 1 0 5 1
sim_v=5 V
T 47150 43550 6 6 1 1 0 3 1
netname=vcc
}
N 44900 43500 44900 43400 4
N 47500 41400 47500 40700 4
N 47500 40700 44900 40700 4
{
T 47150 40650 12 6 1 1 0 5 1
sim_v=-2 V
T 47150 40750 6 6 1 1 0 3 1
netname=vee
}
N 44900 40700 44900 40800 4
N 43200 41900 42500 41900 4
{
T 44200 41850 12 6 1 1 0 5 1
sim_v=-90.5 mV
T 44200 41950 6 6 1 1 0 3 1
netname=base
}
C 42500 43900 1 0 0 simdir_dmn.sym
{
T 42750 43900 5 6 1 0 0 0 1
value=.include ../../mod/2n3904_on.sp
T 42500 44150 5 6 1 0 0 0 1
device=directive
T 42750 44000 17 8 1 1 0 0 1
refdes=A1
T 43700 44400 5 3 0 0 0 0 1
symversion=1.0
}
C 42400 41300 1 0 0 r_dmn.v.sym
{
T 42750 41750 5 3 0 0 0 5 1
device=R_DMN
T 43000 41700 5 3 0 0 0 0 1
symversion=1.0
T 42600 41400 5 6 1 1 0 0 1
value=10k
T 42600 41500 17 8 1 1 0 0 1
refdes=R1
T 42600 41300 1 6 0 1 0 0 1
footprint=r5.fp
}
N 42500 41900 42500 41700 4
C 42400 41000 1 0 0 gnd2_dmn.sym
{
T 42900 41400 5 3 0 0 0 0 1
symversion=1.0
}
N 42500 41200 42500 41300 4
C 43200 41700 1 0 0 simam_x_dmn.h.sym
{
T 43300 41975 17 3 0 1 0 3 1
refdes=va1
T 43300 41850 10 6 1 1 0 5 1
sim_i=9.053 µA
T 43300 42150 5 3 0 0 0 3 1
device=SIMAM_DMN
T 43300 42050 1 4 0 1 0 3 1
footprint=pls2.fp
T 43350 41950 5 2 0 1 0 1 1
value=0
T 43600 42200 5 3 0 0 0 0 1
symversion=1.0
}
C 44800 42700 1 0 0 simam_x_dmn.v.sym
{
T 44950 42800 10 6 1 1 0 1 1
sim_i=1.063 mA
T 44950 42725 17 3 0 1 0 1 1
refdes=va2
T 44950 42900 1 4 0 1 0 1 1
footprint=pls2.fp
T 44950 43000 5 3 0 0 0 1 1
device=SIMAM_DMN
T 44875 42750 5 2 0 1 0 7 1
value=0
T 45400 43100 5 3 0 0 0 0 1
symversion=1.0
}
N 43400 41900 44600 41900 4
N 44900 42900 44900 43000 4
T 42500 43100 17 8 1 0 0 0 1
TODO
L 42500 43050 44000 43050 17 10 1 0 -1 -1
T 42500 43000 9 6 1 0 0 2 6
Create a new symbol:
- device: directive
- path
- value: .include + path
(calculated on sync)
Convert relative paths.
T 42500 43800 9 6 1 0 0 2 3
- Relative to .sim/blpp_sim_dc_3.sch/
- ngspice includes are relative to the
netlist file location.
