% Octave script to generate memory contents for Modelsim


w = 1:256;

filename = 'mem_in.mem';
fid = fopen(filename, 'w');

fprintf(fid,'// memory data file (do not edit the following line - required for mem load use)\n');
fprintf(fid,'// instance=/stream_tb/writetoram/mem\n');
fprintf(fid,'// format=mti addressradix=d dataradix=d version=1.0 wordsperline=1\n');
			 
for i=1:numel(w)
	fprintf(fid,'    %d:      %d\n',i-1,w(i));
end

fclose(fid);
