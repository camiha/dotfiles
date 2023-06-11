require("lspsaga").setup({
	preview = {
		lines_above = 0,
		lines_below = 10,
	},
	scroll_preview = {
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	request_timeout = 2000,

	-- See Customizing Lspsaga's Appearance
	-- For default options for each command, see below
	-- etc.
	ui = {
		code_action = "",
	},
})
