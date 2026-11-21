## Nexys A7-100T Traffic Signal

## 100 MHz Clock
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { clk }]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk }]

## Emergency inputs
## SW0
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports { emergency_a }]

## SW1
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports { emergency_b }]

## Traffic Light A
## LED0
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports { a_red }]

## LED1
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 } [get_ports { a_yellow }]

## LED2
set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 } [get_ports { a_green }]

## Traffic Light B
## LED3
set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports { b_red }]

## LED4
set_property -dict { PACKAGE_PIN R18 IOSTANDARD LVCMOS33 } [get_ports { b_yellow }]

## LED5
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports { b_green }]

## Center Push Button
set_property -dict { PACKAGE_PIN N17 IOSTANDARD LVCMOS33 } [get_ports { reset }]