vlog *.v

vsim -novopt stream_tb

mem load -i mem/mem_in.mem /stream_tb/readfromram/mem

do wave.do

run  -all

mem save -o mem/mem_out.mem -f mti -data decimal -addr decimal -wordsperline 1 /stream_tb/writetoram/mem