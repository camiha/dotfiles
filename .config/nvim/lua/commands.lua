vim.cmd("command! Q q!")

vim.cmd("command! R source $MYVIMRC")
vim.cmd("command! PI :PackerInstall")
vim.cmd("command! PS :PackerSync")

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "plugins.lua" },
	command = "PackerCompile",
})
