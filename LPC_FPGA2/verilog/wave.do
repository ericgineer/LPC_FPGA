onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider readfromram
add wave -noupdate -group readfromram /LPC_master_tb/readfromram/ddr_readdata
add wave -noupdate -group readfromram /LPC_master_tb/readfromram/ddr_readdatavalid
add wave -noupdate -group readfromram /LPC_master_tb/readfromram/ddr_waitrequest
add wave -noupdate -group readfromram /LPC_master_tb/readfromram/ddr_addr
add wave -noupdate -group readfromram /LPC_master_tb/readfromram/ddr_read
add wave -noupdate -group readfromram /LPC_master_tb/readfromram/ddr_write
add wave -noupdate -group readfromram /LPC_master_tb/readfromram/ddr_writedata
add wave -noupdate -group readfromram /LPC_master_tb/readfromram/clk
add wave -noupdate -divider read_master
add wave -noupdate -group read /LPC_master_tb/read/ddr_readdata
add wave -noupdate -group read /LPC_master_tb/read/ddr_readdatavalid
add wave -noupdate -group read /LPC_master_tb/read/ddr_waitrequest
add wave -noupdate -group read /LPC_master_tb/read/ddr_addr
add wave -noupdate -group read /LPC_master_tb/read/ddr_read
add wave -noupdate -group read /LPC_master_tb/read/writedata
add wave -noupdate -group read /LPC_master_tb/read/readdata
add wave -noupdate -group read /LPC_master_tb/read/addr
add wave -noupdate -group read /LPC_master_tb/read/read
add wave -noupdate -group read /LPC_master_tb/read/write
add wave -noupdate -group read /LPC_master_tb/read/d_out
add wave -noupdate -group read /LPC_master_tb/read/d_clk
add wave -noupdate -group read /LPC_master_tb/read/vout
add wave -noupdate -group read /LPC_master_tb/read/clk
add wave -noupdate -group read /LPC_master_tb/read/rst
add wave -noupdate -group read /LPC_master_tb/read/addr_init
add wave -noupdate -group read /LPC_master_tb/read/stream_length
add wave -noupdate -group read /LPC_master_tb/read/addr_step
add wave -noupdate -group read /LPC_master_tb/read/rate
add wave -noupdate -group read /LPC_master_tb/read/start
add wave -noupdate -group read /LPC_master_tb/read/done
add wave -noupdate -group read /LPC_master_tb/read/null
add wave -noupdate -group read /LPC_master_tb/read/state
add wave -noupdate -group read /LPC_master_tb/read/count
add wave -noupdate -group read /LPC_master_tb/read/d_clk_count
add wave -noupdate -group read /LPC_master_tb/read/d_clk_enable
add wave -noupdate -group read /LPC_master_tb/read/reset
add wave -noupdate -divider {LPC encode}
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/x
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/v
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/clk
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/clk_rst
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/d_clk
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/rst
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A0
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A1
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A2
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A3
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A4
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A5
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A6
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A7
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A8
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A9
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A10
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/voiced
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/freq_count
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/start_dec
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/stop_dec
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/avalon_clk
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/address
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/read
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/write
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/writedata
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/readdata
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/R0
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/R1
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/R2
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/R3
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/R4
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/R5
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/R6
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/R7
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/R8
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/R9
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/R10
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A0_tmp
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A1_tmp
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A2_tmp
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A3_tmp
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A4_tmp
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A5_tmp
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A6_tmp
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A7_tmp
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A8_tmp
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A9_tmp
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/A10_tmp
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/corr_vout
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/start
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/LDR_rst
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/done
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/rate
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/mem_null
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/count
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/freq_est_count
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/peak
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/mem_out
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/threshold
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/freq_count_tmp
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/freq_est_v
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/peak_find_v
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/freq_est_vout
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/peak_find_vout
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/freq_est_rst
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/peak_rst
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/freq_est_start
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/voiced_tmp
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/state
add wave -noupdate -group LPCenc /LPC_master_tb/LPCenc/state2
add wave -noupdate -divider {LPC decode}
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/clk
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/clk_rst
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/rst
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/start
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/stop
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/voiced
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/pulserate
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/A0
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/A1
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/A2
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/A3
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/A4
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/A5
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/A6
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/A7
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/A8
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/A9
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/A10
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/synth
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/vout
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/avalon_clk
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/address
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/read
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/write
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/writedata
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/readdata
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/x
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/pulseout
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/d_out
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/y
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/synth_vout
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/pulsegen_vout
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/v
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/vout_tmp
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/count
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/lpcrate
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/mem_null
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/num_samples
add wave -noupdate -group LPCdec /LPC_master_tb/LPCdec/state
add wave -noupdate -divider write_master
add wave -noupdate -group write /LPC_master_tb/write/ddr_waitrequest
add wave -noupdate -group write /LPC_master_tb/write/ddr_addr
add wave -noupdate -group write /LPC_master_tb/write/ddr_write
add wave -noupdate -group write /LPC_master_tb/write/ddr_writedata
add wave -noupdate -group write /LPC_master_tb/write/writedata
add wave -noupdate -group write /LPC_master_tb/write/readdata
add wave -noupdate -group write /LPC_master_tb/write/addr
add wave -noupdate -group write /LPC_master_tb/write/read
add wave -noupdate -group write /LPC_master_tb/write/write
add wave -noupdate -group write /LPC_master_tb/write/d_in
add wave -noupdate -group write /LPC_master_tb/write/d_in_clk
add wave -noupdate -group write /LPC_master_tb/write/v
add wave -noupdate -group write /LPC_master_tb/write/clk
add wave -noupdate -group write /LPC_master_tb/write/rst
add wave -noupdate -group write /LPC_master_tb/write/addr_init
add wave -noupdate -group write /LPC_master_tb/write/stream_length
add wave -noupdate -group write /LPC_master_tb/write/addr_step
add wave -noupdate -group write /LPC_master_tb/write/tmp
add wave -noupdate -group write /LPC_master_tb/write/rate
add wave -noupdate -group write /LPC_master_tb/write/rate_count
add wave -noupdate -group write /LPC_master_tb/write/state
add wave -noupdate -group write /LPC_master_tb/write/done
add wave -noupdate -group write /LPC_master_tb/write/start
add wave -noupdate -group write /LPC_master_tb/write/reset
add wave -noupdate -divider writetoram
add wave -noupdate -group writetoram /LPC_master_tb/writetoram/ddr_readdata
add wave -noupdate -group writetoram /LPC_master_tb/writetoram/ddr_readdatavalid
add wave -noupdate -group writetoram /LPC_master_tb/writetoram/ddr_waitrequest
add wave -noupdate -group writetoram /LPC_master_tb/writetoram/ddr_addr
add wave -noupdate -group writetoram /LPC_master_tb/writetoram/ddr_read
add wave -noupdate -group writetoram /LPC_master_tb/writetoram/ddr_write
add wave -noupdate -group writetoram /LPC_master_tb/writetoram/ddr_writedata
add wave -noupdate -group writetoram /LPC_master_tb/writetoram/clk
add wave -noupdate -divider master_tb
add wave -noupdate -group master_tb /LPC_master_tb/clk
add wave -noupdate -group master_tb /LPC_master_tb/rst
add wave -noupdate -group master_tb /LPC_master_tb/source_readdata
add wave -noupdate -group master_tb /LPC_master_tb/source_readdatavalid
add wave -noupdate -group master_tb /LPC_master_tb/source_waitrequest
add wave -noupdate -group master_tb /LPC_master_tb/source_addr
add wave -noupdate -group master_tb /LPC_master_tb/source_read
add wave -noupdate -group master_tb /LPC_master_tb/sink_writedata
add wave -noupdate -group master_tb /LPC_master_tb/sink_waitrequest
add wave -noupdate -group master_tb /LPC_master_tb/sink_addr
add wave -noupdate -group master_tb /LPC_master_tb/sink_write
add wave -noupdate -group master_tb /LPC_master_tb/master_read_writedata
add wave -noupdate -group master_tb /LPC_master_tb/master_read_readdata
add wave -noupdate -group master_tb /LPC_master_tb/master_read_addr
add wave -noupdate -group master_tb /LPC_master_tb/master_read_read
add wave -noupdate -group master_tb /LPC_master_tb/master_read_write
add wave -noupdate -group master_tb /LPC_master_tb/master_write_writedata
add wave -noupdate -group master_tb /LPC_master_tb/master_write_readdata
add wave -noupdate -group master_tb /LPC_master_tb/master_write_addr
add wave -noupdate -group master_tb /LPC_master_tb/master_write_read
add wave -noupdate -group master_tb /LPC_master_tb/master_write_write
add wave -noupdate -group master_tb /LPC_master_tb/d_out
add wave -noupdate -group master_tb /LPC_master_tb/d_clk
add wave -noupdate -group master_tb /LPC_master_tb/vout
add wave -noupdate -group master_tb /LPC_master_tb/d_rst
add wave -noupdate -group master_tb /LPC_master_tb/ddr_wait
add wave -noupdate -group master_tb /LPC_master_tb/A0
add wave -noupdate -group master_tb /LPC_master_tb/A1
add wave -noupdate -group master_tb /LPC_master_tb/A2
add wave -noupdate -group master_tb /LPC_master_tb/A3
add wave -noupdate -group master_tb /LPC_master_tb/A4
add wave -noupdate -group master_tb /LPC_master_tb/A5
add wave -noupdate -group master_tb /LPC_master_tb/A6
add wave -noupdate -group master_tb /LPC_master_tb/A7
add wave -noupdate -group master_tb /LPC_master_tb/A8
add wave -noupdate -group master_tb /LPC_master_tb/A9
add wave -noupdate -group master_tb /LPC_master_tb/A10
add wave -noupdate -group master_tb /LPC_master_tb/synth
add wave -noupdate -group master_tb /LPC_master_tb/freq_count
add wave -noupdate -group master_tb /LPC_master_tb/voiced
add wave -noupdate -group master_tb /LPC_master_tb/dec_vout
add wave -noupdate -group master_tb /LPC_master_tb/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {30517868 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 167
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {54455909 ns}
