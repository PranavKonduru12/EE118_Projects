set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { D }];

set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { Clk }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {Clk}];


set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { Qa }];
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { Qb }];
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { Qc }];
set_property SEVERITY {Warning} [get_drc_checks LUTLP-1]
