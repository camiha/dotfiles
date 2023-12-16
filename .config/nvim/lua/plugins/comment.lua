local comment = {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()
	end,
	lazy = true,
}

return { comment }
