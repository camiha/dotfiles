

local formatter = {
    'mhartington/formatter.nvim',
    config = function()
        local util = require("formatter.util")
        local ts_default = {
            function()
                return {
                    exe = "prettierd",
                    args = {util.escape_path(util.get_current_buffer_file_path())},
                    stdin = true,
                    try_node_modules = true
                }
            end
        }
        local style_default = {
            function()
                return {
                    exe = "prettierd",
                    args = {util.escape_path(util.get_current_buffer_file_path())},
                    stdin = true,
                    try_node_modules = true
                }
            end
        }
        require('formatter').setup {
            logging = true,
            filetype = {
                javascript = ts_default,
                javascriptreact = ts_default,
                typescript = ts_default,
                typescriptreact = ts_default,
                css = style_default,
                scss = style_default,
								lua = {
								  require("formatter.filetypes.lua").stylua,
								}
            }
        }

        vim.keymap.set('n', '<leader>fm', ':Format<CR>')
        vim.keymap.set('n', '<leader>Fm', ':FormatWrite<CR>')

        -- format on save
        -- local augroup = vim.api.nvim_create_augroup
        -- local autocmd = vim.api.nvim_create_autocmd
        -- augroup("__formatter__", { clear = true })
        -- autocmd("BufWritePost", {
        --     group = "__formatter__",
        --     command = ":FormatWrite",
        -- })
    end
}

return {formatter}
