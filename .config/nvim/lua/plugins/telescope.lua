local telescope = {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {'nvim-lua/plenary.nvim', "nvim-tree/nvim-web-devicons"},
    keys = {{"<leader>ff", "<cmd>Telescope find_files<cr>"}, {"<leader>fg", "<cmd>Telescope live_grep<cr>"},
            {"<leader>fb", "<cmd>Telescope buffers<cr>"}, {"<leader>fh", "<cmd>Telescope help_tags<cr>"}}
}

return {telescope}
