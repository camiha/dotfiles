local telescope = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git<cr>" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
		{ "<leader>fu", "<cmd>Telescope buffers<cr>" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>" },
	},
	setup = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules", ".git", ".DS_Store" },
				mappings = {
					i = {
						["<esc>"] = require("telescope.actions").close,
					},
				},
			},
			context_commentstring = {
				config = {
					javascript = {
						__default = "// %s",
						jsx_element = "{/* %s */}",
						jsx_fragment = "{/* %s */}",
						jsx_attribute = "// %s",
						comment = "// %s",
					},
					typescript = { __default = "// %s", __multiline = "/* %s */" },
				},
			},
		})
	end,
}

return { telescope }
