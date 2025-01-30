return {
	-- statusline
	{
		'nvim-lualine/lualine.nvim',
		config = function()
			require('lualine').setup({
				options = {
					theme = 'onedark',
				}
			})
		end
	},
	-- colorscheme
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		version = "*",
		config = function()
			require('onedark').setup {
				style = 'darker'
			}
			require('onedark').load()
		end
	},
	-- LSP related
	{
		"williamboman/mason.nvim",
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
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}     -- this is equalent to setup({}) function
	},
	-- telescope
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	-- file browser extension for telescope
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
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
			require("copilot_cmp").setup()
		end
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
	-- Tagbar
	{
		"simrat39/symbols-outline.nvim",
		config = true
	},
	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- git
	{
		"tpope/vim-fugitive",
		cmd = "Git",
		event = 'BufWinEnter',
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
		'jamestthompson3/nvim-remote-containers'
	}
}
