
####################################################################################
# Constraints
# ----------------------------------------------------------------------------
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. #set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load
####################################################################################
           #########################################################
                  #### Section 0 : DC Variables ####
           #########################################################
#################################################################################### 

# Prevent assign statements in the generated netlist (must be applied before compile command)
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################

# 1. Master Clocks
set CLK_NAME_RF REF_CLK
set CLK_PER_RF 20
set CLK_NAME_URAT UART_CLK
set CLK_PER_UART 271.2673611
set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1
set rst_name RST

#3. SCAN_CLK (10 MHZ)
set CLK3_NAME SCAN_CLK
set CLK3_PER 100

create_clock -name $CLK_NAME_RF -period $CLK_PER_RF -waveform "0 [expr $CLK_PER_RF/2]" [get_port REF_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clock $CLK_NAME_RF]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clock $CLK_NAME_RF]

create_clock -name $CLK_NAME_URAT -period $CLK_PER_UART -waveform "0 [expr $CLK_PER_UART/2]" [get_port UART_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clock $CLK_NAME_URAT]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clock $CLK_NAME_URAT]

create_clock -name $CLK3_NAME -period $CLK3_PER -waveform "0 [expr $CLK3_PER/2]" [get_ports scan_clk]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK3_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks $CLK3_NAME]

# 2. Generated Clocks
create_generated_clock -master_clock $CLK_NAME_RF -source [get_ports REF_CLK] \
                       -name ALU_CLK [get_port U0_CLK_GATE/GATED_CLK] \
                       -divide_by 1

create_generated_clock -master_clock $CLK_NAME_URAT -source [get_ports UART_CLK] \
                       -name RX_CLK [get_port U1_ClkDiv/o_div_clk] \
                       -divide_by 1

create_generated_clock -master_clock $CLK_NAME_URAT -source  [get_ports UART_CLK] \
                       -name TX_CLK [get_port U0_ClkDiv/o_div_clk] \
                       -divide_by 32

#create_generated_clock -master_clock $CLK_NAME -source [get_ports CLK] \
#                       -name "mux_clk" [get_port U1/OUT] \
#                       -divide_by 1

####################################################################################
           #########################################################
                  #### Section 5 : Clock Grouping ####
           #########################################################
####################################################################################

#set_dont_touch_network [get_clocks {REF_CLK UART_CLK ALU_CLK TX_CLK RX_CLK}]

####################################################################################
           #########################################################
                  #### Section 2 : Clocks Relationships ####
           #########################################################
####################################################################################

set_clock_groups -asynchronous -group [get_clocks "$CLK_NAME_RF ALU_CLK"]  \
                               -group [get_clocks "$CLK_NAME_URAT TX_CLK RX_CLK"] \
                               -group [get_clocks "SCAN_CLK"]


####################################################################################
           #########################################################
             #### Section 6 : #set input/output delay on ports ####
           #########################################################
####################################################################################

set in_delay  [expr 0.2*$CLK_PER_UART]
set out_delay [expr 0.2*$CLK_PER_UART]

set in2_delay  [expr 0.2*$CLK3_PER]
set out2_delay [expr 0.2*$CLK3_PER]

#Constrain Scan Input Paths
set_input_delay $in2_delay -clock $CLK3_NAME [get_port test_mode]
set_input_delay $in2_delay -clock $CLK3_NAME [get_port SI]
set_input_delay $in2_delay -clock $CLK3_NAME [get_port SE]
# Constrain Input Paths
set_input_delay $in_delay -clock $CLK_NAME_URAT [get_ports RX_IN]

# Constrain Output Paths
set_output_delay $out_delay -clock $CLK_NAME_URAT [get_ports TX_OUT]
#Constrain Scan Output Paths
set_output_delay $out2_delay -clock $CLK3_NAME [get_port SO]

####################################################################################
           #########################################################
                  #### Section 7 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports RX_IN]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port test_mode]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port SI]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port SE]

####################################################################################
           #########################################################
                  #### Section 8 : Output load ####
           #########################################################
####################################################################################

set_load 0.1 [get_ports TX_OUT]
set_load 0.5 [get_port SO]

####################################################################################
           #########################################################
                 #### Section 9 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max (setup) analysis
# Define the Best Library for Min (hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 10 : wireload Model ####
           #########################################################
####################################################################################

#set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c

####################################################################################
           #########################################################
                  #### Section 8 : set_case_analysis ####
           #########################################################
####################################################################################

set_case_analysis 1 [get_port test_mode]

