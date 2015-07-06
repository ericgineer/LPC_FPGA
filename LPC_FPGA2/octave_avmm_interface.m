clear all
close all
clc

% This Octave script generates a tcl file, calls Altera's System Console for communicating
% with the FPGA, and displays the output

% Register definitions
% 0x0 - 0x07ff_ffff : DDR3 address space
% 		   0x1000: read base
%		   0x1002: read length
%		   0x1004: read step
%		   0x1006: read rate
%		   0x1008: read start
%		   0x1010: read done
%		   0x1012: read reset
%		   0x1014: test register
%		   0x2000: write base
%		   0x2002: write length
%          0x2004: write step
% 		   0x2006: not used
%		   0x2008: write start
%		   0x2010: done done
%		   0x2012: reset


read_master_base_address_addr   = 0x1000;
read_master_length_addr         = 0x1002;
read_master_step_addr 			= 0x1004;
read_master_rate_addr			= 0x1006;
read_master_start_addr			= 0x1008;
read_master_done_addr 			= 0x100A;
read_master_reset				= 0x100C;

write_master_base_address_addr = 0x2000;
write_master_length_addr       = 0x2002;
write_master_step_addr		   = 0x2004;
write_master_start_addr		   = 0x2008;
write_master_done_addr 		   = 0x200A;
write_master_reset			   = 0x200C;


% Load input file (fixed point scaled to 16 bits)

w = textread('data.txt');

% Specify read master and write master parameters

read_master_base_address   = 0x0;
read_master_length         = 256;
read_master_step           = 2;
read_master_rate	       = 6250;

write_master_base_address = 0x0000;
write_master_length       = 256;
write_master_step         = 2;

% Create tcl file for system-console

fid = fopen("mytcl.tcl","w");

fprintf(fid,'#Select the master service type and check for available service paths.\n');
fprintf(fid,'set service_paths [get_service_paths master]\n');
fprintf(fid,'#Set the master service path.\n');
fprintf(fid,'set master_service_path [lindex $service_paths 0]\n');
fprintf(fid,'#Open the master service.\n');
fprintf(fid,'set claim_path [claim_service master $master_service_path mylib]\n');

fprintf(fid,'\n\n');

% Load input data into DRAM

fprintf(fid,'#Load input data into DRAM\n\n');

address = read_master_base_address;
for i = 1:numel(w)
	fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',address,abs(w(i)));
	address = address + 2;
end

% Configure DDR3 read master

fprintf(fid,'\n\n#Configure DDR3 read master\n\n');
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',read_master_base_address_addr,read_master_base_address);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',read_master_length_addr,read_master_length);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',read_master_step_addr,read_master_step);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',read_master_rate_addr,read_master_rate);

% Configure DDR3 write master

fprintf(fid,'\n\n#Configure DDR3 write master\n\n');
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',write_master_base_address_addr,write_master_base_address);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',write_master_length_addr,write_master_length);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',write_master_step_addr,write_master_step);

% Start write master

fprintf(fid,'\n\n#Start write master\n\n');
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',write_master_start_addr,1);

% Start read master

fprintf(fid,'\n\n#Start read master\n\n');
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',read_master_start_addr,1);


fclose(fid)



