##Pranav Konduru
##ID: 013162916
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { R }]; #IO_L3P_T0_DQS_AD1P_15 Sch=cpu_resetn
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { S }]; #IO_L9P_T1_DQS_14 Sch=btnc
#set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { D }];



set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { Clk }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
create_clock -add -name sys_clk_pin -period 30.00 -waveform {0 15} [get_ports {Clk}];



set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { Q_sr }]; #IO_L18P_T2_A24_15 Sch=led[0]
#set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { Q_d }];

set_property SEVERITY {Warning} [get_drc_checks LUTLP-1]