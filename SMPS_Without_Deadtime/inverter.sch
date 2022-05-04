v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N -1230 -2500 -1230 -2470 {
lab=Vo}
N -1270 -2530 -1270 -2440 {
lab=Vg}
N -1230 -2580 -1230 -2560 {
lab=VDD}
N -1230 -2410 -1230 -2390 {
lab=GND}
N -1230 -2440 -1220 -2440 {
lab=GND}
N -1230 -2530 -1210 -2530 {
lab=VDD}
N -1230 -2480 -1210 -2480 {
lab=Vo}
N -1290 -2480 -1270 -2480 {
lab=Vg}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} -1250 -2530 0 0 {name=M2
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} -1250 -2440 0 0 {name=M1
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/vdd.sym} -1230 -2580 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -1230 -2390 0 0 {name=l2 lab=GND}
C {devices/code.sym} -1480 -2580 0 0 {name=MODELS 
only_toplevel=true 
format="tcleval( @value )"
value=".lib $::SKYWATER_MODELS/sky130.lib.spice tt"}
C {devices/code_shown.sym} -1470 -2410 0 0 {name="input sweep"
only_toplevel=true
value=
".dc V2 0 3 0.1
.tran 1ns 100ns
.save all"}
C {devices/vdd.sym} -1210 -2530 1 0 {name=l5 lab=VDD}
C {devices/gnd.sym} -1220 -2440 3 0 {name=l6 lab=GND}
C {devices/opin.sym} -1210 -2480 0 0 {name=p1 lab=Vo}
C {devices/ipin.sym} -1280 -2480 0 0 {name=p2 lab=Vg}
