# resets dram reader and writer

master_write_16 $claim_path 0x400C 0x1
master_write_16 $claim_path 0x500C 0x1
