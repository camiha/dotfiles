local toggleterm = {
	"akinsho/toggleterm.nvim",
	keys = {{"<Leader>j", "<cmd>ToggleTerm<CR>"}},
  lazy = false,
	config = function()
		require("toggleterm").setup()
	end,
}

return { toggleterm }
