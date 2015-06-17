# TCL File Generated by Component Editor 15.0
# Tue Jun 16 22:41:23 PDT 2015
# DO NOT MODIFY


# 
# write_master "write_master" v1.0
#  2015.06.16.22:41:22
# 
# 

# 
# request TCL package from ACDS 15.0
# 
package require -exact qsys 15.0


# 
# module write_master
# 
set_module_property DESCRIPTION ""
set_module_property NAME write_master
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME write_master
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL write_master
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file write_master.v VERILOG PATH verilog/avalon_mm_master2/write_master.v TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter S0 INTEGER 0
set_parameter_property S0 DEFAULT_VALUE 0
set_parameter_property S0 DISPLAY_NAME S0
set_parameter_property S0 TYPE INTEGER
set_parameter_property S0 UNITS None
set_parameter_property S0 HDL_PARAMETER true
add_parameter S1 INTEGER 1
set_parameter_property S1 DEFAULT_VALUE 1
set_parameter_property S1 DISPLAY_NAME S1
set_parameter_property S1 TYPE INTEGER
set_parameter_property S1 UNITS None
set_parameter_property S1 HDL_PARAMETER true
add_parameter S2 INTEGER 2
set_parameter_property S2 DEFAULT_VALUE 2
set_parameter_property S2 DISPLAY_NAME S2
set_parameter_property S2 TYPE INTEGER
set_parameter_property S2 UNITS None
set_parameter_property S2 HDL_PARAMETER true


# 
# display items
# 


# 
# connection point avalon_slave_0
# 
add_interface avalon_slave_0 avalon end
set_interface_property avalon_slave_0 addressUnits WORDS
set_interface_property avalon_slave_0 associatedClock clock
set_interface_property avalon_slave_0 associatedReset reset_sink
set_interface_property avalon_slave_0 bitsPerSymbol 8
set_interface_property avalon_slave_0 burstOnBurstBoundariesOnly false
set_interface_property avalon_slave_0 burstcountUnits WORDS
set_interface_property avalon_slave_0 explicitAddressSpan 0
set_interface_property avalon_slave_0 holdTime 0
set_interface_property avalon_slave_0 linewrapBursts false
set_interface_property avalon_slave_0 maximumPendingReadTransactions 0
set_interface_property avalon_slave_0 maximumPendingWriteTransactions 0
set_interface_property avalon_slave_0 readLatency 0
set_interface_property avalon_slave_0 readWaitTime 1
set_interface_property avalon_slave_0 setupTime 0
set_interface_property avalon_slave_0 timingUnits Cycles
set_interface_property avalon_slave_0 writeWaitTime 0
set_interface_property avalon_slave_0 ENABLED true
set_interface_property avalon_slave_0 EXPORT_OF ""
set_interface_property avalon_slave_0 PORT_NAME_MAP ""
set_interface_property avalon_slave_0 CMSIS_SVD_VARIABLES ""
set_interface_property avalon_slave_0 SVD_ADDRESS_GROUP ""

add_interface_port avalon_slave_0 addr address Input 3
add_interface_port avalon_slave_0 read read Input 1
add_interface_port avalon_slave_0 write write Input 1
add_interface_port avalon_slave_0 writedata writedata Input 32
add_interface_port avalon_slave_0 readdata readdata Output 32
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_slave_0 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point reset_sink
# 
add_interface reset_sink reset end
set_interface_property reset_sink associatedClock clock
set_interface_property reset_sink synchronousEdges DEASSERT
set_interface_property reset_sink ENABLED true
set_interface_property reset_sink EXPORT_OF ""
set_interface_property reset_sink PORT_NAME_MAP ""
set_interface_property reset_sink CMSIS_SVD_VARIABLES ""
set_interface_property reset_sink SVD_ADDRESS_GROUP ""

add_interface_port reset_sink rst reset Input 1


# 
# connection point ddr3_avalon_master
# 
add_interface ddr3_avalon_master avalon start
set_interface_property ddr3_avalon_master addressUnits SYMBOLS
set_interface_property ddr3_avalon_master associatedClock clock
set_interface_property ddr3_avalon_master associatedReset reset_sink
set_interface_property ddr3_avalon_master bitsPerSymbol 8
set_interface_property ddr3_avalon_master burstOnBurstBoundariesOnly false
set_interface_property ddr3_avalon_master burstcountUnits WORDS
set_interface_property ddr3_avalon_master doStreamReads false
set_interface_property ddr3_avalon_master doStreamWrites false
set_interface_property ddr3_avalon_master holdTime 0
set_interface_property ddr3_avalon_master linewrapBursts false
set_interface_property ddr3_avalon_master maximumPendingReadTransactions 0
set_interface_property ddr3_avalon_master maximumPendingWriteTransactions 0
set_interface_property ddr3_avalon_master readLatency 0
set_interface_property ddr3_avalon_master readWaitTime 1
set_interface_property ddr3_avalon_master setupTime 0
set_interface_property ddr3_avalon_master timingUnits Cycles
set_interface_property ddr3_avalon_master writeWaitTime 0
set_interface_property ddr3_avalon_master ENABLED true
set_interface_property ddr3_avalon_master EXPORT_OF ""
set_interface_property ddr3_avalon_master PORT_NAME_MAP ""
set_interface_property ddr3_avalon_master CMSIS_SVD_VARIABLES ""
set_interface_property ddr3_avalon_master SVD_ADDRESS_GROUP ""

add_interface_port ddr3_avalon_master ddr_waitrequest waitrequest Input 1
add_interface_port ddr3_avalon_master ddr_addr address Output 32
add_interface_port ddr3_avalon_master ddr_write write Output 1
add_interface_port ddr3_avalon_master ddr_writedata writedata Output 16


# 
# connection point stream_interface
# 
add_interface stream_interface conduit end
set_interface_property stream_interface associatedClock ""
set_interface_property stream_interface associatedReset ""
set_interface_property stream_interface ENABLED true
set_interface_property stream_interface EXPORT_OF ""
set_interface_property stream_interface PORT_NAME_MAP ""
set_interface_property stream_interface CMSIS_SVD_VARIABLES ""
set_interface_property stream_interface SVD_ADDRESS_GROUP ""

add_interface_port stream_interface d_in d_in Input 16
add_interface_port stream_interface v v Input 1

