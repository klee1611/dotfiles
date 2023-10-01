-- LSP
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "bashls",
                    "clangd",
                    "denols",
                    "pyright",
                    "rust_analyzer",
                    "gopls",
                    "lua_ls",
                    "tsserver",
                },
            })

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspcfg = require("lspconfig")
            lspcfg.bashls.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })
            lspcfg.clangd.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })
            lspcfg.denols.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })
            lspcfg.pyright.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })
            lspcfg.rust_analyzer.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })
        end,
    },
}
