require("base")
require("map")
require("commands")
require("plugins")

-- packer auto compile
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
