local neotree = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	lazy = true,
  keys = {{"<leader>v", "<cmd>Neotree reveal position=float<CR>"}},
	config = function()
		vim.keymap.set("n", "<Leader>b", "<cmd>Neotree reveal position=float<CR>")
	end,
}

return { neotree }
