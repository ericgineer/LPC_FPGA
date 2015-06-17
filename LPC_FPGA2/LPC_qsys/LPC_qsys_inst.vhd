	component LPC_qsys is
		port (
			clk_clk                  : in    std_logic                     := 'X';             -- clk
			memory_mem_a             : out   std_logic_vector(12 downto 0);                    -- mem_a
			memory_mem_ba            : out   std_logic_vector(2 downto 0);                     -- mem_ba
			memory_mem_ck            : out   std_logic_vector(0 downto 0);                     -- mem_ck
			memory_mem_ck_n          : out   std_logic_vector(0 downto 0);                     -- mem_ck_n
			memory_mem_cke           : out   std_logic_vector(0 downto 0);                     -- mem_cke
			memory_mem_cs_n          : out   std_logic_vector(0 downto 0);                     -- mem_cs_n
			memory_mem_dm            : out   std_logic_vector(1 downto 0);                     -- mem_dm
			memory_mem_ras_n         : out   std_logic_vector(0 downto 0);                     -- mem_ras_n
			memory_mem_cas_n         : out   std_logic_vector(0 downto 0);                     -- mem_cas_n
			memory_mem_we_n          : out   std_logic_vector(0 downto 0);                     -- mem_we_n
			memory_mem_reset_n       : out   std_logic;                                        -- mem_reset_n
			memory_mem_dq            : inout std_logic_vector(15 downto 0) := (others => 'X'); -- mem_dq
			memory_mem_dqs           : inout std_logic_vector(1 downto 0)  := (others => 'X'); -- mem_dqs
			memory_mem_dqs_n         : inout std_logic_vector(1 downto 0)  := (others => 'X'); -- mem_dqs_n
			memory_mem_odt           : out   std_logic_vector(0 downto 0);                     -- mem_odt
			oct_rzqin                : in    std_logic                     := 'X';             -- rzqin
			read_master_stream_d_out : out   std_logic_vector(15 downto 0);                    -- d_out
			read_master_stream_d_clk : out   std_logic;                                        -- d_clk
			read_master_stream_vout  : out   std_logic;                                        -- vout
			status_local_init_done   : out   std_logic;                                        -- local_init_done
			status_local_cal_success : out   std_logic;                                        -- local_cal_success
			status_local_cal_fail    : out   std_logic;                                        -- local_cal_fail
			write_master_stream_d_in : in    std_logic_vector(15 downto 0) := (others => 'X'); -- d_in
			write_master_stream_v    : in    std_logic                     := 'X'              -- v
		);
	end component LPC_qsys;

	u0 : component LPC_qsys
		port map (
			clk_clk                  => CONNECTED_TO_clk_clk,                  --                 clk.clk
			memory_mem_a             => CONNECTED_TO_memory_mem_a,             --              memory.mem_a
			memory_mem_ba            => CONNECTED_TO_memory_mem_ba,            --                    .mem_ba
			memory_mem_ck            => CONNECTED_TO_memory_mem_ck,            --                    .mem_ck
			memory_mem_ck_n          => CONNECTED_TO_memory_mem_ck_n,          --                    .mem_ck_n
			memory_mem_cke           => CONNECTED_TO_memory_mem_cke,           --                    .mem_cke
			memory_mem_cs_n          => CONNECTED_TO_memory_mem_cs_n,          --                    .mem_cs_n
			memory_mem_dm            => CONNECTED_TO_memory_mem_dm,            --                    .mem_dm
			memory_mem_ras_n         => CONNECTED_TO_memory_mem_ras_n,         --                    .mem_ras_n
			memory_mem_cas_n         => CONNECTED_TO_memory_mem_cas_n,         --                    .mem_cas_n
			memory_mem_we_n          => CONNECTED_TO_memory_mem_we_n,          --                    .mem_we_n
			memory_mem_reset_n       => CONNECTED_TO_memory_mem_reset_n,       --                    .mem_reset_n
			memory_mem_dq            => CONNECTED_TO_memory_mem_dq,            --                    .mem_dq
			memory_mem_dqs           => CONNECTED_TO_memory_mem_dqs,           --                    .mem_dqs
			memory_mem_dqs_n         => CONNECTED_TO_memory_mem_dqs_n,         --                    .mem_dqs_n
			memory_mem_odt           => CONNECTED_TO_memory_mem_odt,           --                    .mem_odt
			oct_rzqin                => CONNECTED_TO_oct_rzqin,                --                 oct.rzqin
			read_master_stream_d_out => CONNECTED_TO_read_master_stream_d_out, --  read_master_stream.d_out
			read_master_stream_d_clk => CONNECTED_TO_read_master_stream_d_clk, --                    .d_clk
			read_master_stream_vout  => CONNECTED_TO_read_master_stream_vout,  --                    .vout
			status_local_init_done   => CONNECTED_TO_status_local_init_done,   --              status.local_init_done
			status_local_cal_success => CONNECTED_TO_status_local_cal_success, --                    .local_cal_success
			status_local_cal_fail    => CONNECTED_TO_status_local_cal_fail,    --                    .local_cal_fail
			write_master_stream_d_in => CONNECTED_TO_write_master_stream_d_in, -- write_master_stream.d_in
			write_master_stream_v    => CONNECTED_TO_write_master_stream_v     --                    .v
		);

