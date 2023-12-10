local keymap = vim.keymap
vim.g.mapleader = " "

keymap.set("", " ", "<Nop>", { noremap = true, silent = true })
keymap.set("i", "jk", "<Esc>")
keymap.set("n", "<Leader>w", ":w<CR>")
keymap.set("n", "<Leader>q", ":q<CR>")

-- 挙動の調整
keymap.set("n", "Y", "y$")

-- インクリメント
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Move current line to up/down
-- https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
-- on windows
if vim.fn.has("windows") == 1 then
	keymap.set("n", "<C-j>", ":m .+1<CR>==")
	keymap.set("n", "<C-k>", ":m .-2<CR>==")
	keymap.set("v", "<C-j>", "'>+1<CR>gv=gv")
	keymap.set("v", "<C-k>", "'<-2<CR>gv=gv")
end
-- on mac
if vim.fn.has("macunix") == 1 then
	keymap.set("n", "∆", ":m .+1<CR>==")
	keymap.set("n", "˚", ":m .-2<CR>==")
	keymap.set("v", "∆", "'>+1<CR>gv=gv")
	keymap.set("v", "˚", "'<-2<CR>gv=gv")
end

vim.g.indent_guides_enable_on_vim_startup = 1