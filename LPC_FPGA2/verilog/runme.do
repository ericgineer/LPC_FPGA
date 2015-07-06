vlog ./avalon_mm_master2/*.v
vlog ./LinearPrediction/*.v
vlog LPC_master_tb.v

vsim -novopt LPC_master_tb

mem load -i mem/mem_in.mem /LPC_master_tb/readfromram/mem

do wave.do

run  -all

mem save -o mem/mem_out.mem -f mti -data decimal -addr decimal -wordsperline 1 /master_tb/writetoram/mem
