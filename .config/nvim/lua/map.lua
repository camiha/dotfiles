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

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

-- null_is
keymap.set("n", "<leader>fm", function()
	vim.lsp.buf.format({ async = true })
end)

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
keymap.set({ "n", "v" }, "<leader>hi", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
keymap.set("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to type definition
keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")

-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap.set("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show buffer diagnostics
keymap.set("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Show workspace diagnostics
keymap.set("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Show cursor diagnostics
keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
keymap.set("n", "[E", function()
	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap.set("n", "]E", function()
	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
-- keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- Call hierarchy
keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
-- keymap.set({ "n", "t" }, "<Leader>t", "<cmd>Lspsaga term_toggle<CR>")

-- neo-tree
-- keymap.set("n", "<Leader>nt", "<cmd>Neotree reveal<CR>")
keymap.set("n", "<Leader>t", "<cmd>Neotree reveal position=float<CR>")

keymap.set("n", "<C-z>", "<cmd>ZenMode<cr>", { silent = true })

-- -- Press <Tab> to expand or jump in a snippet. These can also be mapped separately
-- -- via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
-- keymap.set(
-- 	"i",
-- 	"<Tab>",
-- 	"v:lua.require('luasnip').expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'",
-- 	{ expr = true, silent = true }
-- )
-- -- -1 for jumping backwards.
-- keymap.set("i", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<CR>", { silent = true })
--
-- keymap.set("s", "<Tab>", "<cmd>lua require('luasnip').jump(1)<CR>", { silent = true })
-- keymap.set("s", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<CR>", { silent = true })
--
-- -- For changing choices in choiceNodes (not strictly necessary for a basic setup).
-- keymap.set(
-- 	"i",
-- 	"<C-E>",
-- 	"v:lua.require('luasnip').choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'",
-- 	{ expr = true, silent = true }
-- )
-- keymap.set(
-- 	"s",
-- 	"<C-E>",
-- 	"v:lua.require('luasnip').choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'",
-- 	{ expr = true, silent = true }
-- )
