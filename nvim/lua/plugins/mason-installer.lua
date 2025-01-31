return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	config = function()
		local mason_tool_installer = require("mason-tool-installer")
		local mason_ensure_installed = require("plugins.utils.common").mason_ensure_installed
		local ensure_installed = vim.tbl_flatten({
			mason_ensure_installed.lsp,
			mason_ensure_installed.dap,
			mason_ensure_installed.formatter,
			mason_ensure_installed.linter,
		})

		-- install mason packages
		mason_tool_installer.setup({
			ensure_installed = ensure_installed,
		})
	end,
}
