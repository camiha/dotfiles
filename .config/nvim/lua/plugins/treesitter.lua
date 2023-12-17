local treesitter = {
	"nvim-treesitter/nvim-treesitter",
	lazy = true,
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"rust",
				"lua",
				"vim",
				"astro",
				"javascript",
				"typescript",
				"tsx",
				"css",
				"scss",
				"json",
				"html",
				"markdown",
			},
			highlight = {
				enable = true,
			},
			additional_vim_regex_highlighting = false,
		})
	end,
}

return { treesitter }
