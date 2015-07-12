clear all
close all
clc

% This Octave script generates a tcl file to be used with Altera's system-console

% Register definitions
% 		
% 		   0x0    - 0x3ffe: source ram
%		   0xc000 - 0xfffe: sink ram
% 
% 		   0x4000: read base
%		   0x4002: read length
%		   0x4004: read step
%		   0x4006: read rate
%		   0x4008: read start
%		   0x400A: read done
%		   0x400C: read reset
%		   0x400E: test register
%		   0x5000: write base
%		   0x5002: write length
%          0x5004: write step
% 		   0x5006: write rate
%		   0x5008: write start
%		   0x500A: done done
%		   0x500C: reset
%
%		   0x4010: LPCenc frame rate


read_master_base_address_addr   = 0x4000;
read_master_length_addr         = 0x4002;
read_master_step_addr 			= 0x4004;
read_master_rate_addr			= 0x4006;
read_master_start_addr			= 0x4008;
read_master_done_addr 			= 0x400A;
read_master_reset_addr			= 0x400C;

write_master_base_address_addr = 0x5000;
write_master_length_addr       = 0x5002;
write_master_step_addr		   = 0x5004;
write_master_rate_addr		   = 0x5006;
write_master_start_addr		   = 0x5008;
write_master_done_addr 		   = 0x500A;
write_master_reset_addr		   = 0x500C;

LPCenc_frame_size_addr		   = 0x4010;


% Load input file (fixed point scaled to 16 bits)

w = textread('cross_seg.txt');

% Specify read master and write master parameters

read_master_base_address   = 0x0;
read_master_length         = 256;
read_master_step           = 2;
read_master_rate	       = 6250;

LPCenc_frame_size		  = 240;

write_master_base_address = 0x0;
write_master_length       = 256;
write_master_step         = 2;
write_master_rate		  = 6250;

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

% Reset DDR3 read master

fprintf(fid,'\n\n#Reset DDR3 read master\n\n');
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',read_master_reset_addr,1);

% Reset DDR3 write master

fprintf(fid,'\n\n#Reset DDR3 read master\n\n');
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',write_master_reset_addr,1);

% Configure DDR3 read master

fprintf(fid,'\n\n#Configure DDR3 read master\n\n');
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',read_master_base_address_addr,read_master_base_address);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',read_master_length_addr,read_master_length);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',read_master_step_addr,read_master_step);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',read_master_rate_addr,read_master_rate);

% Configure LPCenc

fprintf(fid,'\n\n#Configure LPCenc\n\n');
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',LPCenc_frame_size_addr,LPCenc_frame_size);

% Configure DDR3 write master

fprintf(fid,'\n\n#Configure DDR3 write master\n\n');
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',write_master_base_address_addr,write_master_base_address);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',write_master_length_addr,write_master_length);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',write_master_step_addr,write_master_step);
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',write_master_rate_addr,write_master_rate);

% Start write master

fprintf(fid,'\n\n#Start write master\n\n');
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',write_master_start_addr,1);

% Start read master

fprintf(fid,'\n\n#Start read master\n\n');
fprintf(fid,'master_write_16 $claim_path 0x%x 0x%x\n',read_master_start_addr,1);


fclose(fid)



