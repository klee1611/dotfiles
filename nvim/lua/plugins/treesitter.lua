-- syntax highlighting, indentation, and more for many languages
return {
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = "maintained",
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true
                },
            })
        end
    },
}
