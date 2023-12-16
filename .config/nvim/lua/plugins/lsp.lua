local lsp = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig"},
    config = function()
        local mason = require('mason')
        local masonlspconfig = require("mason-lspconfig")
        local lspconfig = require('lspconfig')

        mason.setup()
        masonlspconfig.setup({
            ensure_installed = {
            "html", "astro", "cssls", "tailwindcss", "stylelint_lsp", "tsserver", "eslint", "lua_ls"},
            automatic_installation = true
        })

        -- fontend settings
        -- markup
        lspconfig.html.setup({})
        lspconfig.astro.setup({})
        -- css
        lspconfig.cssls.setup({})
        lspconfig.stylelint_lsp.setup({})
        lspconfig.tailwindcss.setup({})
        -- ts/js
        lspconfig.tsserver.setup({})
        lspconfig.eslint.setup({
            root_dir = function(...)
                return require("lspconfig.util").root_pattern(".eslintrc.js", ".eslintrc.cjs", ".eslint.config.js")(...)
            end,
            on_attach = function(client, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                  buffer = bufnr,
                  command = "EslintFixAll",
                })
              end,
        })

        -- lua settings
        lspconfig.lua_ls.setup({})

        -- keymaps
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
                local opts = {
                    buffer = ev.buf
                }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({'n', 'v'}, '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>f', function()
                    vim.lsp.buf.format {
                        async = true
                    }
                end, opts)
            end
        })
    end
}

return {lsp}
