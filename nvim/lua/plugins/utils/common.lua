local common = {
    mason_ensure_installed = {
        lsp = {
            "bashls", "clangd", "denols", "pyright", "rust_analyzer",
            "gopls", "lua_ls", "elixirls", "eslint",
        },
        dap = { "node2" },
        formatter = { "prettier", "stylua", "isort", "black" },
        linter = { "pylint", "eslint_d" },
    }
}

return common
