vlog *.v

vsim -L altera_mf_ver -novopt master_tb

mem load -i mem/mem_in.mem /master_tb/ddr_read/mem

do wave.do

run  -all

mem save -o mem/mem_out.mem -f mti -data decimal -addr decimal -wordsperline 1 /master_tb/ddr_write/mem
