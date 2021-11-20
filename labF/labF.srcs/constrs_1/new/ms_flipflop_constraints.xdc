#Pranav Konduru
#ID: 013162916
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { din }];

set_property -dict { PACKAGE_PIN L16    IOSTANDARD LVCMOS33 } [get_ports { clk }];
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF]

set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { dout }];



set_property SEVERITY {Warning} [get_drc_checks LUTLP-1]
