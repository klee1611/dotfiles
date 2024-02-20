-- syntax highlighting, indentation, and more for many languages
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require 'nvim-treesitter.configs'
            configs.setup({
                ensure_installed = "all",
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true
                },
                auto_install = true,
            })
        end
    },
}
