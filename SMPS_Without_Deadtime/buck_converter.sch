v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 3520 -1640 3520 -1620 {
lab=VDD}
N 3520 -1410 3520 -1390 {
lab=GND}
N 3800 -1460 3800 -1440 {
lab=#net1}
N 3800 -1380 3800 -1370 {
lab=GND}
N 2140 -1670 2140 -1640 {
lab=GND}
N 3520 -1590 3540 -1590 {
lab=VDD}
N 3520 -1440 3550 -1440 {
lab=GND}
N 3170 -1650 3170 -1630 {
lab=#net2}
N 3310 -1650 3310 -1630 {
lab=#net3}
N 3150 -1430 3150 -1410 {
lab=#net4}
N 3330 -1430 3330 -1410 {
lab=#net5}
N 3270 -1680 3270 -1600 {
lab=#net2}
N 3130 -1680 3130 -1600 {
lab=#net6}
N 3110 -1460 3110 -1380 {
lab=#net6}
N 3290 -1460 3290 -1380 {
lab=#net4}
N 3310 -1640 3480 -1640 {
lab=#net3}
N 3480 -1640 3480 -1590 {
lab=#net3}
N 3330 -1420 3480 -1420 {
lab=#net5}
N 3480 -1440 3480 -1420 {
lab=#net5}
N 3170 -1640 3270 -1640 {
lab=#net2}
N 3150 -1420 3290 -1420 {
lab=#net4}
N 2830 -1640 2830 -1550 {
lab=#net6}
N 2830 -1640 3130 -1640 {
lab=#net6}
N 3020 -1640 3020 -1420 {
lab=#net6}
N 3020 -1420 3110 -1420 {
lab=#net6}
N 3150 -1460 3160 -1460 {
lab=VDD}
N 3150 -1380 3160 -1380 {
lab=GND}
N 3330 -1460 3340 -1460 {
lab=VDD}
N 3330 -1380 3340 -1380 {
lab=GND}
N 3170 -1680 3180 -1680 {
lab=VDD}
N 3170 -1600 3180 -1600 {
lab=GND}
N 3310 -1680 3320 -1680 {
lab=VDD}
N 3310 -1600 3320 -1600 {
lab=GND}
N 3750 -1520 3800 -1520 {
lab=#net7}
N 3520 -1500 3520 -1470 {
lab=#net8}
N 3520 -1480 3570 -1480 {
lab=#net8}
N 3570 -1520 3570 -1480 {
lab=#net8}
N 3920 -1520 3960 -1520 {
lab=vout}
N 3960 -1520 4000 -1520 {
lab=vout}
N 3800 -1520 3860 -1520 {
lab=#net7}
N 3960 -1460 3960 -1430 {
lab=GND}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 3500 -1590 0 0 {name=M1
L=0.5
W=20
nf=1
mult=900
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 3500 -1440 0 0 {name=M2
L=0.5
W=20
nf=1
mult=550
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/vdd.sym} 3520 -1640 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 3520 -1390 0 0 {name=l2 lab=GND}
C {devices/ind.sym} 3600 -1520 3 1 {name=L1
m=1
value=4.7u
footprint=1206
device=inductor}
C {devices/res.sym} 3720 -1520 3 1 {name=R1
value=10.1m
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 3800 -1490 0 0 {name=C1
m=1
value=1u
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 3800 -1410 0 0 {name=R2
value=0.002
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 3800 -1370 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 2830 -1520 0 0 {name=Vgate value=" PULSE (0 3.6 0u 2p 2p 0.35u 1u)"}
C {devices/code.sym} 1810 -1780 0 0 {name=MODELS 
only_toplevel=true 
format="tcleval( @value )"
value=" .lib $::SKYWATER_MODELS/sky130.lib.spice tt"}
C {devices/code_shown.sym} 1830 -1550 0 0 {name= tran analysis only_toplevel=true value=".tran 1u 200u
.save all


.control
run 
meas tran idd_avg INTEG i(Vsourcei) from=110u to=111u
meas tran iout_avg INTEG i(Viout) from=110u to=111u
meas tran vout_avg INTEG v(vout) from=110u to=111u
meas tran vout_max MAX v(vout) from=110u to=111u
meas tran vdd_avg INTEG v(vdd) from=110u to=111u
let idd_avg = idd_avg*1Meg
let iout_avg = iout_avg*1Meg
let vdd_avg = vdd_avg*1Meg
let vout_avg = vout_avg*1Meg
let power_in = (idd_avg)*vdd_avg
let power_out = (iout_avg)*vout_avg
let efficiency = (power_out/power_in)*100
print power_in
print power_out
print efficiency
print vout_avg
print vout_max-vout_avg
.endc








"}
C {devices/vdd.sym} 2140 -1790 0 0 {name=l5 lab=VDD}
C {devices/gnd.sym} 2140 -1640 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} 2140 -1700 0 0 {name=Vsource value=3.6}
C {devices/vdd.sym} 3540 -1590 1 0 {name=l7 lab=VDD}
C {devices/gnd.sym} 3550 -1440 3 0 {name=l8 lab=GND}
C {devices/gnd.sym} 2830 -1490 0 0 {name=l9 lab=GND}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 3290 -1680 0 0 {name=M3
L=0.5
W=20
nf=1
mult=20
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 3150 -1680 0 0 {name=M4
L=0.5
W=20
nf=1
mult=4
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 3310 -1460 0 0 {name=M5
L=0.5
W=20
nf=1
mult=20
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 3130 -1460 0 0 {name=M6
L=0.5
W=20
nf=1
mult=4
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 3150 -1600 0 0 {name=M7
L=0.5
W=20
nf=1
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 3290 -1600 0 0 {name=M8
L=0.5
W=20
nf=1
mult=5
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 3310 -1380 0 0 {name=M9
L=0.5
W=20
nf=1
mult=5
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 3130 -1380 0 0 {name=M10
L=0.5
W=20
nf=1
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/gnd.sym} 3330 -1350 0 0 {name=l10 lab=GND}
C {devices/gnd.sym} 3150 -1350 0 0 {name=l11 lab=GND}
C {devices/gnd.sym} 3170 -1570 0 0 {name=l12 lab=GND}
C {devices/gnd.sym} 3310 -1570 0 0 {name=l13 lab=GND}
C {devices/vdd.sym} 3310 -1710 0 0 {name=l14 lab=VDD}
C {devices/vdd.sym} 3170 -1710 0 0 {name=l15 lab=VDD}
C {devices/vdd.sym} 3150 -1490 0 0 {name=l16 lab=VDD}
C {devices/vdd.sym} 3330 -1490 0 0 {name=l17 lab=VDD}
C {devices/vdd.sym} 3160 -1460 1 0 {name=l18 lab=VDD}
C {devices/gnd.sym} 3160 -1380 3 0 {name=l19 lab=GND}
C {devices/vdd.sym} 3340 -1460 1 0 {name=l20 lab=VDD}
C {devices/gnd.sym} 3340 -1380 3 0 {name=l21 lab=GND}
C {devices/vdd.sym} 3180 -1680 1 0 {name=l22 lab=VDD}
C {devices/gnd.sym} 3180 -1600 3 0 {name=l23 lab=GND}
C {devices/vdd.sym} 3320 -1680 1 0 {name=l24 lab=VDD}
C {devices/gnd.sym} 3320 -1600 3 0 {name=l25 lab=GND}
C {devices/ammeter.sym} 3520 -1530 0 0 {name=Vdrainhigh}
C {devices/ammeter.sym} 3890 -1520 3 0 {name=Viout}
C {devices/opin.sym} 3990 -1520 0 0 {name=p1 lab=vout}
C {devices/ammeter.sym} 2140 -1760 2 0 {name=Vsourcei}
C {devices/ammeter.sym} 3660 -1520 3 0 {name=VInductor_I}
C {devices/res.sym} 3960 -1490 0 0 {name=R3
value=4
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 3960 -1430 0 0 {name=l4 lab=GND}
C {devices/capa.sym} 3800 -1490 0 0 {name=C2
m=1
value=1u
footprint=1206
device="ceramic capacitor"}
