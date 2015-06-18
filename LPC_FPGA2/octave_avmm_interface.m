clear all
close all
clc

% This Octave script generates a tcl file, calls Altera's System Console for communicating
% with the FPGA, and displays the output

% Register definitions
% 0x0 - 0x07ff_ffff : DDR3 address space
% 		   0x8000020: read base
%		   0x8000024: read length
%		   0x8000028: read step
%		   0x800002C: read rate
%		   0x8000030: read start
%		   0x8000034: read done
%		   0x8000038: read reset
%		   0x8000000: write base
%		   0x8000004: write length
%          0x8000008: write step
% 		   0x800000C: not used
%		   0x8000010: write start
%		   0x8000014: done done
%		   0x8000018: reset


read_master_base_address_addr   = 0x8000020;
read_master_length_addr         = 0x8000024;
read_master_step_addr 			 = 0x8000028;
read_master_rate_addr			     = 0x800002C;
read_master_start_addr			     = 0x8000030;
read_master_done_addr 			     = 0x8000034;
read_master_reset				 	 = 0x8000038;

write_master_base_address_addr = 0x8000000;
write_master_length_addr       = 0x8000004;
write_master_step_addr		 = 0x8000008;
write_master_start_addr			     = 0x8000010;
write_master_done_addr 			     = 0x8000014;
write_master_reset					 = 0x8000018;


% Load input file (fixed point scaled to 16 bits)

w = textread('data.txt');

% Specify read master and write master parameters

read_master_base_address   = 0;
read_master_length         = 1024;
read_master_step           = 4;
read_master_rate	            = 6250;

write_master_base_address = 0x8000;
write_master_length       = 1024;
write_master_step         = 4;

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
	fprintf(fid,'master_write_32 $claim_path 0x%x 0x%x\n',address,abs(w(i)));
	address = address + 4;
end

% Configure DDR3 read master

fprintf(fid,'\n\n#Configure DDR3 read master\n\n');
fprintf(fid,'master_write_32 $claim_path 0x%x 0x%x\n',read_master_base_address_addr,read_master_base_address);
fprintf(fid,'master_write_32 $claim_path 0x%x 0x%x\n',read_master_length_addr,read_master_length);
fprintf(fid,'master_write_32 $claim_path 0x%x 0x%x\n',read_master_step_addr,read_master_step);
fprintf(fid,'master_write_32 $claim_path 0x%x 0x%x\n',read_master_rate_addr,read_master_rate);

% Configure DDR3 write master

fprintf(fid,'\n\n#Configure DDR3 write master\n\n');
fprintf(fid,'master_write_32 $claim_path 0x%x 0x%x\n',write_master_base_address_addr,write_master_base_address);
fprintf(fid,'master_write_32 $claim_path 0x%x 0x%x\n',write_master_length,write_master_length_addr);
fprintf(fid,'master_write_32 $claim_path 0x%x 0x%x\n',write_master_step_addr,write_master_step);

% Start write master

fprintf(fid,'\n\n#Start write master\n\n');
fprintf(fid,'master_write_32 $claim_path 0x%x 0x%x\n',write_master_start_addr,1);
fprintf(fid,'master_write_32 $claim_path 0x%x 0x%x\n',write_master_start_addr,0);

% Start read master

fprintf(fid,'\n\n#Start read master\n\n');
fprintf(fid,'master_write_32 $claim_path 0x%x 0x%x\n',read_master_start_addr,1);
fprintf(fid,'master_write_32 $claim_path 0x%x 0x%x\n',read_master_start_addr,0);


fclose(fid)



