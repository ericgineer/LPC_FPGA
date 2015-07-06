% Script to generate a tcl file for system-console that clears the dram

fid = fopen("clear_ram.tcl","w");

fprintf(fid,'#Clear DRAM\n\n');
for address = 0:2:12800
	fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',address,0);
end
