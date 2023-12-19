-- :Copilot auth
local copilot = {
	"zbirenbaum/copilot.lua",
	lazy = true,
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<C-a>"
				},
			},
			filetypes = {
				javascript = true,
				javascriptreact = true,
				typescript = true,
				typescriptreact = true,
				java = false,
			},
		})
		--    vim.keymap.set('i', '<Tab>', function()
		--      if require("copilot.suggestion").is_visible() then
		--        require("copilot.suggestion").accept()
		--      else
		--        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
		--      end
		--   end, { desc = "Super Tab" })
	end,
}

return { copilot }
