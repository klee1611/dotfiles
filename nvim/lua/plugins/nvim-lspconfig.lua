-- LSP
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = {
					"williamboman/mason.nvim",
				},
			},
			"hrsh7th/cmp-nvim-lsp", -- code completion
		},
		config = function()
			local ensure_installed = require("plugins.utils.common").mason_ensure_installed.lsp
			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed,
			})

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

			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			for _, lsp in pairs(ensure_installed) do
				vim.lsp.config[lsp] = {
					cmd = vim.lsp.config[lsp] and vim.lsp.config[lsp].cmd or { lsp },
					root_dir = vim.fs.root(0, { ".git" }),
					on_attach = on_attach,
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				}
				vim.lsp.enable(lsp)
			end
		end,
	},
}
