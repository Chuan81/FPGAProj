set_property PACKAGE_PIN W19 [get_ports sys_clk]
set_property PACKAGE_PIN R16 [get_ports sys_rst_n]
set_property PACKAGE_PIN N20 [get_ports {led_out[3]}]
set_property PACKAGE_PIN M20 [get_ports {led_out[2]}]
set_property PACKAGE_PIN N22 [get_ports {led_out[1]}]
set_property PACKAGE_PIN M22 [get_ports {led_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[0]}]

set_property CFGBVS VCCO [current_design] 
set_property CONFIG_VOLTAGE 3.3 [current_design] 
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design] 
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design] 
set_property CONFIG_MODE SPIx4 [current_design]