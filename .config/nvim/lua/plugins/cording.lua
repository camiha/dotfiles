local cording = {
	{
		"cohama/lexima.vim",
		config = function()
		end,
	},
	{
		"tpope/vim-surround",
	},
	{
		"mattn/emmet-vim",
	},
	"JoosepAlviste/nvim-ts-context-commentstring",
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
     			})
		end,
		lazy = false,
	},
}

return { cording }
