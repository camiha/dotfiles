local lsp = {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require('lspconfig')
        local util = require("lspconfig.util")

        -- npm i -g typescript typescript-language-server
        lspconfig.tsserver.setup({
            root_dir = function(...)
                return require("lspconfig.util").root_pattern("tsconfig.json")(...)
            end,
        })

        -- npm i -g vscode-langservers-extracted
        lspconfig.html.setup({})

        --Enable (broadcasting) snippet capability for completion
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        lspconfig.cssls.setup {
          capabilities = capabilities,
        }

        lspconfig.eslint.setup({
            on_attach = function(client, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                  buffer = bufnr,
                  command = "EslintFixAll",
                })
            end,
        })

        -- npm i -g stylelint-lsp
        lspconfig.stylelint_lsp.setup{
            filetypes = {
                "css",
                "scss",
            },
            settings = {
              stylelintplus = {
                autoFixOnSave = true,
              }
            }
          }

        -- npm i -g @tailwindcss/language-server
        lspconfig.tailwindcss.setup({
            root_dir = util.root_pattern('tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts')
        })

        -- npm i -g @astrojs/language-server
        lspconfig.astro.setup({})

        lspconfig.biome.setup({
            root_dir = util.root_pattern("biome.json"),
            single_file_support = false
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
