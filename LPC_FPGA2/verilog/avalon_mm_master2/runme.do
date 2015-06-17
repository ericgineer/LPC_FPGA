vlog *.v

vsim -novopt master_tb

mem load -i mem/mem_in.mem /master_tb/readfromram/mem

do wave.do

run  -all

mem save -o mem/mem_out.mem -f mti -data decimal -addr decimal -wordsperline 1 /master_tb/writetoram/mem
