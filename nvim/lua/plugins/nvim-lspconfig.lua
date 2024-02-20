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
                    "elixirls",
                },
            })

            local ensure_installed = {
                "bashls",
                "clangd",
                "denols",
                "pyright",
                "rust_analyzer",
                "gopls",
                "lua_ls",
                "tsserver",
                "elixirls",
            }

            local on_attach = function()
                local bufopts = { noremap = true, silent = true, buffer = 0 }
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
                vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
                vim.keymap.set("n", "<space>f", function()
                    vim.lsp.buf.format({ async = true })
                end, bufopts)
                vim.keymap.set("n", "<space>df", vim.diagnostic.goto_next, bufopts)
            end

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
            --
            for _, lsp in pairs(ensure_installed) do
                lspconfig[lsp].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                })
            end
        end,
    },
}
