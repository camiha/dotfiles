require("base")
require("keymap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({{
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {'nvim-lua/plenary.nvim'},
  keys = {{"<leader>ff", "<cmd>Telescope find_files<cr>"}, {"<leader>fg", "<cmd>Telescope live_grep<cr>"},
          {"<leader>fb", "<cmd>Telescope buffers<cr>"}, {"<leader>fh", "<cmd>Telescope help_tags<cr>"}}
}})
