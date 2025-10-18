-- syntax highlighting, indentation, and more for many languages
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require 'nvim-treesitter.configs'
            configs.setup({
                ensure_installed = {
                    "lua", "vim", "vimdoc", "query",
                    "javascript", "typescript", "tsx",
					"json", "html", "css",
                    "python", "go", "rust", "c", "cpp",
                    "bash", "markdown", "markdown_inline",
                    "yaml", "toml", "sql",
                    "elixir", "heex",
                },
                ignore_install = { "ipkg" },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true
                },
                auto_install = true,
                sync_install = false,
            })
        end
    },
}
