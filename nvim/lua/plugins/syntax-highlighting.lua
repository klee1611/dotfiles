-- syntax highlighting, indentation, and more for many languages
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter').setup()

            local ensure_installed = {
                "lua", "vim", "vimdoc", "query",
                "javascript", "typescript", "tsx",
				"json", "html", "css",
                "python", "go", "rust", "c", "cpp",
                "bash", "markdown", "markdown_inline",
                "yaml", "toml", "sql",
                "elixir", "heex", "latex",
            }

            local installed = require('nvim-treesitter').get_installed()
            local to_install = vim.tbl_filter(function(lang)
                return not vim.tbl_contains(installed, lang)
            end, ensure_installed)
            if #to_install > 0 then
                require('nvim-treesitter').install(to_install)
            end

            vim.api.nvim_create_autocmd('FileType', {
                callback = function(args)
                    pcall(vim.treesitter.start, args.buf)
                end,
            })
        end
    },
}
