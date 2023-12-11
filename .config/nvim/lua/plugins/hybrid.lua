local hybrid = {
    "camiha/vim-hybrid",
    config = function()
        vim.cmd("colorscheme hybrid")
        vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
    end
}

return {hybrid}
