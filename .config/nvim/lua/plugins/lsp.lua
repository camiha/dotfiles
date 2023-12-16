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
                -- frontend
                "html",
                "astro",
                "cssls",
                "tailwindcss",
                "stylelint_lsp",
                "tsserver",
                -- lua
                "lua_ls",
            },
            automatic_installation = true,
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

        -- lua settings
        lspconfig.lua_ls.setup({})
    end
}

return {lsp}
