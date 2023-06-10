local ls = require("luasnip")
ls.setup({})
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
