
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

########################### Formality Setup file ############################

 set_svf SYS_TOP.svf 

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

################## Design Compiler Library Files #setup ######################

puts "###########################################"
puts "#      #setting Design Libraries           #"
puts "###########################################"

#Add the path of the libraries to the search_path variable
lappend search_path /home/IC/Labs/Final_system/std_cells
lappend search_path /home/IC/Labs/Final_system/rtl/system_rtl

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

######################## Reading RTL Files #################################

puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"

analyze -format sverilog [glob /home/IC/Labs/Final_system/rtl/system_rtl/*.sv]
elaborate -lib work SYS_TOP

###################### Defining toplevel ###################################

current_design $top_module

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

link 

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design

#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source -echo ./cons.tcl

#################### Archirecture Scan Chains #########################
puts "###############################################"
puts "############ Configure scan chains ############"
puts "###############################################"

set_scan_configuration -clock_mixing no_mix  \
                       -style multiplexed_flip_flop \
                       -replace true -max_length 100  

###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

#test_ready compile
compile -scan

################################################################### 
# Setting Test Timing Variables
################################################################### 

# Preclock Measure Protocol (default protocol)
set test_default_period 100
set test_default_delay 0
set test_default_bidir_delay 0
set test_default_strobe 20
set test_default_strobe_width 0

########################## Define DFT Signals ##########################

set_dft_signal -port [get_ports scan_clk]  -type ScanClock   -view existing_dft  -timing {50 100}
set_dft_signal -port [get_ports scan_rst]  -type Reset       -view existing_dft  -active_state 0
set_dft_signal -port [get_ports test_mode] -type Constant    -view existing_dft  -active_state 1 
set_dft_signal -port [get_ports test_mode] -type TestMode    -view spec          -active_state 1 
set_dft_signal -port [get_ports SE]        -type ScanEnable  -view spec          -active_state 1   -usage scan
set_dft_signal -port [get_ports SI]        -type ScanDataIn  -view spec 
set_dft_signal -port [get_ports SO]        -type ScanDataOut -view spec  

############################# Create Test Protocol #######################
                                           
create_test_protocol

###################### Pre-DFT Design Rule Checking #######################

dft_drc -verbose

############################# Preview DFT ##############################

preview_dft -show scan_summary

############################# Insert DFT ##############################

insert_dft
compile -scan -incremental

##################### Close Formality Setup file ###########################
set_svf -off
###################### Design Rule Checking #######################

dft_drc -verbose -coverage_estimate

#############################################################################
# Write out files
#############################################################################
#Avoid Writing assign statements in the netlist
change_name -hier -rule verilog
write_file -format verilog -hierarchy -output SYS_TOP.v

#write_file -format verilog -hierarchy -output sys_dft.v

################# starting graphical user interface #######################
report_area -hierarchy > area_dft.rpt
report_power -hierarchy > power_dft.rpt
report_timing -delay_type min > hold_dft.rpt
report_timing -delay_type max > setup_dft.rpt
report_clock -attributes > clocks_dft.rpt
report_constraint -all_violators > constraints_dft.rpt
report_attribute -port > ports.rpt
dft_drc -coverage_estimate  > dft_drc_post_dft.rpt

#gui_start

#exit
