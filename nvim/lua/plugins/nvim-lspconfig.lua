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

			-- Configure diagnostics
			vim.diagnostic.config({
				virtual_text = {
					prefix = "■ ", -- Error marker
				},
				signs = true,
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
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

			-- Configure LSP servers using native vim.lsp.config
			-- Note: nvim-lspconfig is kept as dependency for Mason integration
			for _, lsp in pairs(ensure_installed) do
				-- Use vim.lsp.config directly - it has built-in defaults for known servers
				-- Only override what we need
				vim.lsp.config[lsp] = vim.tbl_deep_extend("force", vim.lsp.config[lsp] or {}, {
					on_attach = on_attach,
					capabilities = capabilities,
					settings = lsp == "lua_ls" and {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					} or (lsp == "basedpyright" and {
						basedpyright = {
							analysis = {
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
								diagnosticMode = "openFilesOnly",
								typeCheckingMode = "standard",
							},
						},
						python = {
							pythonPath = vim.fn.getcwd() .. "/.venv/bin/python"
						}
					} or {}),
				})
				vim.lsp.enable(lsp)
			end
		end,
	},
}
