vim.cmd("command! Q q!")

vim.cmd("command! R source $MYVIMRC")
vim.cmd("command! PI :PackerInstall")
vim.cmd("command! PS :PackerSync")

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "plugins.lua" },
	command = "PackerCompile",
})

vim.cmd([[
augroup FileTypeAutocmd
  autocmd!
  autocmd BufNewFile,BufRead *.njk setlocal filetype=jinja
augroup END
]])

vim.cmd('command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files()')
