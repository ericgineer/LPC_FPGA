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
master_write_16 $claim_path 0x6 0x7fff
master_write_16 $claim_path 0x8 0x648e
master_write_16 $claim_path 0xA 0x3f29
master_write_16 $claim_path 0xC 0x266c
master_write_16 $claim_path 0xE 0x11d9
master_write_16 $claim_path 0x10 0xf58e
master_write_16 $claim_path 0x12 0xd40f
master_write_16 $claim_path 0x14 0xbc46
master_write_16 $claim_path 0x16 0xc5fb
master_write_16 $claim_path 0x18 0xe554
master_write_16 $claim_path 0x1A 0xf39a

#start
master_write_16 $claim_path 0x2 0x1
master_write_16 $claim_path 0x2 0x0