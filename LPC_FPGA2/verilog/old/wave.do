onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider readfromram
add wave -noupdate -group readfromram /stream_tb/readfromram/ddr_readdata
add wave -noupdate -group readfromram /stream_tb/readfromram/ddr_readdatavalid
add wave -noupdate -group readfromram /stream_tb/readfromram/ddr_waitrequest
add wave -noupdate -group readfromram /stream_tb/readfromram/ddr_addr
add wave -noupdate -group readfromram /stream_tb/readfromram/ddr_read
add wave -noupdate -group readfromram /stream_tb/readfromram/ddr_write
add wave -noupdate -group readfromram /stream_tb/readfromram/ddr_writedata
add wave -noupdate -group readfromram /stream_tb/readfromram/clk
add wave -noupdate -divider read
add wave -noupdate -group read /stream_tb/read/ddr_readdata
add wave -noupdate -group read /stream_tb/read/ddr_readdatavalid
add wave -noupdate -group read /stream_tb/read/ddr_waitrequest
add wave -noupdate -group read /stream_tb/read/ddr_addr
add wave -noupdate -group read /stream_tb/read/ddr_read
add wave -noupdate -group read /stream_tb/read/writedata
add wave -noupdate -group read /stream_tb/read/readdata
add wave -noupdate -group read /stream_tb/read/addr
add wave -noupdate -group read /stream_tb/read/read
add wave -noupdate -group read /stream_tb/read/write
add wave -noupdate -group read /stream_tb/read/d_out
add wave -noupdate -group read /stream_tb/read/vout
add wave -noupdate -group read /stream_tb/read/clk
add wave -noupdate -group read /stream_tb/read/rst
add wave -noupdate -group read /stream_tb/read/addr_init
add wave -noupdate -group read /stream_tb/read/stream_length
add wave -noupdate -group read /stream_tb/read/addr_step
add wave -noupdate -group read /stream_tb/read/start
add wave -noupdate -group read /stream_tb/read/null
add wave -noupdate -group read /stream_tb/read/state
add wave -noupdate -divider write
add wave -noupdate -group write /stream_tb/write/ddr_waitrequest
add wave -noupdate -group write /stream_tb/write/ddr_addr
add wave -noupdate -group write /stream_tb/write/ddr_write
add wave -noupdate -group write /stream_tb/write/ddr_writedata
add wave -noupdate -group write /stream_tb/write/writedata
add wave -noupdate -group write /stream_tb/write/readdata
add wave -noupdate -group write /stream_tb/write/addr
add wave -noupdate -group write /stream_tb/write/read
add wave -noupdate -group write /stream_tb/write/write
add wave -noupdate -group write /stream_tb/write/d_in
add wave -noupdate -group write /stream_tb/write/v
add wave -noupdate -group write /stream_tb/write/ddr_wait
add wave -noupdate -group write /stream_tb/write/clk
add wave -noupdate -group write /stream_tb/write/rst
add wave -noupdate -group write /stream_tb/write/addr_init
add wave -noupdate -group write /stream_tb/write/stream_length
add wave -noupdate -group write /stream_tb/write/addr_step
add wave -noupdate -group write /stream_tb/write/tmp
add wave -noupdate -group write /stream_tb/write/fifo_out
add wave -noupdate -group write /stream_tb/write/addr_count
add wave -noupdate -group write /stream_tb/write/state
add wave -noupdate -group write /stream_tb/write/fifo_addr
add wave -noupdate -group write /stream_tb/write/sink_vout
add wave -noupdate -group write /stream_tb/write/start
add wave -noupdate -divider writetoram
add wave -noupdate -group writetoram /stream_tb/writetoram/ddr_readdata
add wave -noupdate -group writetoram /stream_tb/writetoram/ddr_readdatavalid
add wave -noupdate -group writetoram /stream_tb/writetoram/ddr_waitrequest
add wave -noupdate -group writetoram /stream_tb/writetoram/ddr_addr
add wave -noupdate -group writetoram /stream_tb/writetoram/ddr_read
add wave -noupdate -group writetoram /stream_tb/writetoram/ddr_write
add wave -noupdate -group writetoram /stream_tb/writetoram/ddr_writedata
add wave -noupdate -group writetoram /stream_tb/writetoram/clk
add wave -noupdate -divider FIFO
add wave -noupdate -group FIFO /stream_tb/write/fifo/clk
add wave -noupdate -group FIFO /stream_tb/write/fifo/rst
add wave -noupdate -group FIFO /stream_tb/write/fifo/source_data_in
add wave -noupdate -group FIFO /stream_tb/write/fifo/source_v_in
add wave -noupdate -group FIFO /stream_tb/write/fifo/sink_data_out
add wave -noupdate -group FIFO /stream_tb/write/fifo/sink_v_in
add wave -noupdate -group FIFO /stream_tb/write/fifo/sink_vout
add wave -noupdate -group FIFO /stream_tb/write/fifo/source_ptr
add wave -noupdate -group FIFO /stream_tb/write/fifo/sink_ptr
add wave -noupdate -group FIFO /stream_tb/write/fifo/to_sink
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20958 ns} 0}
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
WaveRestoreZoom {6775 ns} {8470 ns}
