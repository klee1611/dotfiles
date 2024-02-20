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
        dependencies = { "nvim-tree/nvim-web-devicons" },
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
    -- Git diff views
    { "sindrets/diffview.nvim" },
    -- autopairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    -- Github Copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end
    },
    -- Tagbar
    {
        "simrat39/symbols-outline.nvim",
        config = true
    },
}
