clear all
close all
clc

% This Octave script generates a tcl file, calls Altera's System Console for communicating
% with the FPGA, and displays the output

% Register definitions
% 0x0 - 0x07ff_ffff : DDR3 address space
% 0x0800_0000 	    : read master fixed location
% 0x0800_0002		: read master read base address
% 0x0800_0004		: read master read length
% 0x0800_0006		: read master start
% 0x0800_0008		: read master done
% 0x0800_000A		: write master fixed location
% 0x0800_000C		: write master write base address
% 0x0800_000E		: write master write length
% 0x0800_0010		: write master start
% 0x0800_0012		: write master done
% 0x0800_0014		: algorithm run

read_master_fixed_location_addr      = 0x8000000;
read_master_read_base_address_addr   = 0x8000002;
read_master_read_length_addr         = 0x8000004;
read_master_start_addr			     = 0x8000006;
read_master_done_addr 			     = 0x8000008;

write_master_fixed_location_addr     = 0x800000A;
write_master_write_base_address_addr = 0x800000C;
write_master_write_length_addr       = 0x800000E;
write_master_start_addr			     = 0x8000010;
write_master_done_addr 			     = 0x8000012;

algorithm_run_addr 					 = 0x8000014;


% Load input file (fixed point scaled to 16 bits)

w = textread('data.txt');

% Specify read master and write master parameters

read_master_fixed_location    = 0;
read_master_read_base_address = 0;
read_master_read_length 	  = 512;

write_master_fixed_location     = 0;
write_master_write_base_address = 1024;
write_master_write_length 	    = 512;

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

address = read_master_read_base_address;
for i = 1:numel(w)
	fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',address,abs(w(i)));
	address = address + 2;
end

% Configure DDR3 read master

fprintf(fid,'\n\n#Configure DDR3 read master\n\n');
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',read_master_fixed_location_addr,read_master_fixed_location);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',read_master_read_base_address_addr,read_master_read_base_address);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',read_master_read_length_addr,read_master_read_length);

% Configure DDR3 write master

fprintf(fid,'\n\n#Configure DDR3 write master\n\n');
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',write_master_fixed_location_addr,write_master_fixed_location);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',write_master_write_base_address_addr,write_master_write_base_address);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',write_master_write_length_addr,write_master_write_length);

% Start write master

fprintf(fid,'\n\n#Start write master\n\n');
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',write_master_start_addr,1);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',write_master_start_addr,0);

% Start read master

fprintf(fid,'\n\n#Start read master\n\n');
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',read_master_start_addr,1);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',read_master_start_addr,0);

% Set algorithm run register

fprintf(fid,'\n\n#Set algorithm run register\n\n');
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',algorithm_run_addr,1);


fclose(fid)



