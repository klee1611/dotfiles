return {
	"stevearc/conform.nvim",
	branch = "nvim-0.9",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			-- Available formatters: https://github.com/stevearc/conform.nvim#formatters
			-- Use :Mason command to install formatters manually
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},

			-- uncomment if format on save is required automatically
			--[[
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
			--]]
		})
		vim.keymap.set({ "n", "v" }, "<leader>fm", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format whole file (in normal mode) or range (in visual mode)" })
	end,
}
