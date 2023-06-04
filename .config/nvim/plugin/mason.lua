require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		-- lua (for neovim)
		"lua_ls",
		-- system programming
		"clangd",
		"rust_analyzer",
		-- web development langs
		"html",
		"cssls",
		"tsserver",
		"jsonls",
		-- linter
		"eslint",
		"stylelint_lsp",
		"rome",
		-- frameworks
		"astro",
		"svelte",
		-- others
		-- "denols",
	},
	automatic_installation = true,
})

-- After setting up mason-lspconfig you may set up servers via lspconfig
require("lspconfig").lua_ls.setup({})
-- require("lspconfig").rust_analyzer.setup {}

require("lspconfig").tsserver.setup({})
require("lspconfig").eslint.setup({})
require("lspconfig").stylelint_lsp.setup({})

require("lspconfig").astro.setup({})

-- ...
