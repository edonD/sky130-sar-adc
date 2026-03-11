v {xschem version=3.4.5 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {SKY130 SAR ADC — StrongARM Comparator with CDAC Loading} 50 -700 0 0 0.6 0.6 {}
T {=== CDAC Loading Model ===} 50 -660 0 0 0.4 0.4 {}
T {=== StrongARM Latch Comparator ===} 50 -630 0 0 0.4 0.4 {}
T {=== Measurements ===} 50 -600 0 0 0.4 0.4 {}
C {devices/vsource.sym} 90 -300 0 0 {name=Vdd
value=1.8}
C {devices/vsource.sym} 30 -80 0 0 {name=Vss
value=0}
C {devices/vsource.sym} 1100 -360 0 0 {name=Vclk
value=1.8}
C {devices/vsource.sym} 1100 -150 0 0 {name=Vinp
value=0.9}
C {devices/vsource.sym} 1100 50 0 0 {name=Vinm
value=0.9}
C {devices/res.sym} 2400 -350 0 0 {name=Rsw_p
value={Rsw}}
C {devices/res.sym} 2400 -190 0 0 {name=Rsw_n
value={Rsw}}
C {devices/capa.sym} 2420 -30 0 0 {name=Ccdac_p
value={Cload}p}
C {devices/capa.sym} 2400 130 0 0 {name=Ccdac_n
value={Cload}p}
C {sky130_fd_pr/nfet_01v8.sym} 1460 -250 0 1 {name=XMtail
W={Wtail}u
L={Ltail}u
nf=1
spiceprefix=X}
C {sky130_fd_pr/nfet_01v8.sym} 1300 -270 0 0 {name=XM1
W={Win}u
L={Lin}u
nf=1
spiceprefix=X}
C {sky130_fd_pr/nfet_01v8.sym} 1500 -50 0 1 {name=XM2
W={Win}u
L={Lin}u
nf=1
spiceprefix=X}
C {sky130_fd_pr/pfet_01v8.sym} 1710 -410 0 0 {name=XMp1
W={Wlat}u
L={Llat}u
nf=1
spiceprefix=X}
C {sky130_fd_pr/pfet_01v8.sym} 1760 -260 0 1 {name=XMp2
W={Wlat}u
L={Llat}u
nf=1
spiceprefix=X}
C {sky130_fd_pr/nfet_01v8.sym} 1860 -380 0 0 {name=XMn1
W={Wlatn}u
L={Llatn}u
nf=1
spiceprefix=X}
C {sky130_fd_pr/nfet_01v8.sym} 1840 -170 0 1 {name=XMn2
W={Wlatn}u
L={Llatn}u
nf=1
spiceprefix=X}
C {sky130_fd_pr/pfet_01v8.sym} 1590 -350 0 1 {name=XMr1
W={Wrst}u
L=0.15u
nf=1
spiceprefix=X}
C {sky130_fd_pr/pfet_01v8.sym} 1630 -170 0 1 {name=XMr2
W={Wrst}u
L=0.15u
nf=1
spiceprefix=X}
C {sky130_fd_pr/pfet_01v8.sym} 1850 -500 0 0 {name=XMr3
W={Wrst}u
L=0.15u
nf=1
spiceprefix=X}
C {sky130_fd_pr/pfet_01v8.sym} 2000 -430 0 0 {name=XMr4
W={Wrst}u
L=0.15u
nf=1
spiceprefix=X}
C {sky130_fd_pr/pfet_01v8.sym} 1730 -600 0 0 {name=XMbp1
W=2u
L=0.15u
nf=1
spiceprefix=X}
C {sky130_fd_pr/nfet_01v8.sym} 1600 -500 0 0 {name=XMbn1
W=1u
L=0.15u
nf=1
spiceprefix=X}
C {sky130_fd_pr/pfet_01v8.sym} 1980 -290 0 0 {name=XMbp2
W=2u
L=0.15u
nf=1
spiceprefix=X}
C {sky130_fd_pr/nfet_01v8.sym} 2110 -170 0 0 {name=XMbn2
W=1u
L=0.15u
nf=1
spiceprefix=X}
N 2400 -320 2030 -320 {lab=inp_c}
N 2030 -320 2030 -220 {lab=inp_c}
N 2420 -60 2030 -60 {lab=inp_c}
N 2030 -60 2030 -220 {lab=inp_c}
N 1280 -270 2030 -270 {lab=inp_c}
N 2030 -270 2030 -220 {lab=inp_c}
N 2400 -160 2110 -160 {lab=inm_c}
N 2110 -160 2110 -40 {lab=inm_c}
N 2400 100 2110 100 {lab=inm_c}
N 2110 100 2110 -40 {lab=inm_c}
N 1520 -50 2110 -50 {lab=inm_c}
N 2110 -50 2110 -40 {lab=inm_c}
N 1460 -280 1420 -280 {lab=ntail}
N 1420 -280 1420 -180 {lab=ntail}
N 1300 -240 1420 -240 {lab=ntail}
N 1420 -240 1420 -180 {lab=ntail}
N 1500 -20 1420 -20 {lab=ntail}
N 1420 -20 1420 -180 {lab=ntail}
N 1300 -300 1580 -300 {lab=sa}
N 1580 -300 1580 -340 {lab=sa}
N 1860 -350 1580 -350 {lab=sa}
N 1580 -350 1580 -340 {lab=sa}
N 1590 -380 1580 -380 {lab=sa}
N 1580 -380 1580 -340 {lab=sa}
N 1500 -80 1660 -80 {lab=sb}
N 1660 -80 1660 -140 {lab=sb}
N 1840 -140 1660 -140 {lab=sb}
N 1630 -200 1660 -200 {lab=sb}
N 1660 -200 1660 -140 {lab=sb}
N 1730 -630 1600 -630 {lab=bufp}
N 1600 -630 1600 -530 {lab=bufp}
N 1980 -320 2110 -320 {lab=bufn}
N 2110 -320 2110 -200 {lab=bufn}
C {devices/vdd.sym} 90 -330 0 0 {name=l_vdd lab=VDD}
C {devices/vdd.sym} 1710 -380 0 0 {name=l_vdd lab=VDD}
C {devices/vdd.sym} 1730 -410 0 0 {name=l_vdd lab=VDD}
C {devices/vdd.sym} 1760 -230 0 0 {name=l_vdd lab=VDD}
C {devices/vdd.sym} 1740 -260 0 0 {name=l_vdd lab=VDD}
C {devices/vdd.sym} 1590 -320 0 0 {name=l_vdd lab=VDD}
C {devices/vdd.sym} 1570 -350 0 0 {name=l_vdd lab=VDD}
C {devices/vdd.sym} 1630 -140 0 0 {name=l_vdd lab=VDD}
C {devices/vdd.sym} 1610 -170 0 0 {name=l_vdd lab=VDD}
C {devices/vdd.sym} 1850 -470 0 0 {name=l_vdd lab=VDD}
C {devices/vdd.sym} 1870 -500 0 0 {name=l_vdd lab=VDD}
C {devices/vdd.sym} 2000 -400 0 0 {name=l_vdd lab=VDD}
C {devices/vdd.sym} 2020 -430 0 0 {name=l_vdd lab=VDD}
C {devices/vdd.sym} 1730 -570 0 0 {name=l_vdd lab=VDD}
C {devices/vdd.sym} 1750 -600 0 0 {name=l_vdd lab=VDD}
C {devices/vdd.sym} 1980 -260 0 0 {name=l_vdd lab=VDD}
C {devices/vdd.sym} 2000 -290 0 0 {name=l_vdd lab=VDD}
C {devices/gnd.sym} 90 -270 0 0 {name=l_0 lab=GND}
C {devices/gnd.sym} 30 -50 0 0 {name=l_0 lab=GND}
C {devices/gnd.sym} 1100 -330 0 0 {name=l_0 lab=GND}
C {devices/gnd.sym} 1100 -120 0 0 {name=l_0 lab=GND}
C {devices/gnd.sym} 1100 80 0 0 {name=l_0 lab=GND}
C {devices/gnd.sym} 30 -110 0 0 {name=l_vss lab=VSS}
C {devices/gnd.sym} 2420 0 0 0 {name=l_vss lab=VSS}
C {devices/gnd.sym} 2400 160 0 0 {name=l_vss lab=VSS}
C {devices/gnd.sym} 1460 -220 0 0 {name=l_vss lab=VSS}
C {devices/gnd.sym} 1440 -250 0 0 {name=l_vss lab=VSS}
C {devices/gnd.sym} 1320 -270 0 0 {name=l_vss lab=VSS}
C {devices/gnd.sym} 1480 -50 0 0 {name=l_vss lab=VSS}
C {devices/gnd.sym} 1880 -380 0 0 {name=l_vss lab=VSS}
C {devices/gnd.sym} 1820 -170 0 0 {name=l_vss lab=VSS}
C {devices/gnd.sym} 1600 -470 0 0 {name=l_vss lab=VSS}
C {devices/gnd.sym} 1620 -500 0 0 {name=l_vss lab=VSS}
C {devices/gnd.sym} 2110 -140 0 0 {name=l_vss lab=VSS}
C {devices/gnd.sym} 2130 -170 0 0 {name=l_vss lab=VSS}
C {devices/lab_pin.sym} 1100 -390 0 0 {name=l_clk sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 1480 -250 0 0 {name=l_clk sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 1610 -350 0 0 {name=l_clk sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 1650 -170 0 0 {name=l_clk sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 1830 -500 0 0 {name=l_clk sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 1980 -430 0 0 {name=l_clk sig_type=std_logic lab=clk}
C {devices/lab_pin.sym} 1100 -180 0 0 {name=l_inp sig_type=std_logic lab=inp}
C {devices/lab_pin.sym} 2400 -380 0 0 {name=l_inp sig_type=std_logic lab=inp}
C {devices/lab_pin.sym} 1100 20 0 0 {name=l_inm sig_type=std_logic lab=inm}
C {devices/lab_pin.sym} 2400 -220 0 0 {name=l_inm sig_type=std_logic lab=inm}
C {devices/lab_pin.sym} 1710 -440 0 0 {name=l_outn sig_type=std_logic lab=outn}
C {devices/lab_pin.sym} 1780 -260 0 0 {name=l_outn sig_type=std_logic lab=outn}
C {devices/lab_pin.sym} 1860 -410 0 0 {name=l_outn sig_type=std_logic lab=outn}
C {devices/lab_pin.sym} 1860 -170 0 0 {name=l_outn sig_type=std_logic lab=outn}
C {devices/lab_pin.sym} 1850 -530 0 0 {name=l_outn sig_type=std_logic lab=outn}
C {devices/lab_pin.sym} 1710 -600 0 0 {name=l_outn sig_type=std_logic lab=outn}
C {devices/lab_pin.sym} 1580 -500 0 0 {name=l_outn sig_type=std_logic lab=outn}
C {devices/lab_pin.sym} 1690 -410 0 0 {name=l_outp sig_type=std_logic lab=outp}
C {devices/lab_pin.sym} 1760 -290 0 0 {name=l_outp sig_type=std_logic lab=outp}
C {devices/lab_pin.sym} 1840 -380 0 0 {name=l_outp sig_type=std_logic lab=outp}
C {devices/lab_pin.sym} 1840 -200 0 0 {name=l_outp sig_type=std_logic lab=outp}
C {devices/lab_pin.sym} 2000 -460 0 0 {name=l_outp sig_type=std_logic lab=outp}
C {devices/lab_pin.sym} 1960 -290 0 0 {name=l_outp sig_type=std_logic lab=outp}
C {devices/lab_pin.sym} 2090 -170 0 0 {name=l_outp sig_type=std_logic lab=outp}
