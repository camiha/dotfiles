local treesitter = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({
            with_sync = true,
            ensure_installed = {"c", "rust", "lua", "vim", "astro", "javascript", "typescript", "css", "scss", "json"}
        })()
    end
}

return {treesitter}
