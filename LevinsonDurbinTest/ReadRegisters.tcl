#Select the master service type and check for available service paths.
set service_paths [get_service_paths master]
#Set the master service path.
set master_service_path [lindex $service_paths 0]
#Open the master service.
set claim_path [claim_service master $master_service_path mylib]

#reset
master_write_16 $claim_path 0x0 0x1
master_write_16 $claim_path 0x0 0x0

#set autocorrelation values
master_write_16 $claim_path 0x30 32767
master_write_16 $claim_path 0x40 25742
master_write_16 $claim_path 0x50 16169
master_write_16 $claim_path 0x60 9836
master_write_16 $claim_path 0x70 4569
master_write_16 $claim_path 0x80 -2674
master_write_16 $claim_path 0x90 -11249
master_write_16 $claim_path 0xA0 -17338
master_write_16 $claim_path 0xB0 -14853
master_write_16 $claim_path 0xC0 -6828
master_write_16 $claim_path 0xD0 -3174

#start
master_write_16 $claim_path 0x10 0x1
master_write_16 $claim_path 0x10 0x0