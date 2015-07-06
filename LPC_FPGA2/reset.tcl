# resets dram reader and writer

master_write_16 $claim_path 0x100C 0x1
master_write_16 $claim_path 0x200C 0x1
