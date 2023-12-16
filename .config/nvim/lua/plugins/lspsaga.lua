local lspsaga = {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
			code_action = {
				lightbulb = {
					virtual_text = false
				},
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = true,
	cmd = { "Lspsaga" },
}

return { lspsaga }
