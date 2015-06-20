	component LPC_qsys is
		port (
			clk_clk                  : in  std_logic                     := 'X';             -- clk
			read_master_stream_d_out : out std_logic_vector(15 downto 0);                    -- d_out
			read_master_stream_d_clk : out std_logic;                                        -- d_clk
			read_master_stream_vout  : out std_logic;                                        -- vout
			write_master_stream_d_in : in  std_logic_vector(15 downto 0) := (others => 'X'); -- d_in
			write_master_stream_v    : in  std_logic                     := 'X'              -- v
		);
	end component LPC_qsys;

	u0 : component LPC_qsys
		port map (
			clk_clk                  => CONNECTED_TO_clk_clk,                  --                 clk.clk
			read_master_stream_d_out => CONNECTED_TO_read_master_stream_d_out, --  read_master_stream.d_out
			read_master_stream_d_clk => CONNECTED_TO_read_master_stream_d_clk, --                    .d_clk
			read_master_stream_vout  => CONNECTED_TO_read_master_stream_vout,  --                    .vout
			write_master_stream_d_in => CONNECTED_TO_write_master_stream_d_in, -- write_master_stream.d_in
			write_master_stream_v    => CONNECTED_TO_write_master_stream_v     --                    .v
		);

