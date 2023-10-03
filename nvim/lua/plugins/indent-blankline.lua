-- Indent line
return {
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("ibl").setup({
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
