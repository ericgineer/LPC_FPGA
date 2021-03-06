#Select the master service type and check for available service paths.
set service_paths [get_service_paths master]
#Set the master service path.
set master_service_path [lindex $service_paths 0]
#Open the master service.
set claim_path [claim_service master $master_service_path mylib]


#Load input data into DRAM

master_write_16 $claim_path 0x0 0x2462
master_write_16 $claim_path 0x2 0x4f74
master_write_16 $claim_path 0x4 0x5451
master_write_16 $claim_path 0x6 0x2c44
master_write_16 $claim_path 0x8 0xa99
master_write_16 $claim_path 0xa 0x4f74
master_write_16 $claim_path 0xc 0x62e1
master_write_16 $claim_path 0xe 0x5e02
master_write_16 $claim_path 0x10 0x3868
master_write_16 $claim_path 0x12 0x13
master_write_16 $claim_path 0x14 0x232b
master_write_16 $claim_path 0x16 0x2eb2
master_write_16 $claim_path 0x18 0x1e4f
master_write_16 $claim_path 0x1a 0x1148
master_write_16 $claim_path 0x1c 0x54d
master_write_16 $claim_path 0x1e 0x89e
master_write_16 $claim_path 0x20 0x366
master_write_16 $claim_path 0x22 0x854
master_write_16 $claim_path 0x24 0x1363
master_write_16 $claim_path 0x26 0x2eb6
master_write_16 $claim_path 0x28 0x35f6
master_write_16 $claim_path 0x2a 0x3121
master_write_16 $claim_path 0x2c 0x1d1a
master_write_16 $claim_path 0x2e 0x54a
master_write_16 $claim_path 0x30 0x1f86
master_write_16 $claim_path 0x32 0x29d9
master_write_16 $claim_path 0x34 0x1be3
master_write_16 $claim_path 0x36 0x7b7
master_write_16 $claim_path 0x38 0xa9a
master_write_16 $claim_path 0x3a 0x149b
master_write_16 $claim_path 0x3c 0x127c
master_write_16 $claim_path 0x3e 0xda3
master_write_16 $claim_path 0x40 0x5e3
master_write_16 $claim_path 0x42 0x465
master_write_16 $claim_path 0x44 0x84f
master_write_16 $claim_path 0x46 0xe3f
master_write_16 $claim_path 0x48 0xf72
master_write_16 $claim_path 0x4a 0xbd0
master_write_16 $claim_path 0x4c 0x4fc
master_write_16 $claim_path 0x4e 0x365
master_write_16 $claim_path 0x50 0x76a
master_write_16 $claim_path 0x52 0x804
master_write_16 $claim_path 0x54 0x7ba
master_write_16 $claim_path 0x56 0x549
master_write_16 $claim_path 0x58 0x400
master_write_16 $claim_path 0x5a 0x74
master_write_16 $claim_path 0x5c 0x5e7
master_write_16 $claim_path 0x5e 0x8ec
master_write_16 $claim_path 0x60 0xa9c
master_write_16 $claim_path 0x62 0x71a
master_write_16 $claim_path 0x64 0x46
master_write_16 $claim_path 0x66 0x682
master_write_16 $claim_path 0x68 0xb36
master_write_16 $claim_path 0x6a 0xd03
master_write_16 $claim_path 0x6c 0xc6f
master_write_16 $claim_path 0x6e 0xbce
master_write_16 $claim_path 0x70 0xbce
master_write_16 $claim_path 0x72 0xda5
master_write_16 $claim_path 0x74 0x100a
master_write_16 $claim_path 0x76 0x1149
master_write_16 $claim_path 0x78 0xf71
master_write_16 $claim_path 0x7a 0xb36
master_write_16 $claim_path 0x7c 0x964
master_write_16 $claim_path 0x7e 0x767
master_write_16 $claim_path 0x80 0x965
master_write_16 $claim_path 0x82 0x1143
master_write_16 $claim_path 0x84 0x276d
master_write_16 $claim_path 0x86 0x46f5
master_write_16 $claim_path 0x88 0x4f74
master_write_16 $claim_path 0x8a 0x3122
master_write_16 $claim_path 0x8c 0x76
master_write_16 $claim_path 0x8e 0x3faf
master_write_16 $claim_path 0x90 0x62de
master_write_16 $claim_path 0x92 0x5e07
master_write_16 $claim_path 0x94 0x3fac
master_write_16 $claim_path 0x96 0x8ef
master_write_16 $claim_path 0x98 0x1e51
master_write_16 $claim_path 0x9a 0x3121
master_write_16 $claim_path 0x9c 0x245f
master_write_16 $claim_path 0x9e 0x1280
master_write_16 $claim_path 0xa0 0x368
master_write_16 $claim_path 0xa2 0xed6
master_write_16 $claim_path 0xa4 0x9ff
master_write_16 $claim_path 0xa6 0xc6b
master_write_16 $claim_path 0xa8 0x15d1
master_write_16 $claim_path 0xaa 0x276d
master_write_16 $claim_path 0xac 0x311c
master_write_16 $claim_path 0xae 0x2c4a
master_write_16 $claim_path 0xb0 0x1aa8
master_write_16 $claim_path 0xb2 0x545
master_write_16 $claim_path 0xb4 0x1e56
master_write_16 $claim_path 0xb6 0x2767
master_write_16 $claim_path 0xb8 0x1aae
master_write_16 $claim_path 0xba 0x682
master_write_16 $claim_path 0xbc 0xd09
master_write_16 $claim_path 0xbe 0x183d
master_write_16 $claim_path 0xc0 0x15d4
master_write_16 $claim_path 0xc2 0xe3d
master_write_16 $claim_path 0xc4 0x6cd
master_write_16 $claim_path 0xc6 0x462
master_write_16 $claim_path 0xc8 0x13
master_write_16 $claim_path 0xca 0x1df
master_write_16 $claim_path 0xcc 0x76b
master_write_16 $claim_path 0xce 0x961
master_write_16 $claim_path 0xd0 0xb34
master_write_16 $claim_path 0xd2 0x636
master_write_16 $claim_path 0xd4 0x3fc
master_write_16 $claim_path 0xd6 0x251
master_write_16 $claim_path 0xd8 0x809
master_write_16 $claim_path 0xda 0xa97
master_write_16 $claim_path 0xdc 0x964
master_write_16 $claim_path 0xde 0x3ff
master_write_16 $claim_path 0xe0 0x2c8
master_write_16 $claim_path 0xe2 0xa9a
master_write_16 $claim_path 0xe4 0xbce
master_write_16 $claim_path 0xe6 0x806
master_write_16 $claim_path 0xe8 0xb2
master_write_16 $claim_path 0xea 0x680
master_write_16 $claim_path 0xec 0xa9a
master_write_16 $claim_path 0xee 0xd04
master_write_16 $claim_path 0xf0 0xb38
master_write_16 $claim_path 0xf2 0xb30
master_write_16 $claim_path 0xf4 0xb3a
master_write_16 $claim_path 0xf6 0xd00
master_write_16 $claim_path 0xf8 0xe42
master_write_16 $claim_path 0xfa 0xed5
master_write_16 $claim_path 0xfc 0x1010
master_write_16 $claim_path 0xfe 0xa99
master_write_16 $claim_path 0x100 0x8ee
master_write_16 $claim_path 0x102 0xc6c
master_write_16 $claim_path 0x104 0xd05
master_write_16 $claim_path 0x106 0x1147
master_write_16 $claim_path 0x108 0x1278
master_write_16 $claim_path 0x10a 0x259d
master_write_16 $claim_path 0x10c 0x4bcd
master_write_16 $claim_path 0x10e 0x4f79
master_write_16 $claim_path 0x110 0x2768
master_write_16 $claim_path 0x112 0x8a2
master_write_16 $claim_path 0x114 0x4f71
master_write_16 $claim_path 0x116 0x62e4
master_write_16 $claim_path 0x118 0x5dfe
master_write_16 $claim_path 0x11a 0x3125
master_write_16 $claim_path 0x11c 0x76f
master_write_16 $claim_path 0x11e 0x29d4
master_write_16 $claim_path 0x120 0x35fc
master_write_16 $claim_path 0x122 0x20bc
master_write_16 $claim_path 0x124 0xb38
master_write_16 $claim_path 0x126 0x1369
master_write_16 $claim_path 0x128 0x1498
master_write_16 $claim_path 0x12a 0xf78
master_write_16 $claim_path 0x12c 0x10a5
master_write_16 $claim_path 0x12e 0x170e
master_write_16 $claim_path 0x130 0x245c
master_write_16 $claim_path 0x132 0x29df
master_write_16 $claim_path 0x134 0x2591
master_write_16 $claim_path 0x136 0xda8
master_write_16 $claim_path 0x138 0x10ae
master_write_16 $claim_path 0x13a 0x21f2
master_write_16 $claim_path 0x13c 0x21f6
master_write_16 $claim_path 0x13e 0x1146
master_write_16 $claim_path 0x140 0x426
master_write_16 $claim_path 0x142 0x1977
master_write_16 $claim_path 0x144 0x1aae
master_write_16 $claim_path 0x146 0x1361
master_write_16 $claim_path 0x148 0x8a5
master_write_16 $claim_path 0x14a 0x1aa
master_write_16 $claim_path 0x14c 0x10f
master_write_16 $claim_path 0x14e 0x54f
master_write_16 $claim_path 0x150 0x1a0
master_write_16 $claim_path 0x152 0x766
master_write_16 $claim_path 0x154 0xb37
master_write_16 $claim_path 0x156 0xda2
master_write_16 $claim_path 0x158 0x9fd
master_write_16 $claim_path 0x15a 0x54d
master_write_16 $claim_path 0x15c 0x3b6
master_write_16 $claim_path 0x15e 0x960
master_write_16 $claim_path 0x160 0xbd1
master_write_16 $claim_path 0x162 0xa98
master_write_16 $claim_path 0x164 0x401
master_write_16 $claim_path 0x166 0x5e7
master_write_16 $claim_path 0x168 0xda0
master_write_16 $claim_path 0x16a 0xda2
master_write_16 $claim_path 0x16c 0x8ef
master_write_16 $claim_path 0x16e 0xef
master_write_16 $claim_path 0x170 0x9fd
master_write_16 $claim_path 0x172 0xf74
master_write_16 $claim_path 0x174 0xe3f
master_write_16 $claim_path 0x176 0xa97
master_write_16 $claim_path 0x178 0x964
master_write_16 $claim_path 0x17a 0x89f
master_write_16 $claim_path 0x17c 0x964
master_write_16 $claim_path 0x17e 0xb33
master_write_16 $claim_path 0x180 0xd09
master_write_16 $claim_path 0x182 0x100b
master_write_16 $claim_path 0x184 0xedc
master_write_16 $claim_path 0x186 0xd9f
master_write_16 $claim_path 0x188 0xd06
master_write_16 $claim_path 0x18a 0xa9c
master_write_16 $claim_path 0x18c 0xb31
master_write_16 $claim_path 0x18e 0xc6f
master_write_16 $claim_path 0x190 0x183d
master_write_16 $claim_path 0x192 0x3d42
master_write_16 $claim_path 0x194 0x592b
master_write_16 $claim_path 0x196 0x3867
master_write_16 $claim_path 0x198 0xed7
master_write_16 $claim_path 0x19a 0x338b
master_write_16 $claim_path 0x19c 0x5e06
master_write_16 $claim_path 0x19e 0x5e03
master_write_16 $claim_path 0x1a0 0x421c
master_write_16 $claim_path 0x1a2 0x76b
master_write_16 $claim_path 0x1a4 0x1d1a
master_write_16 $claim_path 0x1a6 0x3121
master_write_16 $claim_path 0x1a8 0x21f2
master_write_16 $claim_path 0x1aa 0xe41
master_write_16 $claim_path 0x1ac 0xc6f
master_write_16 $claim_path 0x1ae 0x15d0
master_write_16 $claim_path 0x1b0 0xda3
master_write_16 $claim_path 0x1b2 0x100f
master_write_16 $claim_path 0x1b4 0x1365
master_write_16 $claim_path 0x1b6 0x20be
master_write_16 $claim_path 0x1b8 0x276a
master_write_16 $claim_path 0x1ba 0x2462
master_write_16 $claim_path 0x1bc 0x127c
master_write_16 $claim_path 0x1be 0xb34
master_write_16 $claim_path 0x1c0 0x1d1a
master_write_16 $claim_path 0x1c2 0x1f86
master_write_16 $claim_path 0x1c4 0x1011
master_write_16 $claim_path 0x1c6 0x2a5
master_write_16 $claim_path 0x1c8 0x15d1
master_write_16 $claim_path 0x1ca 0x1840
master_write_16 $claim_path 0x1cc 0x1010
master_write_16 $claim_path 0x1ce 0x851
master_write_16 $claim_path 0x1d0 0x14e
master_write_16 $claim_path 0x1d2 0x18d
master_write_16 $claim_path 0x1d4 0x2f5
master_write_16 $claim_path 0x1d6 0xf
master_write_16 $claim_path 0x1d8 0x594
master_write_16 $claim_path 0x1da 0x8ef
master_write_16 $claim_path 0x1dc 0xf75
master_write_16 $claim_path 0x1de 0xd9f
master_write_16 $claim_path 0x1e0 0xa9c
master_write_16 $claim_path 0x1e2 0x9e
master_write_16 $claim_path 0x1e4 0x89f
master_write_16 $claim_path 0x1e6 0xd05
master_write_16 $claim_path 0x1e8 0xd09
master_write_16 $claim_path 0x1ea 0x595


#Reset DDR3 read master

master_write_16 $claim_path 0x400c 0x1


#Reset DDR3 read master

master_write_16 $claim_path 0x500c 0x1


#Configure DDR3 read master

master_write_16 $claim_path 0x4000 0x0
master_write_16 $claim_path 0x4002 0x100
master_write_16 $claim_path 0x4004 0x2
master_write_16 $claim_path 0x4006 0x186a


#Configure LPCenc

master_write_16 $claim_path 0x4010 0xf0


#Configure DDR3 write master

master_write_16 $claim_path 0x5000 0x0
master_write_16 $claim_path 0x5002 0x100
master_write_16 $claim_path 0x5004 0x2
master_write_16 $claim_path 0x5006 0x186a


#Start write master

master_write_16 $claim_path 0x5008 0x1


#Start read master

master_write_16 $claim_path 0x4008 0x1
