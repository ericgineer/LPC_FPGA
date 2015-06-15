	component top_LPC_FPGA is
		port (
			avmm_master_control_rm_fixed_location : out   std_logic;                                        -- rm_fixed_location
			avmm_master_control_rm_read_base      : out   std_logic_vector(31 downto 0);                    -- rm_read_base
			avmm_master_control_rm_read_length    : out   std_logic_vector(31 downto 0);                    -- rm_read_length
			avmm_master_control_rm_go             : out   std_logic;                                        -- rm_go
			avmm_master_control_rm_done           : in    std_logic                     := 'X';             -- rm_done
			avmm_master_control_wm_fixed_location : out   std_logic;                                        -- wm_fixed_location
			avmm_master_control_wm_write_base     : out   std_logic_vector(31 downto 0);                    -- wm_write_base
			avmm_master_control_wm_write_length   : out   std_logic_vector(31 downto 0);                    -- wm_write_length
			avmm_master_control_wm_go             : out   std_logic;                                        -- wm_go
			avmm_master_control_wm_done           : in    std_logic                     := 'X';             -- wm_done
			clk_clk                               : in    std_logic                     := 'X';             -- clk
			memory_mem_a                          : out   std_logic_vector(12 downto 0);                    -- mem_a
			memory_mem_ba                         : out   std_logic_vector(2 downto 0);                     -- mem_ba
			memory_mem_ck                         : out   std_logic_vector(0 downto 0);                     -- mem_ck
			memory_mem_ck_n                       : out   std_logic_vector(0 downto 0);                     -- mem_ck_n
			memory_mem_cke                        : out   std_logic_vector(0 downto 0);                     -- mem_cke
			memory_mem_cs_n                       : out   std_logic_vector(0 downto 0);                     -- mem_cs_n
			memory_mem_dm                         : out   std_logic_vector(1 downto 0);                     -- mem_dm
			memory_mem_ras_n                      : out   std_logic_vector(0 downto 0);                     -- mem_ras_n
			memory_mem_cas_n                      : out   std_logic_vector(0 downto 0);                     -- mem_cas_n
			memory_mem_we_n                       : out   std_logic_vector(0 downto 0);                     -- mem_we_n
			memory_mem_reset_n                    : out   std_logic;                                        -- mem_reset_n
			memory_mem_dq                         : inout std_logic_vector(15 downto 0) := (others => 'X'); -- mem_dq
			memory_mem_dqs                        : inout std_logic_vector(1 downto 0)  := (others => 'X'); -- mem_dqs
			memory_mem_dqs_n                      : inout std_logic_vector(1 downto 0)  := (others => 'X'); -- mem_dqs_n
			memory_mem_odt                        : out   std_logic_vector(0 downto 0);                     -- mem_odt
			oct_rzqin                             : in    std_logic                     := 'X';             -- rzqin
			read_master_control_fixed_location    : in    std_logic                     := 'X';             -- fixed_location
			read_master_control_read_base         : in    std_logic_vector(31 downto 0) := (others => 'X'); -- read_base
			read_master_control_read_length       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- read_length
			read_master_control_go                : in    std_logic                     := 'X';             -- go
			read_master_control_done              : out   std_logic;                                        -- done
			read_master_control_early_done        : out   std_logic;                                        -- early_done
			read_master_stream_read_buffer        : in    std_logic                     := 'X';             -- read_buffer
			read_master_stream_buffer_output_data : out   std_logic_vector(15 downto 0);                    -- buffer_output_data
			read_master_stream_data_available     : out   std_logic;                                        -- data_available
			status_local_init_done                : out   std_logic;                                        -- local_init_done
			status_local_cal_success              : out   std_logic;                                        -- local_cal_success
			status_local_cal_fail                 : out   std_logic;                                        -- local_cal_fail
			write_master_control_fixed_location   : in    std_logic                     := 'X';             -- fixed_location
			write_master_control_write_base       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- write_base
			write_master_control_write_length     : in    std_logic_vector(31 downto 0) := (others => 'X'); -- write_length
			write_master_control_go               : in    std_logic                     := 'X';             -- go
			write_master_control_done             : out   std_logic;                                        -- done
			write_master_stream_write_buffer      : in    std_logic                     := 'X';             -- write_buffer
			write_master_stream_buffer_input_data : in    std_logic_vector(15 downto 0) := (others => 'X'); -- buffer_input_data
			write_master_stream_buffer_full       : out   std_logic                                         -- buffer_full
		);
	end component top_LPC_FPGA;

	u0 : component top_LPC_FPGA
		port map (
			avmm_master_control_rm_fixed_location => CONNECTED_TO_avmm_master_control_rm_fixed_location, --  avmm_master_control.rm_fixed_location
			avmm_master_control_rm_read_base      => CONNECTED_TO_avmm_master_control_rm_read_base,      --                     .rm_read_base
			avmm_master_control_rm_read_length    => CONNECTED_TO_avmm_master_control_rm_read_length,    --                     .rm_read_length
			avmm_master_control_rm_go             => CONNECTED_TO_avmm_master_control_rm_go,             --                     .rm_go
			avmm_master_control_rm_done           => CONNECTED_TO_avmm_master_control_rm_done,           --                     .rm_done
			avmm_master_control_wm_fixed_location => CONNECTED_TO_avmm_master_control_wm_fixed_location, --                     .wm_fixed_location
			avmm_master_control_wm_write_base     => CONNECTED_TO_avmm_master_control_wm_write_base,     --                     .wm_write_base
			avmm_master_control_wm_write_length   => CONNECTED_TO_avmm_master_control_wm_write_length,   --                     .wm_write_length
			avmm_master_control_wm_go             => CONNECTED_TO_avmm_master_control_wm_go,             --                     .wm_go
			avmm_master_control_wm_done           => CONNECTED_TO_avmm_master_control_wm_done,           --                     .wm_done
			clk_clk                               => CONNECTED_TO_clk_clk,                               --                  clk.clk
			memory_mem_a                          => CONNECTED_TO_memory_mem_a,                          --               memory.mem_a
			memory_mem_ba                         => CONNECTED_TO_memory_mem_ba,                         --                     .mem_ba
			memory_mem_ck                         => CONNECTED_TO_memory_mem_ck,                         --                     .mem_ck
			memory_mem_ck_n                       => CONNECTED_TO_memory_mem_ck_n,                       --                     .mem_ck_n
			memory_mem_cke                        => CONNECTED_TO_memory_mem_cke,                        --                     .mem_cke
			memory_mem_cs_n                       => CONNECTED_TO_memory_mem_cs_n,                       --                     .mem_cs_n
			memory_mem_dm                         => CONNECTED_TO_memory_mem_dm,                         --                     .mem_dm
			memory_mem_ras_n                      => CONNECTED_TO_memory_mem_ras_n,                      --                     .mem_ras_n
			memory_mem_cas_n                      => CONNECTED_TO_memory_mem_cas_n,                      --                     .mem_cas_n
			memory_mem_we_n                       => CONNECTED_TO_memory_mem_we_n,                       --                     .mem_we_n
			memory_mem_reset_n                    => CONNECTED_TO_memory_mem_reset_n,                    --                     .mem_reset_n
			memory_mem_dq                         => CONNECTED_TO_memory_mem_dq,                         --                     .mem_dq
			memory_mem_dqs                        => CONNECTED_TO_memory_mem_dqs,                        --                     .mem_dqs
			memory_mem_dqs_n                      => CONNECTED_TO_memory_mem_dqs_n,                      --                     .mem_dqs_n
			memory_mem_odt                        => CONNECTED_TO_memory_mem_odt,                        --                     .mem_odt
			oct_rzqin                             => CONNECTED_TO_oct_rzqin,                             --                  oct.rzqin
			read_master_control_fixed_location    => CONNECTED_TO_read_master_control_fixed_location,    --  read_master_control.fixed_location
			read_master_control_read_base         => CONNECTED_TO_read_master_control_read_base,         --                     .read_base
			read_master_control_read_length       => CONNECTED_TO_read_master_control_read_length,       --                     .read_length
			read_master_control_go                => CONNECTED_TO_read_master_control_go,                --                     .go
			read_master_control_done              => CONNECTED_TO_read_master_control_done,              --                     .done
			read_master_control_early_done        => CONNECTED_TO_read_master_control_early_done,        --                     .early_done
			read_master_stream_read_buffer        => CONNECTED_TO_read_master_stream_read_buffer,        --   read_master_stream.read_buffer
			read_master_stream_buffer_output_data => CONNECTED_TO_read_master_stream_buffer_output_data, --                     .buffer_output_data
			read_master_stream_data_available     => CONNECTED_TO_read_master_stream_data_available,     --                     .data_available
			status_local_init_done                => CONNECTED_TO_status_local_init_done,                --               status.local_init_done
			status_local_cal_success              => CONNECTED_TO_status_local_cal_success,              --                     .local_cal_success
			status_local_cal_fail                 => CONNECTED_TO_status_local_cal_fail,                 --                     .local_cal_fail
			write_master_control_fixed_location   => CONNECTED_TO_write_master_control_fixed_location,   -- write_master_control.fixed_location
			write_master_control_write_base       => CONNECTED_TO_write_master_control_write_base,       --                     .write_base
			write_master_control_write_length     => CONNECTED_TO_write_master_control_write_length,     --                     .write_length
			write_master_control_go               => CONNECTED_TO_write_master_control_go,               --                     .go
			write_master_control_done             => CONNECTED_TO_write_master_control_done,             --                     .done
			write_master_stream_write_buffer      => CONNECTED_TO_write_master_stream_write_buffer,      --  write_master_stream.write_buffer
			write_master_stream_buffer_input_data => CONNECTED_TO_write_master_stream_buffer_input_data, --                     .buffer_input_data
			write_master_stream_buffer_full       => CONNECTED_TO_write_master_stream_buffer_full        --                     .buffer_full
		);

