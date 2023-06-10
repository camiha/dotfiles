vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- views
	use({ "cyamy/vim-hybrid", opt = true })
	use({
		"nvim-lualine/lualine.nvim",
		opt = true,
		requires = {
			"nvim-tree/nvim-web-devicons",
			opt = true,
		},
	})
	-- cording utils (from init.vim)

	use({ "tpope/vim-surround", opt = true })
	use({ "tpope/vim-sleuth", opt = true })
	use({ "nathanaelkane/vim-indent-guides", opt = true })
	use({ "andymass/vim-matchup", opt = true })
	use({ "mattn/emmet-vim", opt = true })

	-- cording utils (lua)
	use({
		"numToStr/Comment.nvim",
		opt = true,
		config = function()
			require("Comment").setup({
				---LHS of toggle mappings in NORMAL mode
				toggler = {
					---Line-comment toggle keymap
					line = "cm",
					---Block-comment toggle keymap
					block = "gbc",
				},
				---LHS of operator-pending mappings in NORMAL and VISUAL mode
				opleader = {
					---Line-comment keymap
					line = "cmm",
					---Block-comment keymap
					block = "gb",
				},
			})
		end,
	})

	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		opt = true,
		requires = {
			"nvim-lua/pleanry.nvim",
		},
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		opt = true,
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- lsp
	use("neovim/nvim-lspconfig")
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	})

	-- completion
	use({ "hrsh7th/nvim-cmp", opt = true })
	use({ "hrsh7th/cmp-nvim-lsp", opt = true, requires = { "neovim/nvim-lspconfig", "hrsh7th/nvim-cmp" } })
	use({ "hrsh7th/cmp-buffer", opt = true, requires = { "hrsh7th/nvim-cmp" } })
	use({ "hrsh7th/cmp-path", opt = true, requires = { "hrsh7th/nvim-cmp" } })
	use({ "hrsh7th/cmp-cmdline", opt = true, requires = { "hrsh7th/nvim-cmp" } })

	use({
		"jose-elias-alvarez/null-ls.nvim",
		opt = true,
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({
		"glepnir/lspsaga.nvim",
		opt = true,
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	use({ "onsails/lspkind.nvim", opt = true })

	use({
		"nvim-neo-tree/neo-tree.nvim",
		opt = true,
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})

	-- extra
	use({ "github/copilot.vim", opt = true })
	use({ "dstein64/vim-startuptime", opt = true })
end)
