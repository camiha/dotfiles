local neotree = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		{
			"s1n7ax/nvim-window-picker",
			config = function()
				require("window-picker").setup({})
			end,
		},
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	lazy = false,
	keys = { { "<C-l>", "<cmd>Neotree reveal position=left<CR>" } },
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_by_name = {
						"node_modules",
						".git",
						".DS_Store",
					},
				},
			},
		})
	end,
}

return { neotree }
