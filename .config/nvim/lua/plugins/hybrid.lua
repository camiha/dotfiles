local hybrid = {
	"camiha/vim-hybrid",
	-- "rktjmp/lush.nvim",
	-- "metalelf0/jellybeans-nvim",
	config = function()
		vim.cmd("colorscheme hybrid")
		-- vim.cmd("colorscheme jellybeans-nvim")
		vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
	end,
}

return { hybrid }
