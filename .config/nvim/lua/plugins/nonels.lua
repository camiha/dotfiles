local none_ls = {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "vim-test/vim-test", "davidmh/cspell.nvim" },
	config = function()
		local cspell = require("cspell")
		require("null-ls").setup({
			sources = {
				cspell.diagnostics,
			},
		})
	end,
}

return { none_ls }
