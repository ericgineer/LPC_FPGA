onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider readfromram
add wave -noupdate -group readfromram /master_tb/readfromram/ddr_readdata
add wave -noupdate -group readfromram /master_tb/readfromram/ddr_readdatavalid
add wave -noupdate -group readfromram /master_tb/readfromram/ddr_waitrequest
add wave -noupdate -group readfromram /master_tb/readfromram/ddr_addr
add wave -noupdate -group readfromram /master_tb/readfromram/ddr_read
add wave -noupdate -group readfromram /master_tb/readfromram/ddr_write
add wave -noupdate -group readfromram /master_tb/readfromram/ddr_writedata
add wave -noupdate -group readfromram /master_tb/readfromram/clk
add wave -noupdate -divider read_master
add wave -noupdate -group read /master_tb/read/ddr_readdata
add wave -noupdate -group read /master_tb/read/ddr_readdatavalid
add wave -noupdate -group read /master_tb/read/ddr_waitrequest
add wave -noupdate -group read -radix unsigned /master_tb/read/ddr_addr
add wave -noupdate -group read /master_tb/read/ddr_read
add wave -noupdate -group read /master_tb/read/writedata
add wave -noupdate -group read /master_tb/read/readdata
add wave -noupdate -group read /master_tb/read/addr
add wave -noupdate -group read /master_tb/read/read
add wave -noupdate -group read /master_tb/read/write
add wave -noupdate -group read /master_tb/read/d_out
add wave -noupdate -group read /master_tb/read/d_clk
add wave -noupdate -group read /master_tb/read/d_clk_count
add wave -noupdate -group read /master_tb/read/d_clk_enable
add wave -noupdate -group read /master_tb/read/vout
add wave -noupdate -group read /master_tb/read/clk
add wave -noupdate -group read /master_tb/read/rst
add wave -noupdate -group read /master_tb/read/addr_init
add wave -noupdate -group read /master_tb/read/stream_length
add wave -noupdate -group read /master_tb/read/addr_step
add wave -noupdate -group read /master_tb/read/rate
add wave -noupdate -group read /master_tb/read/start
add wave -noupdate -group read /master_tb/read/done
add wave -noupdate -group read /master_tb/read/null
add wave -noupdate -group read /master_tb/read/state
add wave -noupdate -group read /master_tb/read/count
add wave -noupdate -group read /master_tb/read/reset
add wave -noupdate -divider write_master
add wave -noupdate -group write /master_tb/write/ddr_waitrequest
add wave -noupdate -group write /master_tb/write/ddr_addr
add wave -noupdate -group write /master_tb/write/ddr_write
add wave -noupdate -group write /master_tb/write/ddr_writedata
add wave -noupdate -group write /master_tb/write/writedata
add wave -noupdate -group write /master_tb/write/readdata
add wave -noupdate -group write /master_tb/write/addr
add wave -noupdate -group write /master_tb/write/read
add wave -noupdate -group write /master_tb/write/write
add wave -noupdate -group write /master_tb/write/d_in
add wave -noupdate -group write /master_tb/write/v
add wave -noupdate -group write /master_tb/write/clk
add wave -noupdate -group write /master_tb/write/rst
add wave -noupdate -group write /master_tb/write/addr_init
add wave -noupdate -group write /master_tb/write/stream_length
add wave -noupdate -group write /master_tb/write/addr_step
add wave -noupdate -group write /master_tb/write/tmp
add wave -noupdate -group write /master_tb/write/state
add wave -noupdate -group write /master_tb/write/done
add wave -noupdate -group write /master_tb/write/start
add wave -noupdate -group write /master_tb/write/reset
add wave -noupdate -divider writetoram
add wave -noupdate -group writetoram /master_tb/writetoram/ddr_readdata
add wave -noupdate -group writetoram /master_tb/writetoram/ddr_readdatavalid
add wave -noupdate -group writetoram /master_tb/writetoram/ddr_waitrequest
add wave -noupdate -group writetoram /master_tb/writetoram/ddr_addr
add wave -noupdate -group writetoram /master_tb/writetoram/ddr_read
add wave -noupdate -group writetoram /master_tb/writetoram/ddr_write
add wave -noupdate -group writetoram /master_tb/writetoram/ddr_writedata
add wave -noupdate -group writetoram /master_tb/writetoram/clk
add wave -noupdate -divider master_tb
add wave -noupdate -group master_tb /master_tb/clk
add wave -noupdate -group master_tb /master_tb/rst
add wave -noupdate -group master_tb /master_tb/source_readdata
add wave -noupdate -group master_tb /master_tb/source_readdatavalid
add wave -noupdate -group master_tb /master_tb/source_waitrequest
add wave -noupdate -group master_tb /master_tb/source_addr
add wave -noupdate -group master_tb /master_tb/source_read
add wave -noupdate -group master_tb /master_tb/sink_writedata
add wave -noupdate -group master_tb /master_tb/sink_waitrequest
add wave -noupdate -group master_tb /master_tb/sink_addr
add wave -noupdate -group master_tb /master_tb/sink_write
add wave -noupdate -group master_tb /master_tb/master_read_writedata
add wave -noupdate -group master_tb /master_tb/master_read_readdata
add wave -noupdate -group master_tb /master_tb/master_read_addr
add wave -noupdate -group master_tb /master_tb/master_read_read
add wave -noupdate -group master_tb /master_tb/master_read_write
add wave -noupdate -group master_tb /master_tb/master_write_writedata
add wave -noupdate -group master_tb /master_tb/master_write_readdata
add wave -noupdate -group master_tb /master_tb/master_write_addr
add wave -noupdate -group master_tb /master_tb/master_write_read
add wave -noupdate -group master_tb /master_tb/master_write_write
add wave -noupdate -group master_tb /master_tb/d_out
add wave -noupdate -group master_tb /master_tb/d_clk
add wave -noupdate -group master_tb /master_tb/vout
add wave -noupdate -group master_tb /master_tb/ddr_wait
add wave -noupdate -group master_tb /master_tb/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10710 ns} 0}
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
WaveRestoreZoom {0 ns} {2615 ns}
