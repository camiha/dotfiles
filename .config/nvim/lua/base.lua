-- 不要なプラグインを読み込まないように
-- from https://github.com/wbthomason/dotfiles/blob/linux/neovim/.config/nvim/init.lua
local disabled_built_ins = {
	"gzip",
	"man",
	"matchit",
	"matchparen",
	"shada_plugin",
	"tarPlugin",
	"tar",
	"zipPlugin",
	"zip",
	"netrwPlugin",
}

for i = 1, 10 do
	vim.g["loaded_" .. disabled_built_ins[i]] = 1
end

-- 環境設定
vim.env.LANG = "en_US.UTF-8"
vim.o.mouse = "a"
vim.opt.path:append({ "**" })

-- 表示関係
vim.cmd("syntax on")
vim.cmd("syntax enable")
vim.o.notitle = true
vim.o.number = true
vim.o.wrap = true
vim.o.display = "lastline"
vim.o.showcmd = true
vim.o.laststatus = 2
vim.o.ruler = true
vim.o.signcolumn = "yes"

-- インデント設定
-- vim.o.softtabstop = 2
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
-- vim.o.smartindent = true
-- vim.o.smarttab = true

-- 検索時の設定
vim.o.wrapscan = true
vim.o.hlsearch = true

-- 対応した括弧に一瞬飛ばす
vim.o.showmatch = true
vim.o.matchtime = 1

-- insert mode 時でもバックスペースが動作するように
vim.o.backspace = "indent,eol,start"

-- insert mode 時のカーソルを変更
if vim.fn.has("vim_starting") == 1 then
	vim.o.t_SI = vim.o.t_SI .. "\27[6 q"
	vim.o.t_EI = vim.o.t_EI .. "\27[2 q"
	vim.o.t_SR = vim.o.t_SR .. "\27[4 q"
end

if vim.fn.has("clipboard") == 1 then
	vim.o.clipboard = "unnamedplus"
end

-- node_modules
vim.opt.wildignore:append({ "*/node_modules/*" })

-- view
vim.g.hybrid_use_iTerm_colors = 1
-- vim.cmd("colorscheme hybrid")
vim.cmd("highlight Normal ctermbg=none")
vim.cmd("highlight NonText ctermbg=none")
vim.cmd("highlight LineNr ctermbg=none")
vim.cmd("highlight Folded ctermbg=none")
vim.cmd("highlight EndOfBuffer ctermbg=none")
