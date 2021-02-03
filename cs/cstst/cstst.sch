v 20201211 2
C 40000 40000 0 0 0 title_a4_frame_dmn.sym
{
T 51000 47800 5 3 0 0 0 0 1
symversion=1.0
}
C 48800 43100 1 0 0 r_dmn.h.sym
{
T 49100 43550 5 3 0 0 0 5 1
device=R_DMN
T 49000 43400 21 8 1 1 0 3 1
refdes=R1
T 49000 43200 5 6 1 1 0 5 1
value=1k
T 49400 43400 5 3 0 0 0 0 1
symversion=1.0
T 49000 43550 1 6 1 1 0 3 1
footprint=r5.fp
}
C 49600 43100 1 0 0 r_dmn.h.sym
{
T 49900 43550 5 3 0 0 0 5 1
device=R_DMN
T 49800 43400 21 8 1 1 0 3 1
refdes=R2
T 49800 43200 5 6 1 1 0 5 1
value=2k
T 50200 43400 5 3 0 0 0 0 1
symversion=1.0
T 49800 43550 1 6 1 1 0 3 1
footprint=r5.fp
}
C 47500 40400 1 0 0 555_dmn.sym
{
T 47600 41400 21 8 1 1 0 0 1
refdes=DD1
T 48600 41700 5 3 0 0 0 0 1
symversion=1.0
T 48100 41750 5 3 0 0 0 0 1
device=555_DMN
T 47600 41700 12 6 0 1 0 0 1
model-name=ne555_lt
T 47600 41600 1 6 1 1 0 0 1
footprint=dip8.fp
T 47600 41500 5 6 0 1 0 0 1
value=NE555
T 48300 41450 13 5 1 2 0 0 1
graphical=1
}
N 49400 44000 49600 44000 4
N 49200 43300 49600 43300 4
N 50400 44300 51400 44300 4
N 50000 43300 51400 43300 4
{
T 50650 43250 12 6 1 1 0 5 1
sim_v=-1.9999 V
T 50650 43350 6 6 1 1 0 3 1
netname=out
}
N 49600 44600 49400 44600 4
C 51400 42600 1 90 1 gnd2_dmn.sym
{
T 51000 42100 5 3 0 0 270 2 1
symversion=1.0
}
C 47400 42300 1 0 0 siminc_dmn.sym
{
T 47400 42700 5 3 0 0 0 0 1
device=include
T 47500 42500 21 4 1 1 0 4 1
refdes=A1
T 47400 42625 5 3 0 1 0 0 1
file=/home/dmn/ee/mod/all.spmu
T 47500 42375 5 3 1 1 0 5 1
basename=all.spmu
T 48100 42700 5 3 0 0 0 0 1
symversion=1.0
}
C 47400 42700 1 0 0 simopt_numdgt_on_dmn.sym
{
T 47500 42950 5 3 0 0 0 0 1
device=SIMOPT_NUMDGT_DMN
T 47425 42850 21 5 1 1 0 1 1
simopt_numdgt=5
T 48300 43200 5 3 0 0 0 0 1
symversion=1.0
}
C 47400 43000 1 0 0 simcmd_op_on_dmn.sym
{
T 47500 43250 5 3 0 0 0 0 1
device=SIMCMD_OP_DMN
T 48200 43600 5 3 0 0 0 0 1
symversion=1.0
}
C 49600 41700 1 0 1 simvac_dmn.h.sym
{
T 49400 42650 21 8 1 1 0 3 1
refdes=V4
T 49300 42700 5 3 0 0 0 7 1
device=SIMVAC_DMN
T 49300 42600 1 6 1 1 0 6 1
footprint=wf02.fp
T 49300 42400 5 4 0 1 0 6 1
value=sin(0 0.1 10e3 0 0) dc 0 ac 1
T 48900 42100 5 3 0 0 0 6 1
symversion=1.0
T 49600 42100 5 6 0 0 0 6 1
vac_off=0
T 49600 42300 5 6 1 0 0 6 1
vac_vpk=0.1
T 49600 42200 5 6 1 0 0 6 1
vac_f=10e3
T 49600 42000 5 6 0 0 0 6 1
vac_del=0
T 49600 41900 5 6 0 0 0 6 1
vac_damp=0
T 49600 41700 5 6 0 0 0 6 1
vac_ac=1
T 49600 41800 5 6 0 0 0 6 1
vac_dc=0
}
N 50300 42500 49600 42500 4
C 50400 44400 1 0 0 simcmd_tran_on_dmn.sym
{
T 50400 44850 5 3 0 0 0 0 1
device=SIMCMD_TRAN_DMN
T 50650 44750 5 5 1 0 0 1 1
tran_f=10e3
T 50650 44650 5 5 1 0 0 1 1
tran_N=3
T 50650 44550 5 5 1 0 0 1 1
tran_skipN=10
T 50650 44850 5 5 0 0 0 1 1
tran_gran=0.01
T 50650 44950 5 5 0 0 0 1 1
tran_uic=on
T 50400 44450 21 4 0 1 0 1 1
tran_cmdline=1.00e-6 1.30e-3 1.00e-3 uic
T 50500 44725 12 3 1 0 0 3 1
buddy=V4
T 51200 44800 5 3 0 0 0 0 1
symversion=1.0
}
N 50700 42500 51200 42500 4
C 49300 44300 1 0 0 gnd2_dmn.sym
{
T 49800 44700 5 3 0 0 0 0 1
symversion=1.0
}
N 49400 44500 49400 44600 4
N 51400 43300 51400 44300 4
N 49400 44000 49400 43300 4
N 48800 43300 48600 43300 4
N 48600 43300 48600 42500 4
{
T 48650 42900 12 6 1 1 0 1 1
sim_v=1 V
T 48550 42900 6 6 1 1 0 7 1
netname=in
}
N 48600 42500 49200 42500 4
N 49900 43900 49900 44000 4
N 49900 44700 49900 44600 4
B 47500 46600 200 200 6 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
T 47750 47000 21 6 1 1 0 1 1
refdes=refdes
T 47750 46400 6 6 1 1 0 1 1
net=net
T 47750 46700 6 6 1 1 0 1 1
node=node
T 49750 46700 10 6 1 1 0 1 1
sim_i=sim_i
B 47500 46300 200 200 6 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 49500 46600 200 200 10 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 47500 46900 200 200 21 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 49500 46000 200 200 9 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 47500 46000 200 200 6 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 49500 46900 200 200 13 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 49500 45700 200 200 21 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 47500 45700 200 200 1 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 47500 45400 200 200 12 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
T 47750 46100 6 6 1 1 0 1 1
netname=netname
T 49750 46100 9 6 1 1 0 1 1
pinlabel=pinlabel
T 47750 45800 1 6 1 1 0 1 1
footprint=footprint
T 49750 47000 13 6 1 1 0 1 1
source=source
T 49750 45800 21 6 1 1 0 1 1
plotnum=plotnum
T 47750 45500 12 6 1 1 0 1 1
model-name=model-name
B 47500 45100 200 200 17 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
T 47750 45200 17 6 1 1 0 1 1
mods=mods
B 48500 46900 200 200 10 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
T 48750 47000 10 6 1 1 0 1 1
slot=slot
B 48500 46600 200 200 9 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
T 48750 46700 9 6 1 1 0 1 1
slotdef=slotdef
B 48500 46300 200 200 9 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
T 48750 46400 9 6 1 1 0 1 1
msrd=msrd
B 48500 46000 200 200 9 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
T 48750 46100 9 6 1 1 0 1 1
tol=tol
B 48500 45700 200 200 9 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
T 48750 45800 9 6 1 1 0 1 1
manuf=manuf
B 48500 45400 200 200 9 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
T 48750 45500 9 6 1 1 0 1 1
part=part
B 48500 45100 200 200 13 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
T 48750 45200 13 6 1 1 0 1 1
graphical=graphical
B 49500 46300 200 200 12 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
T 49750 46400 12 6 1 1 0 1 1
sim_v=sim_v
B 49500 45400 200 200 12 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
T 49750 45500 12 6 1 1 0 1 1
buddy=buddy
T 51400 48100 9 10 1 0 0 8 1
cstst.sch - test Lepton EDA color schemes
L 47300 48200 47300 40000 5 10 1 0 -1 -1
{
T 47300 40700 5 8 0 0 90 6 1
lock=yes
}
T 51400 47900 9 10 1 1 0 8 1
author=dmn <graahnul.grom@gmail.com>
L 47300 47500 51600 47500 21 10 1 0 -1 -1
{
T 50900 47500 5 8 0 0 180 6 1
lock=yes
}
C 49600 43900 1 0 0 opa2x_tl082.sym
{
T 49700 44700 5 3 0 0 0 1 1
device=OPA_DMN
T 49750 44300 21 8 1 1 0 1 1
refdes=X1
T 49750 44200 10 4 1 0 0 1 1
slot=1
T 50600 44200 5 3 0 0 0 0 1
symversion=1.0
T 50150 43900 1 6 1 1 0 0 1
footprint=dip8.fp
T 50150 44000 12 6 1 1 0 0 1
model-name=tl084_ti
T 50150 44100 5 6 1 1 0 0 1
value=tl082
}
C 49200 41100 1 0 0 bjtp_2n3906.h.sym
{
T 49500 41625 5 3 0 0 0 3 1
device=BJTP_DMN
T 50100 41400 5 3 0 0 0 0 1
symversion=1.0
T 49700 41100 5 6 1 1 0 0 1
value=2n3906
T 49700 41200 21 8 1 1 0 0 1
refdes=Q1
T 49700 40900 1 6 0 1 0 0 1
footprint=to92_dmn.fp
T 49700 41000 12 6 0 1 0 0 1
model-name=2n3906_on
T 49100 41550 13 5 1 2 0 0 1
graphical=1
}
C 48800 40400 1 0 0 mosn_irlml0040.v.sym
{
T 49150 41000 5 3 0 0 0 1 1
device=MOSN_DMN
T 49600 40800 5 3 0 0 0 0 1
symversion=1.0
T 49150 40600 5 6 1 1 0 0 1
value=irlml0040
T 49150 40700 21 8 1 1 0 0 1
refdes=X1
T 49150 40400 1 6 0 1 0 0 1
footprint=sot23.fp
T 49150 40500 12 6 0 1 0 0 1
model-name=irlml0040
T 48875 41200 13 5 1 2 90 6 1
graphical=1
}
N 48100 44000 48100 44200 4
N 48100 43500 48100 43600 4
N 48100 44700 48100 44600 4
C 47900 44200 1 270 0 gnd2_dmn.sym
{
T 48300 43700 5 3 0 0 270 0 1
symversion=1.0
}
L 47300 41900 51600 41900 21 10 1 0 -1 -1
{
T 50900 41900 5 8 0 0 0 0 1
lock=yes
}
C 48000 43000 1 0 0 simplt_on_dmn.sym
{
T 48000 43250 5 3 0 0 0 0 1
device=SIMPLT_DMN
T 48150 43150 21 4 1 1 0 4 1
plotnum=2
T 48600 43500 5 3 0 0 0 0 1
symversion=1.0
T 48000 42900 5 5 1 1 0 1 1
plot_item=v(in)
T 48000 42800 5 5 1 1 0 1 1
plot_item=v(out) + 3
}
C 50700 42100 1 0 1 simvdc_dmn.h.sym
{
T 50500 42650 21 8 1 1 0 3 1
refdes=V3
T 50500 42350 5 6 1 1 0 5 1
value=1V
T 50200 42700 5 3 0 0 0 3 1
device=SIMVDC_DMN
T 50500 42250 10 6 1 1 0 5 1
sim_i=-999.98 µA
T 50200 42400 5 3 0 0 0 6 1
symversion=1.0
T 50600 42600 1 6 1 1 0 0 1
footprint=wf02.fp
}
C 47700 43000 1 0 0 simplt_off_dmn.sym
{
T 47700 43250 5 3 0 0 0 0 1
device=SIMPLT_DMN
T 47850 43150 21 4 1 1 0 4 1
plotnum=1
T 48300 43500 5 3 0 0 0 0 1
symversion=1.0
T 47700 42900 5 5 1 1 0 1 1
plot_item=v(in)
T 47700 42800 5 5 1 1 0 1 1
plot_item=v(out)
}
C 47900 44200 1 0 0 simvdc_dmn.v.sym
{
T 48150 44700 5 3 0 0 0 1 1
device=SIMVDC_DMN
T 48200 44600 1 6 1 1 0 1 1
footprint=wf02.fp
T 47950 44400 10 6 1 1 0 7 1
sim_i=-4.8614 mA
T 48250 44400 21 8 1 1 0 1 1
refdes=V1
T 48250 44275 5 6 1 1 0 1 1
value=5V
T 48600 44300 5 3 0 0 0 0 1
symversion=1.0
}
C 47900 43600 1 0 0 simvdc_dmn.v.sym
{
T 48150 44100 5 3 0 0 0 1 1
device=SIMVDC_DMN
T 48200 44000 1 6 1 1 0 1 1
footprint=wf02.fp
T 47950 43800 10 6 1 1 0 7 1
sim_i=-4.8617 mA
T 48250 43800 21 8 1 1 0 1 1
refdes=V2
T 48250 43675 5 6 1 1 0 1 1
value=5V
T 48600 43700 5 3 0 0 0 0 1
symversion=1.0
}
C 49800 44700 1 0 0 simvm_ort_arrow_dmn.v.sym
{
T 49950 44800 6 5 1 1 0 1 1
node=vcc
T 49950 44750 6 4 0 0 0 2 1
net=vcc:1
T 49900 44900 5 3 0 1 0 1 1
device=SIMVM_DMN
T 50300 45100 5 3 0 0 0 0 1
symversion=1.0
T 49850 44800 12 4 1 1 0 7 1
sim_v=5 V
}
C 49800 43900 1 180 1 simvm_ort_arrow_dmn.v.sym
{
T 49950 43800 6 5 1 1 180 7 1
node=vee
T 49950 43850 6 4 0 0 180 8 1
net=vee:1
T 49900 43700 5 3 0 1 180 7 1
device=SIMVM_DMN
T 50300 43500 5 3 0 0 180 6 1
symversion=1.0
T 49850 43800 12 4 1 1 180 1 1
sim_v=-5 V
}
C 48000 44700 1 0 0 simvm_ort_arrow_dmn.v.sym
{
T 48150 44800 6 5 1 1 0 1 1
node=vcc
T 48150 44750 6 4 0 0 0 2 1
net=vcc:1
T 48100 44900 5 3 0 1 0 1 1
device=SIMVM_DMN
T 48500 45100 5 3 0 0 0 0 1
symversion=1.0
T 48050 44800 12 4 1 1 0 7 1
sim_v=5 V
}
C 48000 43500 1 180 1 simvm_ort_arrow_dmn.v.sym
{
T 48150 43400 6 5 1 1 180 7 1
node=vee
T 48150 43450 6 4 0 0 180 8 1
net=vee:1
T 48100 43300 5 3 0 1 180 7 1
device=SIMVM_DMN
T 48500 43100 5 3 0 0 180 6 1
symversion=1.0
T 48050 43400 12 4 1 1 180 1 1
sim_v=-5 V
}
B 40100 47600 600 500 0 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 40100 47600 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 40800 48000 5 10 1 1 0 1 1
background=0: background = #002b36
T 40800 47700 0 10 1 1 0 1 1
background=0: background = #002b36
B 40100 47000 600 500 1 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 40100 47000 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 40800 47400 5 10 1 1 0 1 1
pin=1: pin = #c18f5f
T 40800 47100 1 10 1 1 0 1 1
pin=1: pin = #c18f5f
B 40100 46300 600 500 2 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 40100 46300 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 40800 46700 5 10 1 1 0 1 1
net-endpoint=2: net-endpoint = #00b330
T 40800 46400 2 10 1 1 0 1 1
net-endpoint=2: net-endpoint = #00b330
B 40100 45600 600 500 3 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 40100 45600 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 40800 46000 5 10 1 1 0 1 1
graphic=3: graphic = #cc9d47
T 40800 45700 3 10 1 1 0 1 1
graphic=3: graphic = #cc9d47
B 40100 44900 600 500 4 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 40100 44900 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 40800 45300 5 10 1 1 0 1 1
net=4: net = #bebebe
T 40800 45000 4 10 1 1 0 1 1
net=4: net = #bebebe
B 40100 44200 600 500 5 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 40100 44200 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 40800 44600 5 10 1 1 0 1 1
attribute=5: attribute = #ababab
T 40800 44300 5 10 1 1 0 1 1
attribute=5: attribute = #ababab
B 40100 43500 600 500 6 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 40100 43500 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 40800 43900 5 10 1 1 0 1 1
logic-bubble=6: logic-bubble = #ef653b
T 40800 43600 6 10 1 1 0 1 1
logic-bubble=6: logic-bubble = #ef653b
B 40100 42800 600 500 7 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 40100 42800 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 40800 43200 5 10 1 1 0 1 1
dots-grid=7: dots-grid = #006680
T 40800 42900 7 10 1 1 0 1 1
dots-grid=7: dots-grid = #006680
B 40100 42100 600 500 8 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 40100 42100 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 40800 42500 5 10 1 1 0 1 1
detached-attribute=8: detached-attribute = #ef5121
T 40800 42200 8 10 1 1 0 1 1
detached-attribute=8: detached-attribute = #ef5121
B 40100 41400 600 500 9 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 40100 41400 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 40800 41800 5 10 1 1 0 1 1
text=9: text = #00a2cc
T 40800 41500 9 10 1 1 0 1 1
text=9: text = #00a2cc
B 40100 40700 600 500 10 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 40100 40700 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 40800 41100 5 10 1 1 0 1 1
bus=10: bus = #26c3d9
T 40800 40800 10 10 1 1 0 1 1
bus=10: bus = #26c3d9
B 40100 40100 600 500 11 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 40100 40100 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 40800 40500 5 10 1 1 0 1 1
select=11: select = #c7ec10
T 40800 40200 11 10 1 1 0 1 1
select=11: select = #c7ec10
B 43600 47600 600 500 12 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 43600 47600 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 44300 48000 5 10 1 1 0 1 1
bounding-box=12: bounding-box = #76e665
T 44300 47700 12 10 1 1 0 1 1
bounding-box=12: bounding-box = #76e665
B 43600 47000 600 500 13 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 43600 47000 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 44300 47400 5 10 1 1 0 1 1
zoom-box=13: zoom-box = #ff94e9
T 44300 47100 13 10 1 1 0 1 1
zoom-box=13: zoom-box = #ff94e9
B 43600 46300 600 500 14 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 43600 46300 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 44300 46700 5 10 1 1 0 1 1
stroke=14: stroke = #ffe5b5
T 44300 46400 14 10 1 1 0 1 1
stroke=14: stroke = #ffe5b5
B 43600 45600 600 500 15 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 43600 45600 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 44300 46000 5 10 1 1 0 1 1
lock=15: lock = #919191
T 44300 45700 15 10 1 1 0 1 1
lock=15: lock = #919191
B 43600 44900 600 500 16 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 43600 44900 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 44300 45300 5 10 1 1 0 1 1
output-background=16: output-background = #d7e842
T 44300 45000 16 10 1 1 0 1 1
output-background=16: output-background = #d7e842
B 43600 44200 600 500 17 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 43600 44200 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 44300 44600 5 10 1 1 0 1 1
freestyle1=17: freestyle1 = #97a547
T 44300 44300 17 10 1 1 0 1 1
freestyle1=17: freestyle1 = #97a547
B 43600 43500 600 500 18 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 43600 43500 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 44300 43900 5 10 1 1 0 1 1
freestyle2=18: freestyle2 = #c18f5f
T 44300 43600 18 10 1 1 0 1 1
freestyle2=18: freestyle2 = #c18f5f
B 43600 42800 600 500 19 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 43600 42800 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 44300 43200 5 10 1 1 0 1 1
freestyle3=19: freestyle3 = #ca5d31
T 44300 42900 19 10 1 1 0 1 1
freestyle3=19: freestyle3 = #ca5d31
B 43600 42100 600 500 20 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 43600 42100 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 44300 42500 5 10 1 1 0 1 1
freestyle4=20: freestyle4 = #76e665
T 44300 42200 20 10 1 1 0 1 1
freestyle4=20: freestyle4 = #76e665
B 43600 41400 600 500 21 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 43600 41400 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 44300 41800 5 10 1 1 0 1 1
junction=21: junction = #ffffff
T 44300 41500 21 10 1 1 0 1 1
junction=21: junction = #ffffff
B 43600 40700 600 500 22 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 43600 40700 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 44300 41100 5 10 1 1 0 1 1
mesh-grid-major=22: mesh-grid-major = #003947
T 44300 40800 22 10 1 1 0 1 1
mesh-grid-major=22: mesh-grid-major = #003947
B 43600 40100 600 500 23 10 1 0 -1 -1 1 -1 -1 -1 -1 -1
B 43600 40100 600 500 5 10 1 0 -1 -1 0 -1 -1 -1 -1 -1
T 44300 40500 5 10 1 1 0 1 1
mesh-grid-minor=23: mesh-grid-minor = #003240
T 44300 40200 23 10 1 1 0 1 1
mesh-grid-minor=23: mesh-grid-minor = #003240
