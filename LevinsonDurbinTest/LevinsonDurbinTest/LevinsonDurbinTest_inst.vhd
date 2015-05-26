	component LevinsonDurbinTest is
		port (
			clk_clk  : in  std_logic                    := 'X'; -- clk
			leds_led : out std_logic_vector(7 downto 0)         -- led
		);
	end component LevinsonDurbinTest;

	u0 : component LevinsonDurbinTest
		port map (
			clk_clk  => CONNECTED_TO_clk_clk,  --  clk.clk
			leds_led => CONNECTED_TO_leds_led  -- leds.led
		);

