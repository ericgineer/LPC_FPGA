	component LPC_qsys is
		port (
			clk_clk                      : in  std_logic                     := 'X';             -- clk
			lpcdec_v                     : in  std_logic                     := 'X';             -- v
			lpcdec_voiced                : in  std_logic                     := 'X';             -- voiced
			lpcdec_pulserate             : in  std_logic_vector(15 downto 0) := (others => 'X'); -- pulserate
			lpcdec_lpcrate               : in  std_logic_vector(15 downto 0) := (others => 'X'); -- lpcrate
			lpcdec_a0                    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- a0
			lpcdec_a1                    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- a1
			lpcdec_a2                    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- a2
			lpcdec_a3                    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- a3
			lpcdec_a4                    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- a4
			lpcdec_a5                    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- a5
			lpcdec_a6                    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- a6
			lpcdec_a7                    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- a7
			lpcdec_a8                    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- a8
			lpcdec_a9                    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- a9
			lpcdec_a10                   : in  std_logic_vector(15 downto 0) := (others => 'X'); -- a10
			lpcdec_synth                 : out std_logic_vector(15 downto 0);                    -- synth
			lpcdec_vout                  : out std_logic;                                        -- vout
			lpcdec_rst                   : in  std_logic                     := 'X';             -- rst
			lpcenc_v                     : in  std_logic                     := 'X';             -- v
			lpcenc_voiced                : out std_logic;                                        -- voiced
			lpcenc_a0                    : out std_logic_vector(15 downto 0);                    -- a0
			lpcenc_a1                    : out std_logic_vector(15 downto 0);                    -- a1
			lpcenc_a2                    : out std_logic_vector(15 downto 0);                    -- a2
			lpcenc_a3                    : out std_logic_vector(15 downto 0);                    -- a3
			lpcenc_a4                    : out std_logic_vector(15 downto 0);                    -- a4
			lpcenc_a5                    : out std_logic_vector(15 downto 0);                    -- a5
			lpcenc_a6                    : out std_logic_vector(15 downto 0);                    -- a6
			lpcenc_a7                    : out std_logic_vector(15 downto 0);                    -- a7
			lpcenc_a8                    : out std_logic_vector(15 downto 0);                    -- a8
			lpcenc_a9                    : out std_logic_vector(15 downto 0);                    -- a9
			lpcenc_a10                   : out std_logic_vector(15 downto 0);                    -- a10
			lpcenc_vout                  : out std_logic;                                        -- vout
			lpcenc_x                     : in  std_logic_vector(15 downto 0) := (others => 'X'); -- x
			lpcenc_d_clk                 : in  std_logic                     := 'X';             -- d_clk
			lpcenc_freq_count            : out std_logic_vector(15 downto 0);                    -- freq_count
			lpcenc_rst                   : in  std_logic                     := 'X';             -- rst
			read_master_stream_d_out     : out std_logic_vector(15 downto 0);                    -- d_out
			read_master_stream_d_clk     : out std_logic;                                        -- d_clk
			read_master_stream_vout      : out std_logic;                                        -- vout
			read_master_stream_d_rst     : out std_logic;                                        -- d_rst
			write_master_stream_d_in     : in  std_logic_vector(15 downto 0) := (others => 'X'); -- d_in
			write_master_stream_v        : in  std_logic                     := 'X';             -- v
			write_master_stream_d_in_clk : in  std_logic                     := 'X';             -- d_in_clk
			lpc_clk_clk                  : out std_logic                                         -- clk
		);
	end component LPC_qsys;

	u0 : component LPC_qsys
		port map (
			clk_clk                      => CONNECTED_TO_clk_clk,                      --                 clk.clk
			lpcdec_v                     => CONNECTED_TO_lpcdec_v,                     --              lpcdec.v
			lpcdec_voiced                => CONNECTED_TO_lpcdec_voiced,                --                    .voiced
			lpcdec_pulserate             => CONNECTED_TO_lpcdec_pulserate,             --                    .pulserate
			lpcdec_lpcrate               => CONNECTED_TO_lpcdec_lpcrate,               --                    .lpcrate
			lpcdec_a0                    => CONNECTED_TO_lpcdec_a0,                    --                    .a0
			lpcdec_a1                    => CONNECTED_TO_lpcdec_a1,                    --                    .a1
			lpcdec_a2                    => CONNECTED_TO_lpcdec_a2,                    --                    .a2
			lpcdec_a3                    => CONNECTED_TO_lpcdec_a3,                    --                    .a3
			lpcdec_a4                    => CONNECTED_TO_lpcdec_a4,                    --                    .a4
			lpcdec_a5                    => CONNECTED_TO_lpcdec_a5,                    --                    .a5
			lpcdec_a6                    => CONNECTED_TO_lpcdec_a6,                    --                    .a6
			lpcdec_a7                    => CONNECTED_TO_lpcdec_a7,                    --                    .a7
			lpcdec_a8                    => CONNECTED_TO_lpcdec_a8,                    --                    .a8
			lpcdec_a9                    => CONNECTED_TO_lpcdec_a9,                    --                    .a9
			lpcdec_a10                   => CONNECTED_TO_lpcdec_a10,                   --                    .a10
			lpcdec_synth                 => CONNECTED_TO_lpcdec_synth,                 --                    .synth
			lpcdec_vout                  => CONNECTED_TO_lpcdec_vout,                  --                    .vout
			lpcdec_rst                   => CONNECTED_TO_lpcdec_rst,                   --                    .rst
			lpcenc_v                     => CONNECTED_TO_lpcenc_v,                     --              lpcenc.v
			lpcenc_voiced                => CONNECTED_TO_lpcenc_voiced,                --                    .voiced
			lpcenc_a0                    => CONNECTED_TO_lpcenc_a0,                    --                    .a0
			lpcenc_a1                    => CONNECTED_TO_lpcenc_a1,                    --                    .a1
			lpcenc_a2                    => CONNECTED_TO_lpcenc_a2,                    --                    .a2
			lpcenc_a3                    => CONNECTED_TO_lpcenc_a3,                    --                    .a3
			lpcenc_a4                    => CONNECTED_TO_lpcenc_a4,                    --                    .a4
			lpcenc_a5                    => CONNECTED_TO_lpcenc_a5,                    --                    .a5
			lpcenc_a6                    => CONNECTED_TO_lpcenc_a6,                    --                    .a6
			lpcenc_a7                    => CONNECTED_TO_lpcenc_a7,                    --                    .a7
			lpcenc_a8                    => CONNECTED_TO_lpcenc_a8,                    --                    .a8
			lpcenc_a9                    => CONNECTED_TO_lpcenc_a9,                    --                    .a9
			lpcenc_a10                   => CONNECTED_TO_lpcenc_a10,                   --                    .a10
			lpcenc_vout                  => CONNECTED_TO_lpcenc_vout,                  --                    .vout
			lpcenc_x                     => CONNECTED_TO_lpcenc_x,                     --                    .x
			lpcenc_d_clk                 => CONNECTED_TO_lpcenc_d_clk,                 --                    .d_clk
			lpcenc_freq_count            => CONNECTED_TO_lpcenc_freq_count,            --                    .freq_count
			lpcenc_rst                   => CONNECTED_TO_lpcenc_rst,                   --                    .rst
			read_master_stream_d_out     => CONNECTED_TO_read_master_stream_d_out,     --  read_master_stream.d_out
			read_master_stream_d_clk     => CONNECTED_TO_read_master_stream_d_clk,     --                    .d_clk
			read_master_stream_vout      => CONNECTED_TO_read_master_stream_vout,      --                    .vout
			read_master_stream_d_rst     => CONNECTED_TO_read_master_stream_d_rst,     --                    .d_rst
			write_master_stream_d_in     => CONNECTED_TO_write_master_stream_d_in,     -- write_master_stream.d_in
			write_master_stream_v        => CONNECTED_TO_write_master_stream_v,        --                    .v
			write_master_stream_d_in_clk => CONNECTED_TO_write_master_stream_d_in_clk, --                    .d_in_clk
			lpc_clk_clk                  => CONNECTED_TO_lpc_clk_clk                   --             lpc_clk.clk
		);

