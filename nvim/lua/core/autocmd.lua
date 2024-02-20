-- format on save
local fmtGroup = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = fmtGroup,
    pattern = { "*.lua", "*.go", "*.html", "*.rs", "*.json", "*.py" },
    command = "lua vim.lsp.buf.format({ async = false })",
})
