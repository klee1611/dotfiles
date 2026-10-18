return {
	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "onedark",
				},
			})
		end,
	},
	-- colorscheme
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		version = "*",
		config = function()
			require("onedark").setup({
				style = "darker",
			})
			require("onedark").load()
		end,
	},
	-- LSP related
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
		opts = {
			ui = {
				check_outdated_packages_on_open = false,
			},
		},
	},
	-- Git diff views
	{ "sindrets/diffview.nvim" },
	-- autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- file browser extension for telescope
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	-- Github Copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			-- copilot-cmp is unmaintained (last upstream commit Dec 2024) and calls
			-- client.is_stopped() with a dot. Neovim 0.11+ deprecates that in favour
			-- of client:is_stopped(), and since is_available() runs on every cmp
			-- completion check the warning fires constantly. Patch the source table
			-- before setup; instances index into it via __index, so this covers the
			-- source cmp ends up registering.
			local source = require("copilot_cmp.source")
			source.is_available = function(self)
				-- upstream wrote `not self.client.name == "copilot"`, which parses as
				-- `(not name) == "copilot"` and is always false; spelled correctly here
				if self.client:is_stopped() or self.client.name ~= "copilot" then
					return false
				end

				return next(vim.lsp.get_clients({
					bufnr = vim.api.nvim_get_current_buf(),
					id = self.client.id,
				})) ~= nil
			end

			require("copilot_cmp").setup()
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
	-- Aerial code outline window
	{
		'stevearc/aerial.nvim',
		opts = {
			resize_to_content = true,
		},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
	},
	-- markdown preview
	{
		"OXY2DEV/markview.nvim",
		ft = { "markdown", "codecompanion" },
		opts = {
			preview = {
				filetypes = { "md", "markdown", "codecompanion" },
			},
		},
	},
	-- git
	{
		"tpope/vim-fugitive",
		cmd = "Git",
		event = "BufWinEnter",
	},
	-- git branch viewer
	{
		"rbong/vim-flog",
		lazy = true,
		cmd = { "Flog", "Flogsplit", "Floggit" },
		dependencies = {
			"tpope/vim-fugitive",
		},
	},
	-- dev container
	{
		"jamestthompson3/nvim-remote-containers",
	},
}
