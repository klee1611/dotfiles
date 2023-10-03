-- Indent line
return {
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("ibl").setup({
                char = "▏",
                show_first_indent_level = true,
                exclude = {
                    filetypes = {
                        'lspinfo',
                        'packer',
                        'checkhealth',
                        'help',
                        'man',
                        'dashboard',
                        'git',
                        'markdown',
                        'text',
                        'terminal',
                        'NvimTree',
                    },
                    buftypes = {
                        'terminal',
                        'nofile',
                        'quickfix',
                        'prompt',
                    },
                },
            })
        end
    },
}
