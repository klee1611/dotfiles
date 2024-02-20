return {
    -- statusline
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup({
                    options = {
                        theme = 'tokyonight'
                    }
                })
        end
    },
    -- colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        version = "*",
        config = function()
            require("tokyonight").setup({
                    style = "night",
                })
            vim.cmd("colorscheme tokyonight")
        end
    },
    -- Dashboard (start screen)
    {
      'goolord/alpha-nvim',
      dependencies = {"nvim-tree/nvim-web-devicons"},
    },
    -- LSP related
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                check_outdated_packages_on_open = false,
            },
        },
    },
    {"sindrets/diffview.nvim"},
}
