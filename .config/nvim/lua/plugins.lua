vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- views
	use({ "cyamy/vim-hybrid" })
	use({
		"nvim-lualine/lualine.nvim",

		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})
	-- cording utils (from init.vim)

	use({ "tpope/vim-surround" })
	use({ "tpope/vim-sleuth" })
	use({ "nathanaelkane/vim-indent-guides" })
	use({ "andymass/vim-matchup" })
	use({ "mattn/emmet-vim" })

	-- cording utils (lua)
	use({
		"numToStr/Comment.nvim",
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

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt" },
				-- fast_wrap = {
				-- 	map = "<C-b>",
				-- },
			})
		end,
	})

	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})

	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({
		"nvim-treesitter/nvim-treesitter",

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
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{
				"saadparwaiz1/cmp_luasnip",
				requires = {
					"L3MON4D3/LuaSnip",
					module = "luasnip",
				},
			},
		},
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({
		"glepnir/lspsaga.nvim",

		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	use({ "onsails/lspkind.nvim" })

	use({
		"nvim-neo-tree/neo-tree.nvim",

		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})

	-- languages
	use({ "Glench/Vim-Jinja2-Syntax" })

	-- extra
	use({ "github/copilot.vim" })
	use({ "folke/zen-mode.nvim" })
	use({ "dstein64/vim-startuptime" })
end)
